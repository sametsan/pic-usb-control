
_USB_Init_Desc:

;usbdsc.c,161 :: 		void USB_Init_Desc(){
;usbdsc.c,162 :: 		USB_config_dsc_ptr[0] = &configDescriptor1;
	MOVLW       _configDescriptor1+0
	MOVWF       _USB_config_dsc_ptr+0 
	MOVLW       hi_addr(_configDescriptor1+0)
	MOVWF       _USB_config_dsc_ptr+1 
	MOVLW       higher_addr(_configDescriptor1+0)
	MOVWF       _USB_config_dsc_ptr+2 
;usbdsc.c,163 :: 		USB_string_dsc_ptr[0] = (const char*)&strd1;
	MOVLW       _strd1+0
	MOVWF       _USB_string_dsc_ptr+0 
	MOVLW       hi_addr(_strd1+0)
	MOVWF       _USB_string_dsc_ptr+1 
	MOVLW       higher_addr(_strd1+0)
	MOVWF       _USB_string_dsc_ptr+2 
;usbdsc.c,164 :: 		USB_string_dsc_ptr[1] = (const char*)&strd2;
	MOVLW       _strd2+0
	MOVWF       _USB_string_dsc_ptr+3 
	MOVLW       hi_addr(_strd2+0)
	MOVWF       _USB_string_dsc_ptr+4 
	MOVLW       higher_addr(_strd2+0)
	MOVWF       _USB_string_dsc_ptr+5 
;usbdsc.c,165 :: 		USB_string_dsc_ptr[2] = (const char*)&strd3;
	MOVLW       _strd3+0
	MOVWF       _USB_string_dsc_ptr+6 
	MOVLW       hi_addr(_strd3+0)
	MOVWF       _USB_string_dsc_ptr+7 
	MOVLW       higher_addr(_strd3+0)
	MOVWF       _USB_string_dsc_ptr+8 
;usbdsc.c,166 :: 		}
L_end_USB_Init_Desc:
	RETURN      0
; end of _USB_Init_Desc

_interrupt:

;usb.c,8 :: 		void interrupt() {
;usb.c,9 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;usb.c,10 :: 		}
L_end_interrupt:
L__interrupt12:
	RETFIE      1
; end of _interrupt

_main:

;usb.c,13 :: 		void main(void)
;usb.c,19 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;usb.c,20 :: 		CMCON |=7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;usb.c,21 :: 		trisd=0;
	CLRF        TRISD+0 
;usb.c,22 :: 		trisb = 0;
	CLRF        TRISB+0 
;usb.c,23 :: 		portb=0;
	CLRF        PORTB+0 
;usb.c,25 :: 		HID_Enable(&oku,&yaz);
	MOVLW       _oku+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_oku+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _yaz+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_yaz+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;usb.c,29 :: 		while(1)
L_main0:
;usb.c,31 :: 		ByteToStr(oku[0],a);
	MOVF        80, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       main_a_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(main_a_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;usb.c,32 :: 		b=atoi(a);
	MOVLW       main_a_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(main_a_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       main_b_L0+0 
	MOVF        R1, 0 
	MOVWF       main_b_L0+1 
;usb.c,33 :: 		b=65+(b/2.6212152362);
	CALL        _Int2Double+0, 0
	MOVLW       254
	MOVWF       R4 
	MOVLW       193
	MOVWF       R5 
	MOVLW       39
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       2
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       main_b_L0+0 
	MOVF        R1, 0 
	MOVWF       main_b_L0+1 
;usb.c,34 :: 		c=200-b;
	MOVF        R0, 0 
	SUBLW       200
	MOVWF       main_c_L0+0 
	MOVF        R1, 0 
	MOVWF       main_c_L0+1 
	MOVLW       0
	SUBFWB      main_c_L0+1, 1 
;usb.c,38 :: 		while(!HID_Read()){
L_main2:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;usb.c,41 :: 		for(i=0; i<c;i++) {
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main4:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       main_c_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVF        main_c_L0+0, 0 
	SUBWF       main_i_L0+0, 0 
L__main14:
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;usb.c,42 :: 		delay_us(1);       }
	NOP
;usb.c,41 :: 		for(i=0; i<c;i++) {
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;usb.c,42 :: 		delay_us(1);       }
	GOTO        L_main4
L_main5:
;usb.c,43 :: 		portd.rd0=1;
	BSF         PORTD+0, 0 
;usb.c,44 :: 		for(i=0; i<b;i++)  {
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main7:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       main_b_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main15
	MOVF        main_b_L0+0, 0 
	SUBWF       main_i_L0+0, 0 
L__main15:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;usb.c,45 :: 		delay_us(1);      }
	NOP
;usb.c,44 :: 		for(i=0; i<b;i++)  {
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;usb.c,45 :: 		delay_us(1);      }
	GOTO        L_main7
L_main8:
;usb.c,46 :: 		portd.rd0=0;
	BCF         PORTD+0, 0 
;usb.c,47 :: 		}
	GOTO        L_main2
L_main3:
;usb.c,49 :: 		portb= oku[0];
	MOVF        80, 0 
	MOVWF       PORTB+0 
;usb.c,52 :: 		}
	GOTO        L_main0
;usb.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
