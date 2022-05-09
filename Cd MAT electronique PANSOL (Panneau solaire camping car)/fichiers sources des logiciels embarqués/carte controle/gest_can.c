/* gestion du bus can */

/* identifiants bus can */
#define i_elum    0x100                   //emission vers le module luminosite
#define i_rlum    0x101                   //reception depuis le module luminosite
#define i_eecl    0x200                   //emission vers le module eclairage
#define i_recl    0x201                   //reception depuis le module eclairage
#define i_ebat    0x300                   //emission vers le module energie
#define i_rbat    0x301                   //reception depuis le module energie
#define i_emot_m  0x400                   //emission vers le module moteur pour demande de donnees
#define i_rmot    0x401                   //reception depuis le module moteur
#define i_emot_c  0x402                   //emission vers le module moteur pour commandes elevation

/* declaration des fonctions */
void can_receive();                       //reception bus can et recuperation des donnees
void can_sd_mot();                        //envoi de donnees vers module moteur
void can_sd_ecl();                        //envoi de donnees vers module eclairage
void can_sr_lum();                        //envoi request vers module luminosite
void can_sr_mot();                        //envoi request vers module moteur
void can_sr_en();                         //envoi request vers module energie

/* definitions des fonctions */
void can_receive(){
   if ( can_kbhit() ){                    //y a t il des donnees dans le buffer ?...
      if(can_getd(crx_id, &crxbuf[0], crx_len, rxstat)){ //...si oui lecture des donnees
         led_on;                          // change la LED system
         if (crx_id == i_rlum) {
            e=crxbuf[0]<<8;
            e=e+crxbuf[1];                //luminosite est
            o=crxbuf[2]<<8;
            o=o+crxbuf[3];                //luminosite ouest
            n=crxbuf[4]<<8;
            n=n+crxbuf[5];                //luminosite nord
            s=crxbuf[6]<<8;
            s=s+crxbuf[7];                //luminosite sud
         }
         if (crx_id == i_rbat) {
            en_ve=crxbuf[0];              //tension panneau
            en_ie=crxbuf[1];              //courant entree
            en_is=crxbuf[2];              //courant sortie
            en_vs=crxbuf[3];              //tension batterie
            charge=crxbuf[4];             //indicateur de charge
            full=crxbuf[5];               //indicateur de charge complete
            empty=crxbuf[6];              //indicateur de decharge
         }
         if (crx_id == i_rmot) {
            mo_ie=crxbuf[0];              //courant moteur elevation
            mo_ia=crxbuf[1];              //courant moteur azimut
            mo_ovle=crxbuf[2];            //surcharge moteur elevation
            mo_ovla=crxbuf[3];            //surcharge moteur azimut
            on=crxbuf[4];                 //indicateur de deplacement
            ang_azim=crxbuf[5];           //angle azimut
            ang_elev=crxbuf[6];           //angle elevation
            butee=crxbuf[7];              //butee
            if (ang_elev >= 100){
               ang_azim=ang_azim+270;
               ang_elev=ang_elev-100;
            }
         }
      }
   }
}

void can_sr_lum(){can_putd(i_elum,0,0,1,TRUE,TRUE);}     //identifiant i_elum, pas de donnees et request
void can_sr_mot(){can_putd(i_emot_m,0,0,1,TRUE,TRUE);}   //identifiant i_emot, pas de donnees et request
void can_sr_en(){can_putd(i_ebat,0,0,1,TRUE,TRUE);}      //identifiant i_ebat, pas de donnees et request

void can_sd_mot(){
   ctxbuf[0]=mot_a_sens;
   ctxbuf[1]=mot_a_dure;
   ctxbuf[2]=mot_e_sens;
   ctxbuf[3]=mot_e_dure;
   ctxbuf[4]=mot_off;
   ctxbuf[5]=park;
   can_putd(i_emot_c,&ctxbuf[0],6,1,TRUE,FALSE);   //6 octets de buffer
}

void can_sd_ecl(){
   ctxbuf[0]=ec_com;
   ctxbuf[1]=ec_int;
   can_putd(i_eecl, &ctxbuf[0],2,1,TRUE,FALSE);    //2 octets de buffer
}
