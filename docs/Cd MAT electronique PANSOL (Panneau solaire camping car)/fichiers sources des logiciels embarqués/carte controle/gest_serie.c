/* gestion de la liaison serie */

/* definition des commandes recues */
#define c_e       0x45                      //commande eclairage
#define c_me      0x4a                      //commande moteur elevation
#define c_ma      0x4b                      //commande moteur azimut
#define c_c       0x4c                      //commande correction
#define data      0x52                      //demande data par "R"

/* variable pour la liaison serie */
int1 s_flag;
int is;
int buf_ser[50];

/* declaration des fonctions */
void gest_serie();                     //traitement des commandes et actions
void serie_init();                     //initialisation pour la liaison serie
void purge_srxbuf();                   //purge du tampon de reception serie

/* definitions des fonctions */
#int_rda                               //reception de la liaison serie en interruption
void RDA_isr(){
   int c;
   int i;
   
   c=getc();
   if (c!=0){                          //si non nul on stocke dans le buffer
      buf_ser[is]=c;
      is++;
   }
   if (c==13){                         //si c'est 0D fin de trame et on traite
      for (i=is;i<50;i++) {buf_ser[i]=0;}
      is=0;
      s_flag=1;
      nouvelle_trame_serie++;
      
   }
   else if (is==49){is=0;}             //si on arrive en fin de buffer sans avoir OD (pas bien !) on reinitialise
enable_interrupts(int_rda);         // autorisation interruption liaison serie
}

void gest_serie(){
   int a;

   if (s_flag==1){
      switch (buf_ser[0]) {
      case c_e:{                                               //commande eclairage
            ec_com=(buf_ser[1]-0x30)*10+(buf_ser[2]-0x30);
            ec_int=(buf_ser[3]-0x30)*10+(buf_ser[4]-0x30);
            can_sd_ecl();
            break;
         }
      case c_me:{                                              //commande moteur elevation
            mot_a_sens=0;
            mot_a_dure=0;
            mot_off=0;
            mot_e_sens=(buf_ser[1]-0x30)*10+(buf_ser[2]-0x30);
            mot_e_dure=(buf_ser[3]-0x30)*10+(buf_ser[4]-0x30);
            park=(buf_ser[5]-0x30);
            can_sd_mot();
            park=0;
            break;
         }
      case c_ma:{                                              //commande moteur azimut
            mot_e_sens=0;
            mot_e_dure=0;
            mot_off=0;
            mot_a_sens=(buf_ser[1]-0x30)*10+(buf_ser[2]-0x30);
            mot_a_dure=(buf_ser[3]-0x30)*10+(buf_ser[4]-0x30);
            park=(buf_ser[5]-0x30);
            can_sd_mot();
            if (park==1){cor_flag=0;}
            park=0;
            break;
         }
      case c_c:{                                               //commande correction
            a=(buf_ser[1]-0x30)*10+(buf_ser[2]-0x30);
            cor_seuil=(buf_ser[3]-0x30)*10+(buf_ser[4]-0x30);
            cor_per=(buf_ser[5]-0x30)*10+(buf_ser[6]-0x30);
            if (a == 0){cor_mode = 0;}                         //pas de correction automatique
            if (a == 1){cor_flag = 1;}                         //juste une correction manuelle
            if (a == 2){cor_mode = 1;}                         //correction automatique activee
            break;
         }
      case data:{
            printf("%X",0xfa);
            printf("%3U",lum_est);                             //data luminosite
            printf("%3U",lum_ouest);
            printf("%3U",lum_nord);
            printf("%3U",lum_sud);
            printf("%3U",lum_m);
            printf("%3U",lum_eca);
            printf("%3U",lum_ece);
            printf("%X",0);                                    //reserve
            printf("%3U",en_ve);                               //data energie
            printf("%3U",en_vs);
            printf("%3U",en_ie);
            printf("%3U",en_is);
            printf("%X",charge);
            printf("%X",full);
            printf("%X",empty);
            printf("%3U",ec_com);                              //data eclairage
            printf("%3U",ec_int);
            printf("%3U",mo_ie);                               //data moteur
            printf("%3U",mo_ia);
            printf("%X",mo_ovle);
            printf("%X",mo_ovla);
            printf("%X",on);
            printf("%3LU",ang_azim);
            printf("%3U",ang_elev);
            printf("%X",butee);
            printf("%X",cor_mode);                             //data correction
            printf("%3U",cor_per);
            printf("%3U",cor_seuil);
            printf("%X",13);
            break;
         }
      }
      purge_srxbuf();
      s_flag=0;
      nouvelle_trame_serie--;
      if (nouvelle_trame_serie==0)
         {
         purge_srxbuf();
         s_flag=0;
         }
   }
}

void serie_init(){
   is=0;
   s_flag=0;
   purge_srxbuf();
   enable_interrupts(int_rda);         // autorisation interruption liaison serie
}

void purge_srxbuf(){
   int i;
   for (i=0;i<50;i++){buf_ser[i]=0;}
}
