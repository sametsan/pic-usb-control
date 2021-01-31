 #include "USBdsc.c"


unsigned char oku[64] absolute 0x50;
unsigned char yaz[64] absolute 0x540 ;


void interrupt() {
  USB_Interrupt_Proc();
}

     
void main(void)
{
char a[4];

int b,c,i;

ADCON1 |= 0x0F;
CMCON |=7;
trisd=0;
trisb = 0;
portb=0;

HID_Enable(&oku,&yaz);


     
while(1)
{   
           ByteToStr(oku[0],a);
        b=atoi(a);
        b=65+(b/2.6212152362);
        c=200-b;

    
    
        while(!HID_Read()){


         for(i=0; i<c;i++) {
         delay_us(1);       }
         portd.rd0=1;
         for(i=0; i<b;i++)  {
         delay_us(1);      }
         portd.rd0=0;
              }
        
        portb= oku[0];


}

}