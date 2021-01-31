#line 1 "E:/Proje/son/usb.c"
#line 1 "e:/proje/son/usbdsc.c"
const unsigned int USB_VENDOR_ID = 0x1234;
const unsigned int USB_PRODUCT_ID = 0x1234;
const char USB_SELF_POWER = 0x80;
const char USB_MAX_POWER = 50;
const char HID_INPUT_REPORT_BYTES = 64;
const char HID_OUTPUT_REPORT_BYTES = 64;
const char USB_TRANSFER_TYPE = 0x03;
const char EP_IN_INTERVAL = 1;
const char EP_OUT_INTERVAL = 1;

const char USB_INTERRUPT = 1;
const char USB_HID_EP = 1;
const char USB_HID_RPT_SIZE = 33;


const struct {
 char bLength;
 char bDescriptorType;
 unsigned int bcdUSB;
 char bDeviceClass;
 char bDeviceSubClass;
 char bDeviceProtocol;
 char bMaxPacketSize0;
 unsigned int idVendor;
 unsigned int idProduct;
 unsigned int bcdDevice;
 char iManufacturer;
 char iProduct;
 char iSerialNumber;
 char bNumConfigurations;
} device_dsc = {
 0x12,
 0x01,
 0x0200,
 0x00,
 0x00,
 0x00,
 8,
 USB_VENDOR_ID,
 USB_PRODUCT_ID,
 0x0001,
 0x01,
 0x02,
 0x00,
 0x01
 };


const char configDescriptor1[]= {

 0x09,
 0x02,
 0x29,0x00,
 1,
 1,
 0,
 USB_SELF_POWER,
 USB_MAX_POWER,


 0x09,
 0x04,
 0,
 0,
 2,
 0x03,
 0,
 0,
 0,


 0x09,
 0x21,
 0x01,0x01,
 0x00,
 1,
 0x22,
 USB_HID_RPT_SIZE,0x00,


 0x07,
 0x05,
 USB_HID_EP | 0x80,
 USB_TRANSFER_TYPE,
 0x40,0x00,
 EP_IN_INTERVAL,


 0x07,
 0x05,
 USB_HID_EP,
 USB_TRANSFER_TYPE,
 0x40,0x00,
 EP_OUT_INTERVAL
};

const struct {
 char report[USB_HID_RPT_SIZE];
}hid_rpt_desc =
 {
 {0x06, 0x00, 0xFF,
 0x09, 0x01,
 0xA1, 0x01,

 0x19, 0x01,
 0x29, 0x40,
 0x15, 0x00,
 0x26, 0xFF, 0x00,
 0x75, 0x08,
 0x95, HID_INPUT_REPORT_BYTES,
 0x81, 0x02,

 0x19, 0x01,
 0x29, 0x40,
 0x75, 0x08,
 0x95, HID_OUTPUT_REPORT_BYTES,
 0x91, 0x02,
 0xC0}
 };


const struct {
 char bLength;
 char bDscType;
 unsigned int string[1];
 } strd1 = {
 4,
 0x03,
 {0x0409}
 };



const struct{
 char bLength;
 char bDscType;
 unsigned int string[5];
 }strd2={
 12,
 0x03,
 {'S','e','r','v','o'}
 };


const struct{
 char bLength;
 char bDscType;
 unsigned int string[9];
}strd3={
 20,
 0x03,
 {'S','a','m','e','t',' ','S','A','N'}
 };


const char* USB_config_dsc_ptr[1];


const char* USB_string_dsc_ptr[3];

void USB_Init_Desc(){
 USB_config_dsc_ptr[0] = &configDescriptor1;
 USB_string_dsc_ptr[0] = (const char*)&strd1;
 USB_string_dsc_ptr[1] = (const char*)&strd2;
 USB_string_dsc_ptr[2] = (const char*)&strd3;
}
#line 4 "E:/Proje/son/usb.c"
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
 delay_us(1); }
 portd.rd0=1;
 for(i=0; i<b;i++) {
 delay_us(1); }
 portd.rd0=0;
 }

 portb= oku[0];


}

}
