/* gestion du clavier */

/* variables */
int1 m_flag;                           //mode
int1 a_flag;                           //affichage
int1 e_flag;                           //eclairage
int1 d_flag;                           //deplacement
int1 c_flag;                           //correction

int code;

/* declaration des fonctions */
void gest_clavier();                   //gestion des appels clavier
void commande(byte data);              //traitement code

/* definitions des fonctions */
#INT_RB                //Port B any change on B4-B7
void RDA_RB(){
   int a,b,c,d,e;
   e=input(PIN_B5);
   if(e==0){
      a=input(PIN_C2);
      b=input(PIN_C1);
      c=input(PIN_B2);
      d=input(PIN_B4);
      code=a+b*2+c*4+d*8;
   }
}

void gest_clavier(){
   if (afm_flag==0){                      //on entre dans le mode menu si 0
      if (code==1){
         afm_flag=1;                      //touche 1 pour commande eclairage
         e_flag=1;
         affi_eclair();
      }
      else if (code==2){
         afm_flag=1;                      //touche 2 pour commande mode
         m_flag=1;
         affi_mode();
      }
      else if (code==3){
         afm_flag=1;                      //touche 3 pour commande choix d'affichage
         a_flag=1;
         affi_affi();
      }
      else if (code==4){
         afm_flag=1;                      //touche 4 pour commande deplacement
         d_flag=1;
         affi_mot();
      }
      else if (code==5){
         afm_flag=1;                      //touche 5 pour commande correction
         c_flag=1;
         affi_cor();
      }
   }
   if (afm_flag==1){

      if ((code==4)&&(m_flag==1)){commande(1);}
      if ((code==5)&&(m_flag==1)){commande(2);}

      if ((code==2)&&(e_flag==1)){commande(3);}
      if ((code==3)&&(e_flag==1)){commande(4);}
      if ((code==4)&&(e_flag==1)){commande(5);}
      if ((code==5)&&(e_flag==1)){commande(6);}
      if ((code==6)&&(e_flag==1)){commande(7);}
      if ((code==7)&&(e_flag==1)){commande(8);}
      if ((code==8)&&(e_flag==1)){commande(9);}
      if ((code==9)&&(e_flag==1)){commande(10);}

      if ((code==4)&&(a_flag==1)){commande(11);}
      if ((code==5)&&(a_flag==1)){commande(12);}
      if ((code==6)&&(a_flag==1)){commande(13);}
      if ((code==7)&&(a_flag==1)){commande(14);}
      if ((code==8)&&(a_flag==1)){commande(15);}

      if ((code==1)&&(d_flag==1)){commande(21);}      //moteur off
      if ((code==2)&&(d_flag==1)){commande(16);}      //parking
      if ((code==6)&&(d_flag==1)){commande(17);}      //commande azimut horaire 5s
      if ((code==7)&&(d_flag==1)){commande(18);}      //commande azimut antihoraire 5s
      if ((code==8)&&(d_flag==1)){commande(19);}      //commande elevation montee 5s
      if ((code==9)&&(d_flag==1)){commande(20);}      //commande elevation descente 5s

      if ((code==1)&&(c_flag==1)){commande(22);}

      if (code==12){commande(23);}                    //on quitte le mode menu par la touche #
   }
   code=0;
}

void commande(byte a){

   if(a==1){      //passage en mode automatique
      normal=1;
      manuel=0;
      code_affi=00;
      affi_auto();
      delay_ms(500);
      afm_flag=0;
      m_flag=0;
   }
   else if(a==2){ //passage en mode manuel
      normal=0;
      manuel=1;
      code_affi=01;
      affi_manu();
      delay_ms(500);
      afm_flag=0;
      m_flag=0;
   }
   else if(a==3){ //on eteint tout !
      ec_com=0;
      can_sd_ecl();
      affi_ecl();
      delay_ms(500);
      afm_flag=0;
      e_flag=0;
   }
   else if(a==4){ //on allume le pave
      ec_com=1;
      can_sd_ecl();
      affi_ecl();
      delay_ms(500);
      afm_flag=0;
      e_flag=0;
   }
   else if(a==5){ //on augmente le niveau
      if (ec_int!=15){ec_int=ec_int+3;}
      can_sd_ecl();
      affi_ecl();
      delay_ms(500);
      afm_flag=0;
      e_flag=0;
   }
   else if(a==6){ //on diminue le niveau
      if (ec_int!=0){ec_int=ec_int-3;}
      can_sd_ecl();
      affi_ecl();
      delay_ms(500);
      afm_flag=0;
      e_flag=0;
   }
   else if(a==7){    //on allume bloc 1
      ec_com=2;
      can_sd_ecl();
      affi_ecl();
      delay_ms(500);
      afm_flag=0;
      e_flag=0;
   }
   else if(a==8){    //on allume bloc 2
      ec_com=3;
      can_sd_ecl();
      affi_ecl();
      delay_ms(500);
      afm_flag=0;
      e_flag=0;
   }
   else if(a==9){    //on allume bloc 3
      ec_com=4;
      can_sd_ecl();
      affi_ecl();
      delay_ms(500);
      afm_flag=0;
      e_flag=0;
   }
   else if(a==10){   //on allume bloc 4
      ec_com=5;
      afm_flag=0;
      e_flag=0;
      can_sd_ecl();
      affi_ecl();
      delay_ms(500);
   }
   else if(a==11){   //affichage batterie
      code_affi=02;
      afm_flag=0;
      a_flag=0;
   }
   else if(a==12){   //affichage luminosite
      code_affi=03;
      afm_flag=0;
      a_flag=0;
   }
   else if(a==13){   //affichage eclairage
      code_affi=04;
      afm_flag=0;
      a_flag=0;
   }
   else if(a==14){   //affichage mode
      code_affi=05;
      afm_flag=0;
      a_flag=0;
   }
   else if(a==15){   //affichage defilant
      code_affi=01;
      afm_flag=0;
      a_flag=0;
   }
   else if(a==16){   //commande parking
      cor_flag=0;    //pas de correction si parking
      affi_park();
      mot_a_sens=0;
      mot_a_dure=0;
      mot_e_sens=0;
      mot_e_dure=0;
      mot_off=0;
      park=1;
      can_sd_mot();
      park=0;
      afm_flag=0;
      d_flag=0;
   }
   else if(a==17){   //commande azimut horaire 5s
      mot_a_sens=1;
      mot_a_dure=5;
      mot_e_sens=0;
      mot_e_dure=0;
      mot_off=0;
      park=0;
      can_sd_mot();
      afm_flag=0;
      d_flag=0;
   }
   else if(a==18){   //commande azimut antihoraire 5s
      mot_a_sens=2;
      mot_a_dure=5;
      mot_e_sens=0;
      mot_e_dure=0;
      mot_off=0;
      park=0;
      can_sd_mot();
      afm_flag=0;
      d_flag=0;
   }
   else if(a==19){   //commande elevation montee 5s
      mot_a_sens=0;
      mot_a_dure=0;
      mot_e_sens=1;
      mot_e_dure=5;
      mot_off=0;
      park=0;
      can_sd_mot();
      afm_flag=0;
      d_flag=0;
   }
   else if(a==20){   //commande elevation descente 5s
      mot_a_sens=0;
      mot_a_dure=0;
      mot_e_sens=2;
      mot_e_dure=5;
      mot_off=0;
      park=0;
      can_sd_mot();
      afm_flag=0;
      d_flag=0;
   }
      else if(a==21){   //commande arret moteur
      mot_a_sens=0;
      mot_a_dure=0;
      mot_e_sens=0;
      mot_e_dure=0;
      mot_off=1;
      park=0;
      can_sd_mot();
      mot_off=0;
      afm_flag=0;
      d_flag=0;
   }
   else if(a==22){   //commande de correction immediate
      cor_flag=1;
      afm_flag=0;
      c_flag=0;
   }
   else if(a==23){   //commande sortie du mode menu sans actions
      a_flag=0;
      c_flag=0;
      d_flag=0;
      e_flag=0;
      m_flag=0;
      afm_flag=0;

   }
}

