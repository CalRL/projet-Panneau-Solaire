/* gestion du temps et des taches */

/* definition des indicateurs des taches */
int1 lum_flag;                         //demande donnees luminosite declenche periodiquement
int1 bat_flag;                         //demande donnees batterie declenche periodiquement
int1 mot_flag;                         //demande donnees moteur declenche periodiquement
int1 cor_flag;                         //gestion de la correction declenche periodiquement
int1 afg_flag;                         //gestion affichage general declenche periodiquement
int1 afm_flag;                         //indicateur affichage menu pour gel affichage general
int1 afr_flag;                         //indicateur raffraichissement affichage

/* compteurs pour periodicites des taches */
int16 mst;
int16 msa;
int16 msc;
int16 msl;
int16 msb;
int16 msm;
int16 msr;

/* initialisation gestion du temps */
void time_init(){
   setup_timer_2(T2_DIV_BY_16,8,5);    // parametrage du timer 2
   enable_interrupts(INT_TIMER2);      // autorisation interruption timer2
}

/* indicateurs des taches activees periodiquement */
#int_timer2
void isr_timer2(void) {
   mst++;                               //timer qui est appele toutes les ms par une interruption du timer2
   if (mst == 97){
      msl++;
      if (msl>5){
         lum_flag = 1;
         msl=0;
      }
   }
   if ((mst == 97)&&(afm_flag==0)){
      msr++;
      if (msr>10){
         afr_flag = 1;
         msr=0;
      }
   }
   if (mst == 97){
      msb++;
      if (msb>4){
         bat_flag = 1;
         msb=0;
      }
   }
   if (mst == 97){
      msm++;
      if (msm>7){
         mot_flag = 1;
         msm=0;
      }
   }
   if (afm_flag==0){                   //gel de l'affichage si menu
      msa++;
      if (msa>1958){
         afg_flag = 1;                 //flag pour valider le defilement de l'affichage
         msa=0;
      }
   }
   if ((mst == 97)&&(cor_mode==1)){   //declenchement correction si mode automatique
      msc++;
      if (msc>(cor_per*600)){
         cor_flag = 1;
         msc=0;
      }
   }
   if (mst == 97){
      mst = 0;
      led_off;
      }
}
