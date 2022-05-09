// version V2.0 du 22/08/2005
// maj : rajout d'une routine de pr�sentation de l'�clairage � l'allumage
//       cette routine peut �tre supprim�e ou modifi�e

#include <16F876a.h> //mettre #include <16F876.h> si PIC16F876-04 //
#device ICD=TRUE
#device *=16
#use delay(clock=2500000)
#fuses XT, NOPROTECT, BROWNOUT, NOWDT
#zero_ram                                    //remet la ram a 0 (initialise les variables a 0)

#include "can.c"                             //driver can a consulter pour bits utilises

//IO broches connectees aux blocs de la matrice
#define BLOC1_OFF output_low(PIN_A0)
#define BLOC2_OFF output_low(PIN_A1)
#define BLOC3_OFF output_low(PIN_A2)
#define BLOC4_OFF output_low(PIN_A3)
#define BLOC1_ON  output_high(PIN_A0)
#define BLOC2_ON  output_high(PIN_A1)
#define BLOC3_ON  output_high(PIN_A2)
#define BLOC4_ON  output_high(PIN_A3)

/* identifiants bus can */
#define i_rmain  0x200                       //pour reception depuis module de controle

#define actcan_on output_high(PIN_B1)
#define actcan_off output_low(PIN_B1)

/* variables du systeme */
int ec_com;                                  //indicateur pour activation eclairage
int ec_int;                                  //niveau eclairage
int1 flag;

/* declaration des fonctions */
void init();
void gest_mat();
void gest_can();
void presentation();


/* programme principal */
void main()
{
   init();
   presentation();
   while (1)
   {
      actcan_off;
      gest_can();
      gest_mat();
   }
}

/* definition des fonctions */

void gest_can(){
   if ( can_kbhit() ){                                      //y a t il des donnees dans le buffer ?...
      if(can_getd(crx_id, &crxbuf[0], crx_len, rxstat)){    //...si oui lecture des donnees
         if (crx_id == i_rmain) {
            actcan_on;                                      //change la LED activite can
            ec_com=crxbuf[0];                               //commande
            ec_int=crxbuf[1];                               //intensite
            flag=1;
         }
      }
   }
}

void gest_mat(){
   if(flag==1){
      if (ec_com==0){
         BLOC1_OFF;
         BLOC2_OFF;
         BLOC3_OFF;
         BLOC4_OFF;
         set_pwm1_duty(0);
      }
      if (ec_com==1){
         BLOC1_OFF;
         BLOC2_OFF;
         BLOC3_OFF;
         BLOC4_OFF;
         set_pwm1_duty(ec_int*17);
      }
      if (ec_com==2){
         BLOC1_ON;
         BLOC2_OFF;
         BLOC3_OFF;
         BLOC4_OFF;
         set_pwm1_duty(0);
      }
      if (ec_com==3){
         BLOC1_OFF;
         BLOC2_ON;
         BLOC3_OFF;
         BLOC4_OFF;
         set_pwm1_duty(0);
      }
      if (ec_com==4){
         BLOC1_OFF;
         BLOC2_OFF;
         BLOC3_ON;
         BLOC4_OFF;
         set_pwm1_duty(0);
      }
      if (ec_com==5){
         BLOC1_OFF;
         BLOC2_OFF;
         BLOC3_OFF;
         BLOC4_ON;
         set_pwm1_duty(0);
      }
      flag=0;
   }
}

void init(){
   can_init();
   flag=1;;
   setup_timer_0(RTCC_INTERNAL|RTCC_DIV_1);
   setup_timer_1(T1_DISABLED);
   setup_timer_2(T2_DIV_BY_1,255,1);
   setup_ccp1(CCP_PWM);
}

void presentation()
{
   int i;

   BLOC1_ON;
   delay_ms(500);
   BLOC2_ON;
   delay_ms(500);
   BLOC3_ON;
   delay_ms(500);
   BLOC4_ON;
   delay_ms(500);
   BLOC1_OFF;
   BLOC2_OFF;
   BLOC3_OFF;
   BLOC4_OFF;
   delay_ms(500);
   for (i=0;i<255;i++)
      {
      set_pwm1_duty(i);
      delay_ms(50);
      }
   for (i=0;i<255;i++)
      {
      set_pwm1_duty(255-i);
      delay_ms(50);
      }

   BLOC1_OFF;
   BLOC2_OFF;
   BLOC3_OFF;
   BLOC4_OFF;
}
