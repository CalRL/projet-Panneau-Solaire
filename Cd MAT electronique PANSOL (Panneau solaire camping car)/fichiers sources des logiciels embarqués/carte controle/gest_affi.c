/* gestion des affichages sur LCD */

int code_affi;

/* indicateur pour affichage cyclique sur LCD */
int1 afl_flag;                         //affichage luminosite
int1 afb_flag;                         //affichage batterie
int1 afe_flag;                         //affichage eclairage

/* definition des fonctions */
void affi_init();                      //initialisation de l'affichage LCD
void affi_lum();                       //affichage des informations de luminosite
void affi_bat();                       //affichage des informations d'energie
void affi_ecl();                       //affichage des informations d'eclairage
void affi_auto();                      //affichage mode automatique
void affi_manu();                      //affichage mode manuel
void affi_normal();                    //affichage mode manuel
void affi_defilant();                  //affichage mode manuel
void affi_mod();                       //affichage mode manuel
void affi_mat();                       //affichage mode manuel
void affi_cora();                      //affichage correction azimut
void affi_core();                      //affichage correction elevation
void affi_park();                      //affichage parking


/* definitions des fonctions */

void affi_init(){
   disp_lcd = TRUE;                    // validation affichage LCD
   lcd_init();                         // initialisation LCD
   afl_flag=1;                         // indicateur pour affichage luminosite a 1
   affi_mat();                         // message d'accueil
}

void gest_affi(){
   if(afr_flag==1){
      switch (code_affi) {
         case 00:  affi_normal();
         break;
         case 01:  affi_defilant();
         break;
         case 02:  affi_bat();
         break;
         case 03:  affi_lum();
         break;
         case 04:  affi_ecl();
         break;
         case 05:  affi_mod();
         break;
      }
      afr_flag=0;
   }
}

void affi_normal(){
   printf(displays, "\fBAT : U%3u ",en_vs);
   printf(displays, "I%3u ",en_is);
   printf(displays, "\nECL : ");
   if(ec_com==0){printf(displays, "all off");}
   if(ec_com==1){printf(displays, "niveau %3u",ec_int);}
   if(ec_com==2){printf(displays, "bloc 1 on");}
   if(ec_com==3){printf(displays, "bloc 2 on");}
   if(ec_com==4){printf(displays, "bloc 3 on");}
   if(ec_com==5){printf(displays, "bloc 4 on");}
}

void affi_defilant(){
   if (afg_flag==1){                            //si demande de modification par le timer
      if (afl_flag==1){                         //luminosite
         affi_lum();
         afl_flag=0;
         afb_flag=1;
      }
      else if (afb_flag==1){                    //energie
         affi_bat();
         afb_flag=0;
         afe_flag=1;
      }
      else if (afe_flag==1){                    //eclairage
         affi_ecl();
         afe_flag=0;
         afl_flag=1;
      }
      afg_flag=0;
   }
}

void affi_bat(){
   printf(displays, "\fB%3u",en_vs);
   printf(displays, "S%3u",en_is);
   printf(displays, "P%3u",en_ve);
   printf(displays, "E%3u",en_ie);
   printf(displays, "\nCh: %u",charge);
   printf(displays, "Fu: %u",full);
   printf(displays, "Em: %u",empty);
}

void affi_lum(){
   printf(displays, "\fO%3u",lum_ouest);
   printf(displays, "E%3u",lum_est);
   printf(displays, "N%3u",lum_nord);
   printf(displays, "S%3u",lum_sud);
   printf(displays, "\nM%3u",lum_m);
   printf(displays, " EA%3u",lum_eca);
   printf(displays, " EE%3u\n",lum_ece);
}

void affi_ecl(){
   if(ec_com==0){
      printf(displays, "\fpave: off\n");
   }
   if(ec_com==1){
      printf(displays, "\fpave: on\n");
      printf(displays, "niveau:  %3u",ec_int);
   }
   if(ec_com==2){
      printf(displays, "\fbloc 1: on\n");
   }
   if(ec_com==3){
      printf(displays, "\fbloc 2: on\n");
   }
   if(ec_com==4){
      printf(displays, "\fbloc 3: on\n");
   }
   if(ec_com==5){
      printf(displays, "\fbloc 4: on\n");
   }
}

void affi_mat(){
   printf(displays,"\fMAT ELECTRONIQUE");
   printf(displays,"\nV1.0 01 2005\n");
   delay_ms(2000);
   printf(displays,"\fSED-PANSOL50W");
   printf(displays,"\nBCAN-MAT V1.0\n");
   delay_ms(2000);
}

void affi_auto(){
   printf(displays,"\fMode automatique");
   printf(displays,"\nPANSOL V1.0\n");
}

void affi_cora(){
   printf(displays,"\fCorrection");
   printf(displays,"\nazimut\n");
}

void affi_core(){
   printf(displays,"\fCorrection");
   printf(displays,"\nelevation\n");
}

void affi_park(){
   printf(displays,"\fParking");
   printf(displays,"\nen cours\n");
}

void affi_manu(){
   printf(displays,"\fMode manuel");
   printf(displays,"\nPANSOL V1.0\n");
}

void affi_mode(){
   printf(displays,"\fMode ?");
   printf(displays,"\nchoix # 4 5");
}

void affi_eclair(){
   printf(displays,"\fEclairage ?");
   printf(displays,"\nchoix # 2a9");
}

void affi_affi(){
   printf(displays,"\fAffichage ?");
   printf(displays,"\nchoix # 4a8");
}

void affi_mot(){
   printf(displays,"\fMoteur ?");
   printf(displays,"\nchoix # 1 2 6a9");
}

void affi_cor(){
   printf(displays,"\fCorrection ?");
   printf(displays,"\nchoix # 1 ");
}

void affi_mod(){
   if(normal==1){affi_auto();}
   else {affi_manu();}
}
