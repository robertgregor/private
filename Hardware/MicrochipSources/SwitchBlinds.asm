
; PicBasic Pro Compiler 2.46, (c) 1998, 2005 microEngineering Labs, Inc. All Rights Reserved.  
PM_USED			EQU	1

	INCLUDE	"16F690.INC"


; Define statements.
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4
#define		CODE_SIZE		 4
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00021	 DEFINE OSC 8
#define		OSC		 8

RAM_START       		EQU	00020h
RAM_END         		EQU	0016Fh
RAM_BANKS       		EQU	00003h
BANK0_START     		EQU	00020h
BANK0_END       		EQU	0007Fh
BANK1_START     		EQU	000A0h
BANK1_END       		EQU	000EFh
BANK2_START     		EQU	00120h
BANK2_END       		EQU	0016Fh
EEPROM_START    		EQU	02100h
EEPROM_END      		EQU	021FFh

; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00012	R0      VAR     WORD BANK0 SYSTEM       ' System Register
R0              		EQU	RAM_START + 000h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00013	R1      VAR     WORD BANK0 SYSTEM       ' System Register
R1              		EQU	RAM_START + 002h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00014	R2      VAR     WORD BANK0 SYSTEM       ' System Register
R2              		EQU	RAM_START + 004h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00015	R3      VAR     WORD BANK0 SYSTEM       ' System Register
R3              		EQU	RAM_START + 006h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00016	R4      VAR     WORD BANK0 SYSTEM       ' System Register
R4              		EQU	RAM_START + 008h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00017	R5      VAR     WORD BANK0 SYSTEM       ' System Register
R5              		EQU	RAM_START + 00Ah
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00018	R6      VAR     WORD BANK0 SYSTEM       ' System Register
R6              		EQU	RAM_START + 00Ch
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00019	R7      VAR     WORD BANK0 SYSTEM       ' System Register
R7              		EQU	RAM_START + 00Eh
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00020	R8      VAR     WORD BANK0 SYSTEM       ' System Register
R8              		EQU	RAM_START + 010h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 012h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00026	FLAGS   VAR     BYTE BANK0 SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 014h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00025	GOP     VAR     BYTE BANK0 SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 015h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00022	RM1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 016h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00024	RM2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 017h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00021	RR1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 018h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00023	RR2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 019h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00016	data_in var Byte[payloadLengthD] 'data received
_data_in         		EQU	RAM_START + 01Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00015	data_out VAR BYTE[payloadLengthD] 'data sent
_data_out        		EQU	RAM_START + 032h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00017	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 04Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00063	counter var word
_counter         		EQU	RAM_START + 080h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00064	initialCounter var word
_initialCounter  		EQU	RAM_START + 082h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00014	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 084h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00057	temp2_word var word
_temp2_word      		EQU	RAM_START + 086h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00058	temp3_word var word
_temp3_word      		EQU	RAM_START + 088h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00056	temp_word var word
_temp_word       		EQU	RAM_START + 08Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00067	timeout_value var word
_timeout_value   		EQU	RAM_START + 08Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00049	ci var byte
_ci              		EQU	RAM_START + 08Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00050	configure var byte
_configure       		EQU	RAM_START + 08Fh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00066	conversionSuccess VAR BYTE
_conversionSuccess		EQU	RAM_START + 090h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00068	currentCounter var byte
_currentCounter  		EQU	RAM_START + 091h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00069	currentDirection var byte
_currentDirection		EQU	RAM_START + 092h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00025	device_id var byte
_device_id       		EQU	RAM_START + 093h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00059	EEPROMBYTE      VAR BYTE
_EEPROMBYTE      		EQU	RAM_START + 094h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00060	EEPROMPOSITION  VAR BYTE
_EEPROMPOSITION  		EQU	RAM_START + 095h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00047	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 096h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00065	initialPercent var byte
_initialPercent  		EQU	RAM_START + 097h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00048	j var byte
_j               		EQU	RAM_START + 098h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00019	k VAR byte
_k               		EQU	RAM_START + 099h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00012	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 09Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00061	seconds  var     byte    ' Define second variable
_seconds         		EQU	RAM_START + 09Bh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00053	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 09Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00021	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 09Dh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00054	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 09Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00022	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 09Fh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00055	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 0A0h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00023	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 0A1h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00024	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 0A2h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00052	temp_byte var byte
_temp_byte       		EQU	RAM_START + 0A3h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00051	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 0A4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00020	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 0A5h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00062	ticks   var     byte    ' Define pieces of seconds variable
_ticks           		EQU	RAM_START + 0A6h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00013	val var byte 'temp value
_val             		EQU	RAM_START + 0A7h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00018	w var byte
_w               		EQU	RAM_START + 0A8h
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00021	PORTL   VAR     PORTA
_PORTL           		EQU	 PORTA
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00022	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00023	TRISL   VAR     TRISA
_TRISL           		EQU	 TRISA
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00024	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC
#define _SSPEN           	_SSPCON_5
#define _CKP             	_SSPCON_4
#define _SMP             	_SSPSTAT_7
#define _CKE             	_SSPSTAT_6
#define _SSPIF           	_PIR1_3
#define _Ce              	_PORTA_2
#define _CSN             	_PORTC_0
#define _Irq             	_PORTC_2
#define _RELAY_DOWN      	_PORTA_5
#define _RELAY_UP        	_PORTA_4
#define _RES             	_PORTB_5
#define _SSPCON_5        	 SSPCON, 005h
#define _SSPCON_4        	 SSPCON, 004h
#define _SSPSTAT_7       	 SSPSTAT, 007h
#define _SSPSTAT_6       	 SSPSTAT, 006h
#define _PIR1_3          	 PIR1, 003h
#define _PORTA_2         	 PORTA, 002h
#define _PORTC_0         	 PORTC, 000h
#define _PORTC_2         	 PORTC, 002h
#define _SSPCON_0        	 SSPCON, 000h
#define _PORTA_5         	 PORTA, 005h
#define _PORTA_4         	 PORTA, 004h
#define _PORTB_5         	 PORTB, 005h
#define _val_0           	_val, 000h
#define _INTCON_2        	 INTCON, 002h
#define _INTCON_7        	 INTCON, 007h

; Constants.
_payloadLength   		EQU	00016h
_payloadLengthD  		EQU	00018h
_Idle_int        		EQU	00000h
_Max_rt          		EQU	00010h
_Tx_inter        		EQU	00030h
_Rx_ds           		EQU	00040h
_Read_reg        		EQU	00000h
_Write_reg       		EQU	00020h
_Rd_rx_pload     		EQU	00061h
_Wr_tx_pload     		EQU	000A0h
_Flush_tx        		EQU	000E1h
_Flush_rx        		EQU	000E2h
_Reuse_tx_pl     		EQU	000E3h
_Nop_comm        		EQU	000FFh
_Config_nrf      		EQU	00000h
_En_aa           		EQU	00001h
_En_rxaddr       		EQU	00002h
_Setup_aw        		EQU	00003h
_Setup_retr      		EQU	00004h
_Rf_ch           		EQU	00005h
_Rf_setup        		EQU	00006h
_Stat_us         		EQU	00007h
_Observe_tx      		EQU	00008h
_Cd              		EQU	00009h
_Rx_addr_p0      		EQU	0000Ah
_Rx_addr_p1      		EQU	0000Bh
_Rx_addr_p2      		EQU	0000Ch
_Rx_addr_p3      		EQU	0000Dh
_Rx_addr_p4      		EQU	0000Eh
_Rx_addr_p5      		EQU	0000Fh
_Tx_addr         		EQU	00010h
_Rx_pw_p0        		EQU	00011h
_Rx_pw_p1        		EQU	00012h
_Rx_pw_p2        		EQU	00013h
_Rx_pw_p3        		EQU	00014h
_Rx_pw_p4        		EQU	00015h
_Rx_pw_p5        		EQU	00016h
_Fifo_status     		EQU	00017h

; EEPROM data.
	ORG EEPROM_START

	ORG EEPROM_START + 000h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00017	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,0,0]
	DE	028h
	DE	052h
	DE	045h
	DE	04Dh
	DE	04Fh
	DE	054h
	DE	045h
	DE	048h
	DE	04Fh
	DE	04Dh
	DE	000h
	DE	001h
	DE	000h
	DE	000h
	DE	000h
	DE	000h

	INCLUDE	"SWITCH~1.MAC"
	INCLUDE	"PBPPIC14.LIB"


; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00012	BANK0   $0020, $007F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00013	BANK1   $00A0, $00EF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00014	BANK2   $0120, $016F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00015	EEPROM  $2100, $21FF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00016	LIBRARY "PBPPIC14"
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00019	        include "PIC14EXT.BAS"

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00026	        include "PBPPIC14.RAM"

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00005	@ DEVICE PIC16F690,MCLR_OFF

	ASM?
 DEVICE PIC16F690,MCLR_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00006	@ DEVICE PIC16F690,CPD_OFF

	ASM?
 DEVICE PIC16F690,CPD_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00007	@ DEVICE PIC16F690,BOD_ON

	ASM?
 DEVICE PIC16F690,BOD_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00008	@ DEVICE PIC16F690,PWRT_ON

	ASM?
 DEVICE PIC16F690,PWRT_ON

	ENDASM?

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00017	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,0,0]

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00019	INCLUDE "RFM73.pbp"
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00010	payloadLength con 22
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00011	payloadLengthD con 24
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00028	Idle_int con $00 'Idle no interrupt pending
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00029	Max_rt con $10 'Max # of Tx retrans interrupt
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00030	Tx_inter con $30 'Tx interrupted
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00031	Rx_ds con $40 'Rx data received
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00033	Read_reg con $00 'def read command to register
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00034	Write_reg CON $20 'def write command to register
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00035	Rd_rx_pload con $61 'def Rx payload register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00036	Wr_tx_pload con $A0 'def Tx payload register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00037	Flush_tx con $E1 'def flush Tx register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00038	Flush_rx con $E2 'def flush Rx register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00039	Reuse_tx_pl con $E3 'def reuse Tx payload register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00040	Nop_comm con $FF 'def No operation
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00042	Config_nrf con $00 'Config register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00043	En_aa con $01 'enable auto acknowledgment register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00044	En_rxaddr con $02 'enable RX addresses register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00045	Setup_aw con $03 'setup address width register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00046	Setup_retr con $04 'setup auto retrans register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00047	Rf_ch con $05 'RF channel register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00048	Rf_setup con $06 'RF setup register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00049	Stat_us con $07 'Status register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00050	Observe_tx con $08 'Observe TX register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00051	Cd con $09 'Carrier detect register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00052	Rx_addr_p0 con $0A 'RX address pipe0 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00053	Rx_addr_p1 con $0B 'RX address pipe1 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00054	Rx_addr_p2 con $0C 'RX address pipe2 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00055	Rx_addr_p3 con $0D 'RX address pipe3 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00056	Rx_addr_p4 con $0E 'RX address pipe4 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00057	Rx_addr_p5 con $0F 'RX address pipe5 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00058	Tx_addr con $10 'TX address register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00059	Rx_pw_p0 con $11 'RX payload width pipe0 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00060	Rx_pw_p1 con $12 'RX payload width pipe1 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00061	Rx_pw_p2 con $13 'RX payload width pipe2 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00062	Rx_pw_p3 con $14 'RX payload width pipe3 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00063	Rx_pw_p4 con $15 'RX payload width pipe4 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00064	Rx_pw_p5 con $16 'RX payload width pipe5 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00065	Fifo_status con $17 'FIFO status register register address

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00067	goto endRFM73
	GOTO?L	_endRFM73

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00068	initModule:

	LABEL?L	_initModule	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00069	pause 200
	PAUSE?C	0C8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00071	SSPEN = 1 'enable SPI pins
	MOVE?CT	001h, _SSPEN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00072	SSPCON.0=1 'SPI rate=OSC/16
	MOVE?CT	001h, _SSPCON_0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00073	CKP = 0 'clock idle low
	MOVE?CT	000h, _CKP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00074	CKE = 1 'transmit on active to idle
	MOVE?CT	001h, _CKE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00075	SSPIF = 0 'clear buffer full status
	MOVE?CT	000h, _SSPIF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00076	SMP = 0 'sample in middle of data
	MOVE?CT	000h, _SMP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00078	Ce=1 'init spi pins
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00079	pause 10 'wait 10 ms hardware is stable
	PAUSE?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00080	Ce=0 'set CE pin low disable Rx
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00081	CSN=0 'set CSN pin low
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00082	Pack_count=0 'number of packets sent
	MOVE?CW	000h, _Pack_count

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00083	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00085	commonRXTX:

	LABEL?L	_commonRXTX	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00086	data_out[0]=Write_reg+Rx_addr_p0 'Rx address for pipe0
	MOVE?CB	02Ah, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00087	gosub setRxAddressPipe
	GOSUB?L	_setRxAddressPipe

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00088	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00089	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00090	data_out[0]=Write_reg+En_aa 'enable auto ACK pipe0
	MOVE?CB	021h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00091	data_out[1]=$01 '1 enable, 0 disable
	MOVE?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00092	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00093	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00094	data_out[0]=Write_reg+En_rxaddr 'enable Rx address pipe0
	MOVE?CB	022h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00095	data_out[1]=$01
	MOVE?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00096	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00097	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00098	data_out[0]=Write_reg+Rf_ch 'Set RF channel
	MOVE?CB	025h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00099	READ 0, data_out[1] 'number of channel used
	READ?CB	000h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00100	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00101	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00102	data_out[0]=Write_reg+Rx_pw_p0 'Set Rx pload width pipe0
	MOVE?CB	031h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00103	data_out[1]=payloadLength 'number of bytes used in data sent
	MOVE?CB	_payloadLength, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00104	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00105	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00106	data_out[0]=Write_reg+Rf_setup 'Set RF: 'Set RF:5dbm, 1Mbps
	MOVE?CB	026h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00108	data_out[1]=%00000111 '1mbit
	MOVE?CB	007h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00109	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00110	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00112	temp_byte_rfm = 1
	MOVE?CB	001h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00113	gosub setBank
	GOSUB?L	_setBank

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	000h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	040h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	001h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	0E2h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00115	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	001h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	0C0h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00117	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0D0h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0FCh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	08Ch, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00119	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	003h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	099h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	000h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	039h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	041h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00121	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $B6 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	004h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $B6 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	0D9h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $B6 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	0B6h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $B6 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	082h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $B6 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	01Bh, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00123	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	005h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	028h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	002h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	07Fh, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	0A6h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00125	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	00Ch, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	012h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	073h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00127	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	00Dh, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	046h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	0B4h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	080h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00129	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00130	data_out[0]=Write_reg+$0E
	MOVE?CB	02Eh, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00131	data_out[1]=$41
	MOVE?CB	041h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00132	data_out[2]=$20
	MOVE?CB	020h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00133	data_out[3]=$08
	MOVE?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00134	data_out[4]=$04
	MOVE?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00135	data_out[5]=$81
	MOVE?CB	081h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00136	data_out[6]=$20
	MOVE?CB	020h, _data_out + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00137	data_out[7]=$CF
	MOVE?CB	0CFh, _data_out + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00138	data_out[8]=$F7
	MOVE?CB	0F7h, _data_out + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00139	data_out[9]=$FE
	MOVE?CB	0FEh, _data_out + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00140	data_out[10]=$FF
	MOVE?CB	0FFh, _data_out + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00141	data_out[11]=$FF
	MOVE?CB	0FFh, _data_out + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00142	num_byte=11
	MOVE?CB	00Bh, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00143	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00144	temp_byte_rfm = 0
	MOVE?CB	000h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00145	gosub setBank
	GOSUB?L	_setBank

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00146	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00148	setBank:

	LABEL?L	_setBank	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00149	data_out[0]=Read_reg+$07
	MOVE?CB	007h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00150	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00151	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00152	if (temp_byte_rfm != (data_in[0] & $80)) then
	AND?BCW	_data_in, 080h, T1
	CMPEQ?BWL	_temp_byte_rfm, T1, L00003

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00154	    data_out[0]=$50
	MOVE?CB	050h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00155	    data_out[1]=$53    
	MOVE?CB	053h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00156	    num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00157	    gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00158	endif
	LABEL?L	L00003	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00159	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00161	conf4bytes:

	LABEL?L	_conf4bytes	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00162	data_out[0]=Write_reg+temp_byte_rfm
	ADD?CBB	_Write_reg, _temp_byte_rfm, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00163	data_out[1]=temp1_byte_rfm
	MOVE?BB	_temp1_byte_rfm, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00164	data_out[2]=temp2_byte_rfm
	MOVE?BB	_temp2_byte_rfm, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00165	data_out[3]=temp3_byte_rfm
	MOVE?BB	_temp3_byte_rfm, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00166	data_out[4]=temp4_byte_rfm
	MOVE?BB	_temp4_byte_rfm, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00167	num_byte=4
	MOVE?CB	004h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00168	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00169	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00171	sendData:

	LABEL?L	_sendData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00172	pause 30
	PAUSE?C	01Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00173	GOSUB debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00174	data_out[0]=Flush_tx 'flush TX_fifo buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00175	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00176	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00177	data_out[0]=Write_reg+Stat_us 'reset IRQ bits
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00178	data_out[1]=%00110000
	MOVE?CB	030h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00179	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00180	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00181	gosub setup_tx 'setup Tx
	GOSUB?L	_setup_tx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00182	data_out[0]=Wr_tx_pload 'put 10 bytes data in Tx pload buffer
	MOVE?CB	_Wr_tx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00183	data_out[1]=device_id
	MOVE?BB	_device_id, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00184	for w = 2 to payloadLength+1
	MOVE?CB	002h, _w
	LABEL?L	L00005	
	CMPGT?BCL	_w, 017h, L00006

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00185	    data_out[w]=temp_data[w-2]
	SUB?BCW	_w, 002h, T1
	AOUT?BWB	_temp_data, T1, T1
	AIN?BBB	T1, _data_out, _w

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00186	    if data_out[w] == 10 then contSendX1
	AOUT?BBB	_data_out, _w, T1
	CMPEQ?BCL	T1, 00Ah, _contSendX1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00187	next w
	NEXT?BCL	_w, 001h, L00005
	LABEL?L	L00006	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00188	:contSendX1

	LABEL?L	_contSendX1	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00189	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00190	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00191	pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00192	Ce=1 'CE=1 (toggle) transmit FIFO buffer
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00193	Pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00194	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00195	Pause 1
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00196	trans_irq:

	LABEL?L	_trans_irq	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00197	If Irq !=0 then trans_irq 'wait until IRQ, active low
	CMPNE?TCL	_Irq, 000h, _trans_irq

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00198	data_out[0]=Stat_us 'read status register
	MOVE?CB	_Stat_us, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00199	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00200	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00201	val=data_in[0]&%01110000 'mask the IRQ bits STATUS byte
	AND?BCB	_data_in, 070h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00202	if (val = Max_rt) then gosub max_retry 'maximum TX retries
	CMPNE?BCL	_val, _Max_rt, L00007
	GOSUB?L	_max_retry
	LABEL?L	L00007	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00203	if (val = Tx_inter) then gosub tx_int 'Tx interrupted
	CMPNE?BCL	_val, _Tx_inter, L00009
	GOSUB?L	_tx_int
	LABEL?L	L00009	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00204	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00205	data_out[1]=%00100000 'clear TX_DS IRQ bit
	MOVE?CB	020h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00206	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00207	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00208	gosub debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00209	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00212	debounce:

	LABEL?L	_debounce	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00213	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00214	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00215	Ce=1
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00216	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00217	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00218	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00219	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00221	spi_write:

	LABEL?L	_spi_write	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00222	CSN=0
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00223	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00011	
	CMPGT?BBL	_w, _num_byte, L00012

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00224	SSPBUF=data_out[w] 'send array variable
	AOUT?BBB	_data_out, _w, SSPBUF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00225	GoSub buffer_ok 'wait until buffer ready
	GOSUB?L	_buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00226	Next w 'next location
	NEXT?BCL	_w, 001h, L00011
	LABEL?L	L00012	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00227	CSN=1
	MOVE?CT	001h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00228	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00230	spi_read:

	LABEL?L	_spi_read	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00231	CSN=0
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00232	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00013	
	CMPGT?BBL	_w, _num_byte, L00014

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00233	    SSPBUF = data_out[0] 'write to SSPBUF to start clock
	MOVE?BB	_data_out, SSPBUF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00234	    GoSub buffer_ok 'wait for receipt
	GOSUB?L	_buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00235	data_in[w] = SSPBUF 'store received character in array
	AIN?BBB	SSPBUF, _data_in, _w

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00236	Next w 'get next byte
	NEXT?BCL	_w, 001h, L00013
	LABEL?L	L00014	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00237	CSN=1
	MOVE?CT	001h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00238	Return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00239	buffer_ok:

	LABEL?L	_buffer_ok	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00240	IF SSPIF = 0 Then buffer_ok 'wait for SPI interupt flag
	CMPEQ?TCL	_SSPIF, 000h, _buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00241	SSPIF = 0 'reset flag
	MOVE?CT	000h, _SSPIF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00242	Return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00244	max_retry:

	LABEL?L	_max_retry	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00245	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00246	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00247	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00248	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00249	data_out[1]=%00010000 'clear MAX_RT IRQ bit
	MOVE?CB	010h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00250	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00251	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00252	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00254	tx_int:

	LABEL?L	_tx_int	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00255	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00256	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00257	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00258	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00259	data_out[1]=%00110000 'clear TX_DS & MAX_RT IRQ bit
	MOVE?CB	030h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00260	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00261	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00262	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00264	setup_rx:

	LABEL?L	_setup_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00265	gosub debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00266	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00267	data_out[1]=$0F
	MOVE?CB	00Fh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00268	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00269	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00271	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00273	setup_sleep:

	LABEL?L	_setup_sleep	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00274	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=0, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00275	data_out[1]=%00001101
	MOVE?CB	00Dh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00276	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00277	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00278	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00280	setup_tx:

	LABEL?L	_setup_tx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00281	data_out[0]=Write_reg+Tx_addr 'Tx address
	MOVE?CB	030h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00282	gosub setTxAddressPipe
	GOSUB?L	_setTxAddressPipe

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00283	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00284	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00285	data_out[0]= Write_reg+Setup_retr 'Set retransmit @ ACK
	MOVE?CB	024h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00286	data_out[1]= %00011111 '15x re-transmit (default)
	MOVE?CB	01Fh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00287	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00288	Gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00289	data_out[0]=Write_reg+Config_nrf 'Config:PRX=0,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00290	data_out[1]=$0E
	MOVE?CB	00Eh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00291	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00292	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00293	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00294	:endRFM73

	LABEL?L	_endRFM73	
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00021	 DEFINE OSC 8

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00023	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00024	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00025	 ANSELH = 0
	MOVE?CB	000h, ANSELH

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00026	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00027	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00030	    INTCON = %10100000  'T01 enabled PEIE disabled.
	MOVE?CB	0A0h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00031	    PIE1 = %00000000    'USART disabled
	MOVE?CB	000h, PIE1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00032	    OPTION_REG = %00000111
	MOVE?CB	007h, OPTION_REG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00034	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00035	ENABLE
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00037	TRISA = %00000000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	000h, TRISA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00038	TRISB = %00110000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	030h, TRISB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00039	TRISC = %00000100 'Set IRQ input, 
	ICALL?L	L00001
	MOVE?CB	004h, TRISC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00040	WPUA = %00000000
	ICALL?L	L00001
	MOVE?CB	000h, WPUA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00041	WPUB = %00100000
	ICALL?L	L00001
	MOVE?CB	020h, WPUB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00071	startProgram:

	LABEL?L	_startProgram	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00072	clear
	ICALL?L	L00001
	CLEAR?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00073	gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00074	read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00075	read 11, timeout_value
	ICALL?L	L00001
	READ?CW	00Bh, _timeout_value

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00076	timeout_value = timeout_value * 30
	ICALL?L	L00001
	MUL?WCW	_timeout_value, 01Eh, _timeout_value

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00078	output RELAY_DOWN
	ICALL?L	L00001
	OUTPUT?T	_RELAY_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00079	output RELAY_UP
	ICALL?L	L00001
	OUTPUT?T	_RELAY_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00080	input RES
	ICALL?L	L00001
	INPUT?T	_RES

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00081	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00083	commonSettings:

	LABEL?L	_commonSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00084	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00085	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00088	Main_rx:

	LABEL?L	_Main_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00089	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00090	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00091	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00092	irqLoop:

	LABEL?L	_irqLoop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00093	if RES == 0 then
	ICALL?L	L00001
	CMPNE?TCL	_RES, 000h, L00015

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00094	    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00095	    write 0, 40
	WRITE?CC	000h, 028h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00096	    write 1, "R"
	WRITE?CC	001h, 052h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00097	    write 2, "E"
	WRITE?CC	002h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00098	    write 3, "M"
	WRITE?CC	003h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00099	    write 4, "O"
	WRITE?CC	004h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00100	    write 5, "T"
	WRITE?CC	005h, 054h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00101	    write 6, "E"
	WRITE?CC	006h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00102	    write 7, "H"
	WRITE?CC	007h, 048h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00103	    write 8, "O"
	WRITE?CC	008h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00104	    write 9, "M"
	WRITE?CC	009h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00105	    write 10, 0
	WRITE?CC	00Ah, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00106	    write 11, 1
	WRITE?CC	00Bh, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00107	    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00108	    pause 1000
	ICALL?L	L00001
	PAUSE?C	003E8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00109	    goto startProgram
	ICALL?L	L00001
	GOTO?L	_startProgram

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00110	endif
	ICALL?L	L00001
	LABEL?L	L00015	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00112	if (temp_data[0] != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_data, 000h, L00017

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00113	    if (configure == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_configure, 001h, L00019

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00114	        gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00115	        configure = 0
	ICALL?L	L00001
	MOVE?CB	000h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00116	    endif
	ICALL?L	L00001
	LABEL?L	L00019	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00117	    gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00118	    temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00119	    GOTO main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00120	endif
	ICALL?L	L00001
	LABEL?L	L00017	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00121	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00122	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00123	lop:

	LABEL?L	_lop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00124	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	ICALL?L	L00001
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00125	num_byte=payloadLength
	ICALL?L	L00001
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00126	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00127	temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00128	if (data_in[1] == device_id) then
	ICALL?L	L00001
	CMPNE?BBL	_data_in + 00001h, _device_id, L00021

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00129	    if (data_in[2] == "c") then    
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 063h, L00023

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00130	        if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00025

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00132	            for i = 0 to 10
	ICALL?L	L00001
	MOVE?CB	000h, _i
	LABEL?L	L00027	
	CMPGT?BCL	_i, 00Ah, L00028

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00133	                disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00134	                write i, data_in[i+4]
	ADD?BCW	_i, 004h, T1
	AOUT?BWB	_data_in, T1, T1
	WRITE?BB	_i, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00135	                enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00136	            next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00027
	LABEL?L	L00028	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00137	            read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00138	            pause 250
	ICALL?L	L00001
	PAUSE?C	0FAh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00139	            configure = 1
	ICALL?L	L00001
	MOVE?CB	001h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00140	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00141	        endif
	ICALL?L	L00001
	LABEL?L	L00025	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00142	    else
	ICALL?L	L00001
	GOTO?L	L00024
	LABEL?L	L00023	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00143	     if (data_in[2] == "b") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 062h, L00029

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00144	        if (data_in[3] == "t") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 074h, L00031

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00145	            if (data_in[4] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00004h, 03Dh, L00033

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00146	                i = 5
	ICALL?L	L00001
	MOVE?CB	005h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00147	                gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00148	                if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00035

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00149	                     disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00150	                     write 11, temp_byte
	WRITE?CB	00Bh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00151	                     enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00152	                     timeout_value = temp_byte * 30
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 01Eh, _timeout_value

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00153	                     gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00154	                endif                                   
	ICALL?L	L00001
	LABEL?L	L00035	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00155	            endif
	ICALL?L	L00001
	LABEL?L	L00033	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00156	        else
	ICALL?L	L00001
	GOTO?L	L00032
	LABEL?L	L00031	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00157	         if (timeout_value == 0) then
	ICALL?L	L00001
	CMPNE?WCL	_timeout_value, 000h, L00037

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00159	         else
	ICALL?L	L00001
	GOTO?L	L00038
	LABEL?L	L00037	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00160	          if (data_in[3] == "d") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 064h, L00039

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00161	            counter = timeout_value
	ICALL?L	L00001
	MOVE?WW	_timeout_value, _counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00162	            initialcounter = counter
	ICALL?L	L00001
	MOVE?WW	_counter, _initialCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00163	            gosub blindsDown
	ICALL?L	L00001
	GOSUB?L	_blindsDown

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00164	            initialPercent = currentCounter
	ICALL?L	L00001
	MOVE?BB	_currentCounter, _initialPercent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00165	            currentCounter = 100
	ICALL?L	L00001
	MOVE?CB	064h, _currentCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00166	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00167	          else
	ICALL?L	L00001
	GOTO?L	L00040
	LABEL?L	L00039	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00168	           if (data_in[3] == "u") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 075h, L00041

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00169	            counter = timeout_value
	ICALL?L	L00001
	MOVE?WW	_timeout_value, _counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00170	            initialCounter = counter
	ICALL?L	L00001
	MOVE?WW	_counter, _initialCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00171	            gosub blindsup
	ICALL?L	L00001
	GOSUB?L	_blindsup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00172	            initialPercent = currentCounter            
	ICALL?L	L00001
	MOVE?BB	_currentCounter, _initialPercent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00173	            currentCounter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _currentCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00174	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00175	           else
	ICALL?L	L00001
	GOTO?L	L00042
	LABEL?L	L00041	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00176	            if (data_in[3] == "m") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 06Dh, L00043

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00177	             if (data_in[4] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00004h, 03Dh, L00045

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00178	                i = 5
	ICALL?L	L00001
	MOVE?CB	005h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00179	                gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00180	                if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00047

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00181	                  if (temp_byte < 101) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 065h, L00049

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00182	                    if (temp_byte == currentCounter) then
	ICALL?L	L00001
	CMPNE?BBL	_temp_byte, _currentCounter, L00051

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00183	                        gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00184	                        counter = 4
	ICALL?L	L00001
	MOVE?CW	004h, _counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00185	                    else
	ICALL?L	L00001
	GOTO?L	L00052
	LABEL?L	L00051	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00186	                     if (temp_byte > currentCounter) then
	ICALL?L	L00001
	CMPLE?BBL	_temp_byte, _currentCounter, L00053

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00187	                        temp2_byte = temp_byte - currentCounter
	ICALL?L	L00001
	SUB?BBB	_temp_byte, _currentCounter, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00188	                        initialPercent = currentCounter
	ICALL?L	L00001
	MOVE?BB	_currentCounter, _initialPercent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00189	                        gosub computeCounter
	ICALL?L	L00001
	GOSUB?L	_computeCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00190	                        initialCounter = counter
	ICALL?L	L00001
	MOVE?WW	_counter, _initialCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00191	                        gosub blindsDown
	ICALL?L	L00001
	GOSUB?L	_blindsDown

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00192	                        currentCounter = temp_byte
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _currentCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00193	                        gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00194	                     else
	ICALL?L	L00001
	GOTO?L	L00054
	LABEL?L	L00053	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00195	                        temp2_byte = currentCounter - temp_byte
	ICALL?L	L00001
	SUB?BBB	_currentCounter, _temp_byte, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00196	                        initialPercent = currentCounter
	ICALL?L	L00001
	MOVE?BB	_currentCounter, _initialPercent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00197	                        gosub computeCounter
	ICALL?L	L00001
	GOSUB?L	_computeCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00198	                        initialCounter = counter
	ICALL?L	L00001
	MOVE?WW	_counter, _initialCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00199	                        gosub blindsUp
	ICALL?L	L00001
	GOSUB?L	_blindsup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00200	                        currentCounter = temp_byte
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _currentCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00201	                        gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00202	                     endif
	ICALL?L	L00001
	LABEL?L	L00054	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00203	                    endif
	ICALL?L	L00001
	LABEL?L	L00052	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00204	                  endif  
	ICALL?L	L00001
	LABEL?L	L00049	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00205	                endif                                                   
	ICALL?L	L00001
	LABEL?L	L00047	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00206	             endif
	ICALL?L	L00001
	LABEL?L	L00045	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00207	            else
	ICALL?L	L00001
	GOTO?L	L00044
	LABEL?L	L00043	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00208	             if (data_in[3] == "s") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 073h, L00055

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00209	              if (currentDirection != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_currentDirection, 000h, L00057

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00210	                temp_word = initialCounter - counter
	ICALL?L	L00001
	SUB?WWW	_initialCounter, _counter, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00211	                disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00212	                temp_word = temp_word * 100
	MUL?WCW	_temp_word, 064h, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00213	                temp2_word = DIV32 timeout_value
	DIV32?WW	_timeout_value, _temp2_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00214	                enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00215	                if (currentDirection == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_currentDirection, 001h, L00059

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00216	                    temp3_word = initialPercent + temp2_word
	ICALL?L	L00001
	ADD?BWW	_initialPercent, _temp2_word, _temp3_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00217	                    if (temp3_word > 100 ) then temp3_word = 100
	ICALL?L	L00001
	CMPLE?WCL	_temp3_word, 064h, L00061
	MOVE?CW	064h, _temp3_word
	LABEL?L	L00061	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00218	                    currentCounter = temp3_word
	ICALL?L	L00001
	MOVE?WB	_temp3_word, _currentCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00219	                else
	ICALL?L	L00001
	GOTO?L	L00060
	LABEL?L	L00059	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00220	                 if (currentDirection == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_currentDirection, 002h, L00063

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00221	                    if (initialPercent > temp2_word) then
	ICALL?L	L00001
	CMPLE?BWL	_initialPercent, _temp2_word, L00065

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00222	                        currentCounter = initialPercent - temp2_word
	ICALL?L	L00001
	SUB?BWB	_initialPercent, _temp2_word, _currentCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00223	                    else
	ICALL?L	L00001
	GOTO?L	L00066
	LABEL?L	L00065	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00224	                        currentCounter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _currentCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00225	                    endif
	ICALL?L	L00001
	LABEL?L	L00066	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00226	                 endif
	ICALL?L	L00001
	LABEL?L	L00063	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00227	                endif
	ICALL?L	L00001
	LABEL?L	L00060	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00228	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00229	                counter = 4
	ICALL?L	L00001
	MOVE?CW	004h, _counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00230	              else
	ICALL?L	L00001
	GOTO?L	L00058
	LABEL?L	L00057	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00231	                gosub sendDataOK            
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00232	                counter = 4
	ICALL?L	L00001
	MOVE?CW	004h, _counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00233	              endif
	ICALL?L	L00001
	LABEL?L	L00058	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00234	             endif
	ICALL?L	L00001
	LABEL?L	L00055	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00235	            endif
	ICALL?L	L00001
	LABEL?L	L00044	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00236	           endif
	ICALL?L	L00001
	LABEL?L	L00042	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00237	          endif
	ICALL?L	L00001
	LABEL?L	L00040	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00238	         endif
	ICALL?L	L00001
	LABEL?L	L00038	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00239	        endif
	ICALL?L	L00001
	LABEL?L	L00032	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00240	     else
	ICALL?L	L00001
	GOTO?L	L00030
	LABEL?L	L00029	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00241	      if (data_in[2] == "s") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 073h, L00067

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00242	            temp_data[0] = "5"
	ICALL?L	L00001
	MOVE?CB	035h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00243	            temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00244	            temp_data[2] = RELAY_DOWN + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY_DOWN, 030h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00245	            temp_data[3] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00246	            temp_data[4] = RELAY_UP + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY_UP, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00247	            temp_data[5] = "|"            
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00248	            temp_byte = timeout_value / 30
	ICALL?L	L00001
	DIV?WCB	_timeout_value, 01Eh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00249	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00250	            temp_data[6] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00251	            temp_data[7] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00252	            temp_data[8] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00253	            temp_data[9] = "|"            
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00255	            temp_byte = seconds
	ICALL?L	L00001
	MOVE?BB	_seconds, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00256	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00257	            temp_data[10] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00258	            temp_data[11] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00259	            temp_data[12] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 0000Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00260	            temp_data[13] = 13    
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 0000Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00261	            temp_data[14] = 10    
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 0000Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00262	      else
	ICALL?L	L00001
	GOTO?L	L00068
	LABEL?L	L00067	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00263	       if (data_in[2] == "p") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 070h, L00069

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00264	            if (data_in[3] == "n") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 06Eh, L00071

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00265	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00266	            endif
	ICALL?L	L00001
	LABEL?L	L00071	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00267	       else
	ICALL?L	L00001
	GOTO?L	L00070
	LABEL?L	L00069	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00268	        if (data_in[2] == "u") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 075h, L00073

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00269	         gosub blindsUp
	ICALL?L	L00001
	GOSUB?L	_blindsup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00270	         gosub sendDataOK        
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00271	        else
	ICALL?L	L00001
	GOTO?L	L00074
	LABEL?L	L00073	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00272	         if (data_in[2] == "d") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 064h, L00075

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00273	          gosub blindsDown
	ICALL?L	L00001
	GOSUB?L	_blindsDown

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00274	          gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00275	         else
	ICALL?L	L00001
	GOTO?L	L00076
	LABEL?L	L00075	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00276	          if (data_in[2] == "e") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 065h, L00077

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00277	           gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00278	           gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00279	          endif
	ICALL?L	L00001
	LABEL?L	L00077	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00280	         endif
	ICALL?L	L00001
	LABEL?L	L00076	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00281	        endif
	ICALL?L	L00001
	LABEL?L	L00074	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00282	       endif
	ICALL?L	L00001
	LABEL?L	L00070	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00283	      endif
	ICALL?L	L00001
	LABEL?L	L00068	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00284	     endif
	ICALL?L	L00001
	LABEL?L	L00030	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00285	    endif
	ICALL?L	L00001
	LABEL?L	L00024	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00286	    if (temp_data[0] == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp_data, 000h, L00079

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00287	        temp_data[0] = "E"
	ICALL?L	L00001
	MOVE?CB	045h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00288	        temp_data[1] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00289	        temp_data[2] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00290	        temp_data[3] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00291	        temp_data[4] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00292	        temp_data[5] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00293	        temp_data[6] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00294	    endif
	ICALL?L	L00001
	LABEL?L	L00079	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00295	endif
	ICALL?L	L00001
	LABEL?L	L00021	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00297	data_out[0]=Fifo_status 'Read FIFO status
	ICALL?L	L00001
	MOVE?CB	_Fifo_status, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00298	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00299	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00300	val= data_in[1] 'FIFO status register
	ICALL?L	L00001
	MOVE?BB	_data_in + 00001h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00301	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	ICALL?L	L00001
	CMPEQ?TCL	_val_0, 000h, _lop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00302	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	ICALL?L	L00001
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00303	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	ICALL?L	L00001
	MOVE?CB	040h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00304	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00305	gosub spi_write
	ICALL?L	L00001
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00306	pause 2 'wait 2ms Rx<->Tx
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00307	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00308	end
	ICALL?L	L00001
	END?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00310	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00311	intManagement:

	LABEL?L	_intManagement	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00312	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON_2, 001h, L00081

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00313	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00314	           if (counter > 0) then
	CMPLE?WCL	_counter, 000h, L00083

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00315	               counter = counter - 1
	SUB?WCW	_counter, 001h, _counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00316	               if (counter == 0) then
	CMPNE?WCL	_counter, 000h, L00085

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00317	                    GOSUB stopBlinds
	GOSUB?L	_stopBlinds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00318	               endif
	LABEL?L	L00085	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00319	           endif
	LABEL?L	L00083	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00320	           If ticks < 31 Then tiexit
	CMPLT?BCL	_ticks, 01Fh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00321	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00322	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00323	           if seconds <= 59 then tiexit
	CMPLE?BCL	_seconds, 03Bh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00324	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00325	           tiexit: 

	LABEL?L	_tiexit	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00326	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00327	        endif
	LABEL?L	L00081	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00328	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00329	resume
	RESUME?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00330	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00332	stopBlinds:

	LABEL?L	_stopBlinds	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00333	    low RELAY_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00334	    low RELAY_UP
	ICALL?L	L00001
	LOW?T	_RELAY_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00335	    gosub sendCurrentPosition
	ICALL?L	L00001
	GOSUB?L	_sendCurrentPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00336	    currentDirection = 0
	ICALL?L	L00001
	MOVE?CB	000h, _currentDirection

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00337	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00339	stopBlindsSilent:

	LABEL?L	_stopBlindsSilent	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00340	    low RELAY_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00341	    low RELAY_UP
	ICALL?L	L00001
	LOW?T	_RELAY_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00342	    currentDirection = 0
	ICALL?L	L00001
	MOVE?CB	000h, _currentDirection

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00343	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00345	blindsUp:

	LABEL?L	_blindsup	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00346	    gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00347	    pause 100
	ICALL?L	L00001
	PAUSE?C	064h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00348	    high RELAY_DOWN
	ICALL?L	L00001
	HIGH?T	_RELAY_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00349	    low RELAY_UP
	ICALL?L	L00001
	LOW?T	_RELAY_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00350	    currentDirection = 2
	ICALL?L	L00001
	MOVE?CB	002h, _currentDirection

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00351	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00353	blindsDown:

	LABEL?L	_blindsDown	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00354	    gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00355	    pause 100
	ICALL?L	L00001
	PAUSE?C	064h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00356	    LOW RELAY_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00357	    HIGH RELAY_UP
	ICALL?L	L00001
	HIGH?T	_RELAY_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00358	    currentDirection = 1
	ICALL?L	L00001
	MOVE?CB	001h, _currentDirection

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00359	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00361	sendCurrentPosition:

	LABEL?L	_sendCurrentPosition	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00362	    temp_data[0] = "l"
	ICALL?L	L00001
	MOVE?CB	06Ch, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00363	    temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00364	    temp_byte = currentCounter
	ICALL?L	L00001
	MOVE?BB	_currentCounter, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00365	    gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00366	    temp_data[2] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00367	    temp_data[3] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00368	    temp_data[4] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00369	    temp_data[5] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00370	    temp_data[6] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00371	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00373	computeCounter:

	LABEL?L	_computeCounter	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00374	    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00375	    temp_word = timeout_value * temp2_byte
	MUL?WBW	_timeout_value, _temp2_byte, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00376	    counter = div32 100
	DIV32?CW	064h, _counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00377	    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00378	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00380	sendDataOK:

	LABEL?L	_sendDataOK	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00381	    temp_data[0] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00382	    temp_data[1] = "K"
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00383	    temp_data[2] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00384	    temp_data[3] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00385	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00387	convertInputData:

	LABEL?L	_convertInputData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00388	    conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00389	    TEMP_BYTE="a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00390	    for ci=0 to 2    
	ICALL?L	L00001
	MOVE?CB	000h, _ci
	LABEL?L	L00087	
	CMPGT?BCL	_ci, 002h, L00088

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00391	        TEMP1_BYTE = "a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00392	        TEMP2_BYTE = data_in[i]
	ICALL?L	L00001
	AOUT?BBB	_data_in, _i, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00393	        if (TEMP2_BYTE == "|") then return
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 07Ch, L00089
	RETURN?	
	LABEL?L	L00089	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00394	        GOSUB lookupChar
	ICALL?L	L00001
	GOSUB?L	_lookupChar

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00395	        if (TEMP1_BYTE == "a") then return 
	ICALL?L	L00001
	CMPNE?BCL	_temp1_byte, 061h, L00091
	RETURN?	
	LABEL?L	L00091	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00396	        if (ci==0) then 
	ICALL?L	L00001
	CMPNE?BCL	_ci, 000h, L00093

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00397	            TEMP_BYTE = TEMP1_BYTE
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00398	            conversionSuccess = 1 
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00399	        else 
	ICALL?L	L00001
	GOTO?L	L00094
	LABEL?L	L00093	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00400	            TEMP_BYTE = TEMP_BYTE*10 + TEMP1_BYTE
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 00Ah, T1
	ADD?WBB	T1, _temp1_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00401	            conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00402	        endif
	ICALL?L	L00001
	LABEL?L	L00094	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00403	        i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00404	    next ci
	ICALL?L	L00001
	NEXT?BCL	_ci, 001h, L00087
	LABEL?L	L00088	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00405	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00407	lookupChar:

	LABEL?L	_lookupChar	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00408	    LOOKDOWN temp2_byte,["0123456789"], temp1_byte
	ICALL?L	L00001
	LOOKDOWN?BCLB	_temp2_byte, 00Ah, L00002, _temp1_byte
	LDRET?C	030h
	LDRET?C	031h
	LDRET?C	032h
	LDRET?C	033h
	LDRET?C	034h
	LDRET?C	035h
	LDRET?C	036h
	LDRET?C	037h
	LDRET?C	038h
	LDRET?C	039h

	LABEL?L	L00002	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00409	RETURN
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00411	convertNoToStr:

	LABEL?L	_convertNoToStr	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00412	        temp3_byte = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCB	T1, 030h, _temp3_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00413	        temp2_byte = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCB	T1, 030h, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00414	        temp1_byte = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCB	T1, 030h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00415	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00417	setRxAddressPipe:

	LABEL?L	_setRxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00418	READ 6, data_out[1]
	ICALL?L	L00001
	READ?CB	006h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00419	READ 7, data_out[2]
	ICALL?L	L00001
	READ?CB	007h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00420	READ 8, data_out[3]
	ICALL?L	L00001
	READ?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00421	READ 9, data_out[4]
	ICALL?L	L00001
	READ?CB	009h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00422	data_out[5] = device_id
	ICALL?L	L00001
	MOVE?BB	_device_id, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00423	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00425	setTxAddressPipe:

	LABEL?L	_setTxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00426	READ 1, data_out[1]
	ICALL?L	L00001
	READ?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00427	READ 2, data_out[2]
	ICALL?L	L00001
	READ?CB	002h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00428	READ 3, data_out[3]
	ICALL?L	L00001
	READ?CB	003h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00429	READ 4, data_out[4]
	ICALL?L	L00001
	READ?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00430	READ 5, data_out[5]
	ICALL?L	L00001
	READ?CB	005h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~1.PBP	00431	return
	ICALL?L	L00001
	RETURN?	

	END
