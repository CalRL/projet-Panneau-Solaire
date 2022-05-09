// version V2.0 du 23/08/2005
// maj : transmission en ASCII

#include <16F876a.h> //mettre #include <16F876.h> si PIC16F876-04 //
#device ICD=TRUE
#device *=16
#device ADC=10
#use delay(clock=4000000)
#fuses XT, NOPROTECT, BROWNOUT, NOWDT

#zero_ram                           //remet la ram a 0 (initialise les variables a 0)
#use rs232(baud=9600,xmit=PIN_C6,rcv=PIN_C7,bits=8)

#define led_on output_high(PIN_B1)
#define led_off output_low(PIN_B1)
#define pwr_on output_low(PIN_C2)
#define pwr_off output_high(PIN_C2)

/* variables du systeme */
int16 lum_est;                         //luminosite est
int16 lum_ouest;                       //luminosite ouest
int16 lum_nord;                        //luminosite nord
int16 lum_sud;                         //luminosite sud

/* indicateurs des taches activees periodiquement */
int1 mes_flag;                         //indicateur declenchement mesure
int1 ser_flag;                         //indicateur declenchement emission serie
int16 mst;                             //tick d'horloge

/* declaration des fonctions */
void init();
void mesure();
void gest_ser();

/* timer des taches appele par interruption */
#int_timer2
void isr_timer2(void) {
   mst++;                              //timer qui est appele toutes les ms par une interruption du timer2
   if (mst == 200){mes_flag = 1;}      //test de la luminosite canal 0 est (en ms)
   if (mst == 500){ser_flag = 1;}      //calcule et preparation des donnees
   if (mst == 500){mst = 0;}           //on recommence !
}

/* programme principal */
void main()
{
   init();
   while (1)
   {
      mesure();
      gest_ser();
   }
}

/* definitions des fonctions */

void gest_ser(){
   int16 a;

   if (ser_flag==1){                 //faut-il emettre ?...
      led_on;                        //on allume la led en debut d'emission serie
      putc(65);                      //A pour debut de trame
      printf("%4LU",lum_est);
      printf("%4LU",lum_ouest);
      printf("%4LU",lum_nord);
      printf("%4LU",lum_sud);
      putc(66);                      //B pour fin de trame
      ser_flag=0;
      led_off;                       //on eteint la led en fin d'emission serie
   }
}

void mesure(){
   if (mes_flag==1){
      set_adc_channel(0);              //mesure luminosite est sur 10 bits
      delay_us(100);
      lum_est=1024-read_adc();         //on complemente sur 10 bits

      set_adc_channel(1);
      delay_us(100);
      lum_ouest=1024-read_adc();

      set_adc_channel(2);
      delay_us(100);
      lum_nord=1024-read_adc();

      set_adc_channel(3);
      delay_us(100);
      lum_sud=1024-read_adc();

      mes_flag=0;
   }
}

void init(){
   setup_port_a(ALL_ANALOG);
   setup_adc(ADC_CLOCK_DIV_2);
   pwr_on;
   delay_ms(1000);
   setup_timer_2(T2_DIV_BY_16,8,5);    // parametrage du timer 2
   enable_interrupts(INT_TIMER2);      // autorisation interruption timer2
   enable_interrupts(GLOBAL);          // autorisation de toutes les interruptions (afin de prendre en compte timer2)
}
