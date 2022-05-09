// version V2.1 du 12/09/2005
// maj : sécurité des moteurs en lecture courant
//       réajustement des valeurs

#include <16F876a.h> //mettre #include <16F876.h> si PIC16F876-04 //
#device ICD=TRUE
#device *=16
//#device adc=10
#use delay(clock=2500000)
#fuses XT, NOPROTECT, BROWNOUT, NOWDT
#zero_ram                              //remet la ram a 0 (initialise les variables a 0)

#include "can.c"                       //driver can a consulter pour bits utilises

/* identifiants bus can */
#define i_m_m  0x400                   //reception d'une demande de donnee
#define i_mo   0x401                   //identifiant pour reponse au module de controle
#define i_m_c  0x402                   //reception d'un commande moteur

/* declaration des e/s */
#define elev_sens_high output_high(PIN_A4)       //sens moteur elevation
#define elev_sens_low output_low(PIN_A4)
#define elev_enable_high output_high(PIN_A5)     //validation moteur elevation
#define elev_enable_low output_low(PIN_A5)

#define azim_sens_high output_high(PIN_A2)       //sens moteur elevation
#define azim_sens_low output_low(PIN_A2)
#define azim_enable_high output_high(PIN_A3)     //validation moteur elevation
#define azim_enable_low output_low(PIN_A3)

#define elev_rel_sens_high output_high(PIN_B5)   //sens relais elevation
#define elev_rel_sens_low output_low(PIN_B5)
#define elev_rel_enable_high output_high(PIN_B4) //validation relais elevation
#define elev_rel_enable_low output_low(PIN_B4)

#define led_on output_high(PIN_B1)       //led systeme
#define led_off output_low(PIN_B1)

/* variables du systeme */
int16 mo_ie;                           //courant moteur 1
int16 mo_ia;                           //courant moteur 2
int mo_ovle;                           //indicateur de surcharge elevation
int mo_ovla;                           //indicateur de surcharge azimut
int mot_e_sens;                        //sens de deplacement 0,1 ou 2
int mot_e_dure;                        //duree de deplacement en secondes
int mot_a_sens;                        //sens de deplacement 0,1 ou 2
int mot_a_dure;                        //duree de deplacement en secondes
int on;                                //indique un eventuel deplacement
int park;                              //a 1 si demande parking depuis module de controle
int mot_off;                           //a 1 si demande arret depuis module de controle
int1 but_b;                            //a 1 si butee haute
int1 but_h;                            //a 1 si butee basse
int1 but_d;                            //a 1 si butee droite
int1 but_g;                            //a 1 si butee gauche
int ang_elev;                          //angle elevation
int ang_azim;                          //angle azimut
int butee;                             //etat des butees

long pos_elev,pos_azim;                //comptage des tops des codeurs

/* indicateurs des taches activees periodiquement */
int1 off_flag;                         //indicateur de mise a l'arret
int1 mes_flag;                         //indicateur de declenchement mesure i
int16 msa;                             //tick de comptage azimut
int16 mse;                             //tick de comptage elevation
int16 mst;                             //tick de comptage du time out moteur
int16 msc;                             //tick de comptage pour acquisition courant

/* declaration des fonctions */
void init();
void mes_mot();
void gest_can();
void gest_mot();

#int_ccp1
void isr_cpp1() {
   if (on==3){
      pos_azim=pos_azim+1;
   }
   else if (((on==4)||(on==6))&&(pos_azim>>0)){
      pos_azim=pos_azim-1;
   }
}

#int_ccp2
void isr_cpp2() {
   if (on==1){
      pos_elev=pos_elev+1;
   }
   else if (((on==2)||(on==5))&&(pos_elev>>0)){
      pos_elev=pos_elev-1;
   }
}

/* timer des taches appele par interruption */
#int_timer2
void isr_timer2(void) {
   msc++;
   if (msc == 100){
      mes_flag = 1;
      msc=0;
      }
   if ((on != 0)&&(park==0)){mst++;}                 //timer qui est appele toutes les ms par une interruption du timer2
   if ((mst >= mse)&&(park==0)){
      off_flag = 1;
      mst=0;
      }       //on incremente mst si moteur on, qd mst>=mse on positionne flag pour arret
   if ((mst >= msa)&&(park==0)){
      off_flag = 1;
      mst=0;
      }       //on incremente mst si moteur on, qd mst>=msa on positionne flag pour arret
}

/* programme principal */
void main()
{
   init();
   while (1)
   {
      mes_mot();                       //mesure des courants
      gest_mot();                      //gestion des moteurs
      gest_can();                      //gestion bus can
   }
}

/* definition des fonctions */

void gest_mot(){
   if (on==0){
      if ((mot_e_sens==1)&&(but_h==0)){  //elevation montee
         mse=mot_e_dure*500;
         elev_rel_sens_high;
         elev_rel_enable_high;
         delay_ms(100);
         but_b=0;
         on=1;
      }
      if ((mot_e_sens==2)&&(but_b==0)){  //elevation descente
         mse=mot_e_dure*500;
         elev_rel_sens_low;
         elev_rel_enable_high;
         delay_ms(100);
         but_h=0;
         on=2;
      }
      if ((mot_a_sens==1)&&(but_d==0)){  //azimut sens horaire
         msa=mot_a_dure*500;
         azim_sens_high;
         azim_enable_high;
         delay_ms(100);
         but_g=0;
         on=3;
      }
      if ((mot_a_sens==2)&&(but_g==0)){  //azimut sens anti horaire
         msa=mot_a_dure*500;
         azim_sens_low;
         azim_enable_high;
         delay_ms(100);
         but_d=0;
         on=4;
      }
      if (park==1){                      //parking
         if (but_g==0){
            azim_sens_low;
            azim_enable_high;
            on=5;
         }
         else if (but_b==0){
            elev_rel_sens_low;
            elev_rel_enable_high;
            on=6;
         }
         else if ((but_b==1)&&(but_g==1)){
            pos_azim=0;
            pos_elev=0;
            ang_elev=0;
            ang_azim=0;
            park=0;
         }
      }
   }
   if (on != 0){
      if ((off_flag == 1)||(mot_off==1)){ //on arrete les moteurs ?
         azim_enable_low;
         elev_rel_enable_low;
         mot_e_sens=0;                    //on annule les ordres de mise en marche
         mot_a_sens=0;
         mst=0;
         on=0;                            //pas de deplacement
         off_flag=0;
      }
   }
   butee=but_h+(but_b*2)+(but_g*4)+(but_d*8);         //calcul de l'indicateur butee
}


void gest_can(){
   if ( can_kbhit() ){   //y a t il des donnees dans le buffer ?...
      if(can_getd(crx_id, &crxbuf[0], crx_len, rxstat)){ //...si oui lecture des donnees
         if (crx_id == i_m_m) {
            led_on;                                      //change la LED system
            ctxbuf[0]=mo_ie;
            ctxbuf[1]=mo_ia;
            ctxbuf[2]=mo_ovle;
            ctxbuf[3]=mo_ovla;
            ctxbuf[4]=on;
            ctxbuf[5]=ang_azim;
            ctxbuf[6]=ang_elev;
            ctxbuf[7]=butee;
            can_putd(i_mo,&ctxbuf[0],8,1,1,0);           //reponse avec 5 octets de buffer
            mo_ovle=0;                                   //raz indicateur de surcharge apres envoi
            mo_ovla=0;                                   //raz indicateur de surcharge apres envoi
         }
         if (crx_id == i_m_c) {
            led_on;                                      //change la LED system
            mot_a_sens=crxbuf[0];                        //sens moteur elevation
            mot_a_dure=crxbuf[1];                        //duree moteur elevation
            mot_e_sens=crxbuf[2];                        //sens moteur azimut
            mot_e_dure=crxbuf[3];                        //duree moteur azimut
            mot_off=crxbuf[4];
            park=crxbuf[5];
         }
      }
   }
   led_off;
}

void mes_mot(){
   int16 a;

   if (mes_flag==1){
      ang_azim=pos_azim/77;
      ang_elev=pos_elev/166;
      if (pos_azim > 19635){
         ang_elev = ang_elev + 100;
      }

      set_adc_channel(1);
      delay_us(10);
      a=read_adc();
      mo_ie = a/1;
      if (a>200){
         off_flag=1;                   //arret si surcharge
         mo_ovle=1;
         if(on==1){but_h=1;}           //si montee alors butee haute
      }
      if ((a<45)&&((on==2)||(on==6))){
         but_b=1;                      //alors butee basse
         off_flag=1;                   //si descente et plus de courant
      }
      set_adc_channel(0);
      delay_us(10);
      a=read_adc();
      mo_ia = a/1;
      if (a>120){
         off_flag=1;                   //arret si surcharge
         mo_ovla=1;
         if((on==3)||(on==5)){
            but_g=1;
            but_d=0;
         }                             //si gauche alors butee gauche
         if(on==4){
            but_d=1;
            but_g=0;
         }                             //si droite alors butee droite
      }
      mes_flag=0;
   }
}

void init(){
   can_init();
   elev_sens_low;
   elev_enable_high;
   elev_rel_enable_low;
   azim_enable_low;
   mst=0;
   msc=0;
   on=0;
   park=0;
   mo_ovle=0;
   mo_ovla=0;
   but_b=0;
   but_h=0;
   but_g=0;
   but_d=0;
   off_flag=0;
   mot_e_sens=0;                 //on annule les ordres de mise en marche
   mot_a_sens=0;
   mst=0;
   mse=500;
   msa=500;
   setup_adc_ports(RA0_RA1_RA3_ANALOG);
   setup_adc(ADC_CLOCK_INTERNAL);
   setup_ccp1(CCP_CAPTURE_RE);    // Configure CCP1 to capture rise
   setup_ccp2(CCP_CAPTURE_RE);    // Configure CCP2 to capture fall
   enable_interrupts(INT_CCP2);   // Setup interrupt on falling edge
   enable_interrupts(INT_CCP1);   // Setup interrupt on falling edge
   setup_timer_2(T2_DIV_BY_16,8,5);    // parametrage du timer 2
   setup_timer_1(T1_INTERNAL);    // Start timer 1
   enable_interrupts(INT_TIMER2);      // autorisation interruption timer2
   enable_interrupts(GLOBAL);          // autorisation de toutes les interruptions (afin de prendre en compte timer2)
}
