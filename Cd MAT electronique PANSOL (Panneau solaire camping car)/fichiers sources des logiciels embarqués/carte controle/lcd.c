/* LCD driver */

///////////////////////////////////////////////////////////////////////////
////  lcd_init()   doit etre appele avant les autres fonctions.        ////
////                                                                   ////
////  lcd_putc(c)  affiche c a la prochaine position LCD.              ////
////                     commandes speciales :                         ////
////                      \f  efface l'affichage                       ////
////                      \n  debut de seconde ligne                   ////
////                      \b  en arriere d'une position                ////
////                                                                   ////
////  lcd_gotoxy(x,y) choix de la position (haut gauche avec 1,1)      ////
////                                                                   ////
////  lcd_getc(x,y)   renvoie le caractère de la position x,y          ////
////                                                                   ////
///////////////////////////////////////////////////////////////////////////

#define LCD_EN          pin_A4
#define LCD_RW          pin_A5
#define LCD_RS          pin_C0

short disp_lcd, disp_serial;

struct lcd_pin_map {
           int     data : 4;
        } lcd;

#byte lcd = 5                  // on to port A (at address 5)

#define set_tris_lcd(x) set_tris_a(x)
#define lcd_type 2           // 0=5x7, 1=5x10, 2=2 lines
#define lcd_line_two 0x40    // LCD RAM address for the second line


BYTE const LCD_INIT_STRING[4] = {0x20 | (lcd_type << 2), 0xc, 1, 6};
                             // These bytes need to be sent to the LCD
                             // to start it up.


                             // The following are used for setting
                             // the I/O port direction register.

#define LCD_WRITE set_tris_lcd(0x00) // For write mode all pins are out
#define LCD_READ  set_tris_lcd(0x0f) // For read mode data pins are in

void lcd_putc( char c);


void displays(BYTE b)
{
    if (disp_lcd)
    {
        lcd_putc(b);
    }
    if (disp_serial)
    {
        if (b == '\n')
            putchar('\r');
        putchar(b);
    }
}

BYTE lcd_read_byte() {
      BYTE low,high;
      LCD_READ;
      output_high(LCD_RW);
      delay_cycles(1);
      output_high(LCD_EN);
      delay_cycles(1);
      high = lcd.data;
      output_low(LCD_EN);
      delay_cycles(1);
      output_high(LCD_EN);
      delay_us(1);
      low = lcd.data;
      output_low(LCD_EN);
      LCD_WRITE;
      return( (high<<4) | low);
}

void lcd_send_nibble( BYTE n ) {
      lcd.data = n;
      delay_cycles(1);
      output_high(LCD_EN);
      delay_us(2);
      output_low(LCD_EN);
}

void lcd_send_byte( BYTE address, BYTE n ) {

      output_low(LCD_RS);
      delay_ms(1);
      //while ( bit_test(lcd_read_byte(),7) ) ;
      if (address&&0x01)output_high(LCD_RS);
      else output_low(LCD_RS);
      delay_cycles(1);
      output_low(LCD_RW);
      delay_cycles(1);
      output_low(LCD_EN);
      lcd_send_nibble(n >> 4);
      lcd_send_nibble(n & 0xf);
}

void lcd_init() {
    BYTE i;
    LCD_WRITE;
    output_low(LCD_RS);
    output_low(LCD_RW);
    output_low(LCD_EN);
    delay_ms(15);
    for(i=1;i<=3;++i) {
       lcd_send_nibble(3);
       delay_ms(5);
    }
    lcd_send_nibble(2);
    for(i=0;i<=3;++i)
       lcd_send_byte(0,LCD_INIT_STRING[i]);
}

void lcd_gotoxy( BYTE x, BYTE y) {
   BYTE address;

   if(y!=1)
     address=lcd_line_two;
   else
     address=0;
   address+=x-1;
   lcd_send_byte(0,0x80|address);
}

void lcd_putc( char c) {
   switch (c) {
     case '\f'   : lcd_send_byte(0,1);
                   delay_ms(1);        //ou 2
                                           break;
     case '\n'   : lcd_gotoxy(1,2);        break;
     case '\b'   : lcd_send_byte(0,0x10);  break;
     default     : lcd_send_byte(1,c);     break;
   }
}

char lcd_getc( BYTE x, BYTE y) {
   char value;

    lcd_gotoxy(x,y);
    while ( bit_test(lcd_read_byte(),7) ); // wait until busy flag is low
    output_high(LCD_RS);
    value = lcd_read_byte();
    output_low(LCD_RS);
    return(value);
}

