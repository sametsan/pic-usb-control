
_interrupt:

;pic.c,5 :: 		void interrupt()
;pic.c,7 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;pic.c,9 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;pic.c,11 :: 		void main(void)
;pic.c,13 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;pic.c,14 :: 		CMCON |=7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;pic.c,15 :: 		trisb = 0;
	CLRF        TRISB+0 
;pic.c,16 :: 		portb=0;
	CLRF        PORTB+0 
;pic.c,18 :: 		HID_Enable(&oku,&yaz);
	MOVLW       _oku+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_oku+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _yaz+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_yaz+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;pic.c,20 :: 		while(1)
L_main0:
;pic.c,22 :: 		while(!HID_Read());
L_main2:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;pic.c,23 :: 		portb= oku[0];
	MOVF        80, 0 
	MOVWF       PORTB+0 
;pic.c,25 :: 		}
	GOTO        L_main0
;pic.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
