#line 1 "E:/Proje/son/pic.c"

unsigned char oku[64] absolute 0x50;
unsigned char yaz[64] absolute 0x540 ;

 void interrupt()
 {
 USB_Interrupt_Proc();

 }

void main(void)
{
ADCON1 |= 0x0F;
CMCON |=7;
trisb = 0;
portb=0;

HID_Enable(&oku,&yaz);

while(1)
{
 while(!HID_Read());
 portb= oku[0];

}

}
