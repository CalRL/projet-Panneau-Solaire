// version V2.1 du 15/10/2005 
// maj : concerne la réception de la liaison série avec le paramètre DISABLE_INTS
//       contrôle des paquets multiples 
//       rajout de l'instruction suivante port_b_pullups (TRUE);
//       qui polarise le port B (évite de partir en interruption à cause de RB7 et RB6

#include <16F876a.h> //mettre #include <16F876.h> si PIC16F876-04 //
#device ICD=TRUE
#device *=16
#zero_ram
#use delay(clock=2500000)
#fuses NOWDT,XT, NOPUT, NOPROTECT, NODEBUG, BROWNOUT, LVP, NOCPD, NOWRT

#use rs232(baud=9600,xmit=PIN_C6,rcv=PIN_C7,bits=8,DISABLE_INTS)

#define led_on output_high(PIN_B1)
#define led_off output_low(PIN_B1)

/* variables du systeme */
int16 e,o,n,s;                         //mesure de luminosite recu du module HF sur 16 bits
int lum_est;                           //luminosite est
int lum_ouest;                         //luminosite ouest
int lum_nord;                          //luminosite nord
int lum_sud;                           //luminosite sud
int lum_m;                             //luminosite moyenne
int lum_eca;                           //ecart luminosite azimut
int lum_ece;                           //ecart luminosite elevation

int en_ve;                             //tension panneau solaire
int en_vs;                             //tension batterie
int en_ie;                             //intensite panneau
int en_is;                             //intensite batterie
int charge;                            //indicateur de charge
int full;                              //indicateur de charge complete
int empty;                             //indicateur de decharge

int ec_com;                            //indicateur eclairage
int ec_int;                            //niveau eclairage

int mo_ie;                             //courant moteur 1
int mo_ia;                             //courant moteur 2
int mo_ovle;                           //indicateur de surcharge elevation
int mo_ovla;                           //indicateur de surcharge azimut
int mot_e_sens;                        //sens de deplacement 0,1 ou 2
int mot_e_dure;                        //duree de deplacement en secondes
int mot_a_sens;                        //sens de deplacement 0,1 ou 2
int mot_a_dure;                        //duree de deplacement en secondes
int on;                                //indique un eventuel deplacement (0 pour arret)
int park;                              //indicateur pour demande parking
int mot_off;                           //indicateur de demande d'arret immediat des moteurs
int16 ang_azim;                        //angle azimut
int ang_elev;                          //angle elevation
int butee;                             //indicateur de butee

int cor_mode;                          //indique correction automatique si a 1 (0 pas de correction)
int cor_per;                           //periodicite en mn des corrections
int cor_seuil;                         //ecart de luminosite qui justifie une correction

int1 normal;                           //mode automatique
int1 manuel;                           //mode manuel
int nouvelle_trame_serie;

#include "can.c"                       //driver can a consulter pour bits utilises
#include "lcd.c"                       //driver lcd a consulter pour bits utilises
#include "gest_time.c"                 //gestion du temps pour les taches
#include "gest_can.c"                  //gestion du bus can
#include "gest_serie.c"                //gestion de la liaison serie
#include "gest_affi.c"                 //gestion affichages sur lcd
#include "gest_mode.c"                 //gestion modes de fonctionnement
#include "gest_clav.c"                 //gestion du clavier

/* declaration des fonctions */
void init();

/* programme principal */
void main()
{
   init();
   port_b_pullups (TRUE);
   while (1)
   {
      //output_high(pin_B7);
      gest_mode();
      gest_clavier();
      gest_affi();
      gest_serie();
      enable_interrupts(int_rda);         // autorisation interruption liaison serie
      //output_low(pin_B7);
      //delay_cycles(2);
   }
}

/* definitions des fonctions */
void init(){
   affi_init();                        // initialisation affichage LCD
   serie_init();                       // initialisation de la liaison serie
   can_init();                         // initialisation controleur CAN
   mode_init();                        // initialisation du mode de fonctionnement
   time_init();                        // initialisation gestion du temps
   enable_interrupts(global);          // autorisation des interruptions
   enable_interrupts(INT_RB);
   enable_interrupts(int_rda);         // autorisation interruption liaison serie
   //nouvelle_trame_serie = 0;

}

