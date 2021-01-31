/*
 * Project name:
     LED_Blinking (Simple 'Hello World' project)
 * Copyright:
     (c) MikroElektronika, 2005-2008
 * Description:
     This is a simple 'Hello World' project. It turns on/off diodes connected to
     PORTC. It uses bitwise negation to toggle PORTC pins.
 * Test configuration:
     MCU:             PIC16F877A
     Dev.Board:       EasyPIC5
     Oscillator:      HS, 08.0000 MHz
     Ext. Modules:    -
     SW:              mikroC v8.0
 * NOTES:
     None.
*/

void main() {
  PORTC = 0;                 // Initialize PORTC
  TRISC = 0;                 // Configure PORTC as output

  while(1) {
    PORTC =  ~PORTC;         // toggle PORTC
    Delay_ms(1000);          // one second delay
  }
}
