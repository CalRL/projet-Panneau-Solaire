// version V2.0 du 30/07/2005
// maj : aucune

#include <16F84A.h>
#device *=16
#zero_ram
#use delay(clock=2500000)

/* variables du systeme */

#include "clavier.c"                   //driver clavier a consulter pour bits utilises

/* declaration des fonctions */
void init();

/* programme principal */
void main()
{
   init();
   while (1)
   {
      gest_clavier();
   }
}

/* definitions des fonctions */
void init(){
   output_high(PIN_B7);
}
