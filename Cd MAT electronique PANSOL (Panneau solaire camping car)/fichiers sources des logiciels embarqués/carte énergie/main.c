// version V2.0 du 27/08/2005
// maj : nouvelle valeur pour le calcul des tension PANSOL et VBAT

#include <16F876a.h> //mettre #include <16F876.h> si PIC16F876-04 //
#device ICD=TRUE
#device *=16
#device ADC=10
#use delay(clock=2500000)
#fuses XT, NOPROTECT, BROWNOUT, NOWDT
#zero_ram                           //remet la ram a 0 (initialise les variables a 0)

#include "can.c"                    //driver can a consulter pour bits utilises

/* identifiants bus can */
#define i_ren    0x301              //emission vers le module de controle
#define i_rmain  0x300              //reception depuis le module de controle

/* variables du systeme */
int16 en_ve;                         //tension d'entree
int16 en_vs;                         //tension de sortie
int16 en_ie;                         //courant d'entree
int16 en_is;                         //courant de sortie
int charge;                          //indicateur de charge
int full;                            //indicateur de charge complete
int empty;                           //indicateur de decharge

/* indicateurs des taches activees periodiquement */
int1 mes_flag;                       //indicateur pour mesure
int1 calc_flag;                      //indicateur pour calcul
int16 mst;

int j;                              //compteurs de boucle
int table[18];

/* declaration des fonctions */
void init();
void gest_can();
void gest_bat();
void mesure();
void calcul();

/* timer des taches appele par interruption */
#int_timer2
void isr_timer2(void) {
   mst++;                               //timer qui est appele toutes les ms par une interruption du timer2
   if (mst == 500){mes_flag = 1;}
   if (mst == 500){mst = 0;}
}

#define led_on output_high(PIN_B1)
#define led_off output_low(PIN_B1)
#define ON output_low(PIN_A5)
#define OFF output_high(PIN_A5)

/* programme principal */
void main()
{
   init();
   while (1)
   {
      led_off;
      gest_bat();
      mesure();
      calcul();
      gest_can();
   }
}

/* definitions des fonctions */

void gest_bat(){
      if (en_vs > 137){
         full = 1;
         //OFF;         //limitation de la charge de la batterie
      }
      if (en_vs < 134) {
         full = 0;
         //ON;          //activation de la charge
      }
      if (en_ie > (en_is+1)){charge = 1;}
      else {charge = 0;}

      if (en_vs < 114){empty = 1;}
      else {empty = 0;}
}

void mesure(){
   int16 a;

   if (mes_flag==1){

      set_adc_channel(0);
      delay_us(100);
      a=read_adc();
      a = (a*20)/100;      //en_ve
      table[j] = a;

      set_adc_channel(1);
      delay_us(100);
      a=read_adc();
      a = (a*1)/3;       //en_ie
      table[j+4] = a;

      set_adc_channel(2);
      delay_us(100);
      a=read_adc();
      a = (a*20)/100;      //en_vs
      table[j+8] = a;

      set_adc_channel(3);
      delay_us(100);
      a=read_adc();
      a = (a*1)/3;        //en_is
      table[j+12] = a;

      j++;
      if(j>=4){j=0;}

      mes_flag=0;
      calc_flag=1;                     //indicateur pour calcul
   }
}

void calcul(){
   int16 somme;                    //variable pour calcul
   int i;                          //compteurs de boucle

   if (calc_flag==1){
      somme=0;
      for (i=0;i<=3;i++){somme=somme+table[i];}
      en_ve=somme/4;

      somme=0;
      for (i=4;i<=7;i++){somme=somme+table[i];}
      en_ie=somme/4;

      somme=0;
      for (i=8;i<=11;i++){somme=somme+table[i];}
      en_vs=somme/4;

      somme=0;
      for (i=12;i<=15;i++){somme=somme+table[i];}
      en_is=somme/4;

      calc_flag=0;
   }
}


void gest_can(){
   if ( can_kbhit() ){   //y a t il des donnees dans le buffer ?...
      if(can_getd(crx_id, &crxbuf[0], crx_len, rxstat)){ //...si oui lecture des donnees
         if (crx_id == i_rmain) {
            led_on;             // change la LED system
            ctxbuf[0]=en_ve;
            ctxbuf[1]=en_ie;
            ctxbuf[2]=en_is;
            ctxbuf[3]=en_vs;
            ctxbuf[4]=charge;
            ctxbuf[5]=full;
            ctxbuf[6]=empty;
            can_putd(i_ren, &ctxbuf[0], 7,1,1,0);       //reponse avec 7 octets de buffer
         }
      }
   }
}

void init(){
   can_init();
   setup_adc_ports( ALL_ANALOG );
   setup_adc(ADC_CLOCK_DIV_2);
   setup_timer_2(T2_DIV_BY_16,8,5);    // parametrage du timer 2
   enable_interrupts(INT_TIMER2);      // autorisation interruption timer2
   enable_interrupts(GLOBAL);          // autorisation de toutes les interruptions (afin de prendre en compte timer2)
}
