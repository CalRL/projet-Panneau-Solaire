/* driver pour le clavier */
#define C1 input(PIN_A4)
#define C2 input(PIN_B5)
#define C3 input(PIN_B4)

#define LR1 output_low(PIN_A0)
#define LR2 output_low(PIN_A1)
#define LR3 output_low(PIN_A2)
#define LR4 output_low(PIN_A3)

#define HR1 output_high(PIN_A0)
#define HR2 output_high(PIN_A1)
#define HR3 output_high(PIN_A2)
#define HR4 output_high(PIN_A3)

/* variables du systeme */
int code;

/* declaration des fonctions */
int clavier();
void gest_clavier();                   //gestion des appels clavier
void gest_code();

/* definitions des fonctions */
void gest_clavier(){
   code=clavier();
   gest_code();
   code=0;
}

void gest_code(){
   if (code!=0){
      output_b(code);
      output_low(PIN_B7);
      delay_ms(20);
      output_high(PIN_B7);
   }
}

int clavier(){
   int cd;
   
   cd=0;
   LR1;
   LR2;
   LR3;
   LR4;
   if ((!C1)||(!C2)||(!C3)){
      while (cd==0){
         LR1;
         HR2;
         HR3;
         HR4;
         if (!C1){cd = 0x01;}
         else if (!C2){cd = 0x02;}
         else if (!C3){cd = 0x03;}
         HR1;
         LR2;
         HR3;
         HR4;
         if (!C1){cd = 0x04;}
         else if (!C2){cd = 0x05;}
         else if (!C3){cd = 0x06;}
         HR1;
         HR2;
         LR3;
         HR4;
         if (!C1){cd = 0x07;}
         else if (!C2){cd = 0x08;}
         else if (!C3){cd = 0x09;}
         HR1;
         HR2;
         HR3;
         LR4;
         if (!C1){cd = 0x0a;}
         else if (!C2){cd = 0x0b;}
         else if (!C3){cd = 0x0c;}
      }
      LR1;
      LR2;
      LR3;
      LR4;
      while ((!C1)||(!C2)||(!C3)){;}
   }
   return(cd);
}
