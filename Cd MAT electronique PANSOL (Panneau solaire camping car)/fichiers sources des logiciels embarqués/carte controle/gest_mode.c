/* gestion des modes de fonctionnement */

/* declaration des fonctions */
void mode_init();
void gest_mode();
void mode_manuel();
void mode_normal();
void gest_lum();
void gest_corr();

/* definition des fonctions */
void mode_init(){
   normal=1;                                    //mode automatique
   cor_seuil=4;                                 //seuil d'ecart de luminosite pour declencher une correction
   cor_per=15;                                  //periode entre 2 eventuelles correction en minutes
   cor_mode=1;                                  //mode correction activee
   code_affi=00;                                //affichage normal
   park=1;
   can_sd_mot();
   park=0;
}

void gest_mode(){
   if (normal==1){mode_normal();}
   if (manuel==1){mode_manuel();}
}

void mode_manuel(){}

void mode_normal(){
   if (lum_flag==1){
      can_sr_lum();                             //demande donnees module luminosite
      lum_flag=0;
   }
   if (mot_flag==1){
      can_sr_mot();                             //demande donnees module moteur
      mot_flag=0;
   }
   if (bat_flag==1){
      can_sr_en();                              //demande donnees module energie
      bat_flag=0;
   }
   gest_lum();
   gest_corr();
   can_receive();                               //y-a-t-il des donnees qui arrivent du bus can ?
}

void gest_corr(){
   lum_eca=0;
   lum_ece=0;
   if (n>(s+1)){
      lum_ece=n-s;                        //ecart luminosite elevation
      mot_e_sens=2;
   }
   else if (s>(n+1)){
      lum_ece=s-n;                        //ecart luminosite elevation
      mot_e_sens=1;
   }
   if (e>(o+1)){
      lum_eca=e-o;                        //ecart luminosite azimut
      mot_a_sens=2;
   }
   else if (o>(e+1)){
      lum_eca=o-e;                        //ecart luminosite azimut
      mot_a_sens=1;
   }
   if ((cor_flag==1)&&(lum_m>100)){       // correction ?
      if ((lum_eca > cor_seuil)&&(lum_eca>lum_ece)){           //azimut en priorite
         mot_a_dure = 1;
         mot_e_sens=0;
         can_sd_mot();
         affi_cora();
         delay_ms(200);

      }
      else if (lum_ece > cor_seuil){      //sinon eventuellement elevation
         mot_e_dure = 1;
         mot_a_sens=0;
         can_sd_mot();
         affi_core();
         delay_ms(200);
      }
      if ((lum_ece<cor_seuil)&&(lum_eca<cor_seuil)){
         cor_flag=0;
         mot_off=1;
         can_sd_mot();
         mot_off=0;
      }
   }
   if ((cor_flag==1)&&(lum_m<100)&&(ang_azim>=270)){       // parking, il fait nuit
      cor_flag=0;                         //pas de correction si parking
      affi_park();
      mot_a_sens=0;
      mot_a_dure=0;
      mot_e_sens=0;
      mot_e_dure=0;
      mot_off=0;
      park=1;
      can_sd_mot();
      park=0;
   }
}

void gest_lum(){
   int16 a;

   lum_est=e/4;
   lum_ouest=o/4;
   lum_nord=n/4;
   lum_sud=s/4;

   a=lum_est;
   a=a+lum_ouest;
   a=a+lum_nord;
   a=a+lum_sud;
   lum_m=a/4;
}
