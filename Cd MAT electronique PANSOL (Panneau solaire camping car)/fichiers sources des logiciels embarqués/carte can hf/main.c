// version V2.0 du 23/08/2005 //
// maj : paquets re�us en ASCII //

#include <16F876a.h> //mettre #include <16F876.h> si PIC16F876-04 //
#device ICD=TRUE
#device *=16
#zero_ram                           //remet la ram a 0 (initialise les variables a 0)
#use delay(clock=2500000)
#fuses XT, NOPROTECT, BROWNOUT, NOWDT
#use rs232(baud=9600,xmit=PIN_C6,rcv=PIN_C7,bits=8)

#include "can.c"                    //driver can a consulter pour bits utilises

/* identifiants bus can */
#define i_emain   0x101             //pour emission vers module de controle
#define i_rmain   0x100             //pour reception depuis module de controle

/* les commandes des e/s */
#define actcan_on output_high(PIN_B1)
#define actcan_off output_low(PIN_B1)

#define acthf_on output_high(PIN_B2)
#define acthf_off output_low(PIN_B2)

#define pwr_on output_low(PIN_A3)
#define pwr_off output_high(PIN_A3)

/* variable pour la liaison serie */
int buf_ser[50];
int1 s_flag;
int is;

/* indicateurs des taches activees periodiquement */
int16 mst;                          //tick d'horloge

/* declaration des fonctions */
void init();
void purge_srxbuf();                   //purge du tampon de reception serie
void gest_can();
void gest_serie();                     //traitement des commandes et actions

/* timer des taches appele par interruption */
#int_timer2
void isr_timer2(void) {
   mst++;                           //timer qui est appele toutes les ms par une interruption du timer2
   if (mst >= 1000){
      ctxbuf[0] = 0;
      ctxbuf[1] = 0;
      ctxbuf[2] = 0;
      ctxbuf[3] = 0;
      ctxbuf[4] = 0;
      ctxbuf[5] = 0;
      ctxbuf[6] = 0;
      ctxbuf[7] = 0;
      mst = 0;
   }        //on recommence !
}

#int_rda                               //reception de la liaison serie en interruption
void RDA_isr(){
   int c;


   c=getc();
   if (c!=0){                         //si non nul on stocke dans le buffer
      buf_ser[is]=c;
      is++;
   }
   if (buf_ser[17]==66){
      mst=0;                          //si c'est B fin de trame et on traite
      s_flag=1;
   }
   if (c==65){
      buf_ser[0]=65;                  //si c'est A debut de trame
      is=1;
   }
   if (is==49){
      is=0;
      purge_srxbuf();
   }                                  //si on arrive en fin de buffer sans avoir B (pas bien !) on reinitialise
}

/* programme principal */
void main()
{
   init();
   while (1)
   {
      actcan_off;
      acthf_off;
      gest_serie();
      gest_can();
   }
}

void gest_serie(){
   int i;
   int16 a,b,c,s;

   if ((s_flag==1)&&(buf_ser[0]==65)){
      acthf_on;
      ctxbuf[0] = 0;
      ctxbuf[1] = 0;
      ctxbuf[2] = 0;
      ctxbuf[3] = 0;
      ctxbuf[4] = 0;
      ctxbuf[5] = 0;
      ctxbuf[6] = 0;
      ctxbuf[7] = 0;

      for (i=0;i<4;i++){
         a = buf_ser[4*i+1];
         if (a !=0x20){
            s=(a-0x30)*1000;
         }
         else{
            s=0;
         }
         a = buf_ser[4*i+2];
         if (a !=0x20){
            s=(a-0x30)*100;
         }
         a = buf_ser[4*i+3];
         if (a !=0x20){
            s=s+((a-0x30)*10);
         }
         a = buf_ser[4*i+4];
         if (a !=0x20){
            s=s+((a-0x30)*1);
         }
         ctxbuf[2*i] = s>>8;                    //un octet de poids fort
         ctxbuf[2*i+1] =s & 0x00ff;             //juste l'octet de poids faible

      }
      purge_srxbuf();
      s_flag=0;
   }
}

void gest_can(){
   if ( can_kbhit() ){   //y a t il des donnees dans le buffer ?...
      if(can_getd(crx_id, &crxbuf[0], crx_len, rxstat)){ //...si oui lecture des donnees
         if (crx_id == i_rmain) {
                  actcan_on;             // change la LED system en cas de reception
                  can_putd(i_emain, &ctxbuf[0], 8,1,1,0);        //reponse avec 8 octets du buffer ctxbuf
         }
      }
   }
}

void init(){
   can_init();
   purge_srxbuf();
   s_flag=0;
   is=0;
   setup_timer_2(T2_DIV_BY_16,8,5);    // parametrage du timer 2
   enable_interrupts(INT_TIMER2);      // autorisation interruption timer2
   enable_interrupts(int_rda);         // autorisation interruption liaison serie
   enable_interrupts(GLOBAL);          // autorisation de toutes les interruptions (afin de prendre en compte timer2)
   pwr_on;
   delay_ms(1000);
}

void purge_srxbuf(){
   int i;
   for (i=0;i<50;i++){buf_ser[i]=0;}
}
