
; PicBasic Pro Compiler 2.46, (c) 1998, 2005 microEngineering Labs, Inc. All Rights Reserved.  
PM_USED			EQU	1

	INCLUDE	"16F690.INC"


; Define statements.
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4
#define		CODE_SIZE		 4
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00025	 DEFINE OSC 8
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 012h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T2              		EQU	RAM_START + 014h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00026	FLAGS   VAR     BYTE BANK0 SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 016h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00025	GOP     VAR     BYTE BANK0 SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 017h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00022	RM1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 018h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00024	RM2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 019h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00021	RR1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 01Ah
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00023	RR2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 01Bh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00016	data_in var Byte[payloadLengthD] 'data received
_data_in         		EQU	RAM_START + 01Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00015	data_out VAR BYTE[payloadLengthD] 'data sent
_data_out        		EQU	RAM_START + 034h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00014	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 04Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00063	temp_word var word
_temp_word       		EQU	RAM_START + 04Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00050	alarmCounter VAR byte
_alarmCounter    		EQU	RAM_START + 050h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00065	ALEnterCounter VAR BYTE
_ALEnterCounter  		EQU	RAM_START + 051h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00066	ALLeaveCounter VAR BYTE
_ALLeaveCounter  		EQU	RAM_START + 052h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00064	ALSTATUS VAR BYTE '0 disabled, 1 enabled, 2 activated, 3 leave timeout running, 4 enter timeout running
_ALSTATUS        		EQU	RAM_START + 053h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00056	configure var byte
_configure       		EQU	RAM_START + 054h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00069	conversionSuccess var byte
_conversionSuccess		EQU	RAM_START + 055h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00026	device_id var byte
_device_id       		EQU	RAM_START + 056h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00053	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 057h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00031	interi var byte
_interi          		EQU	RAM_START + 058h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00028	ir var byte
_ir              		EQU	RAM_START + 059h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00054	j var byte
_j               		EQU	RAM_START + 05Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00020	k VAR byte
_k               		EQU	RAM_START + 05Bh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00067	l1counter var byte
_l1counter       		EQU	RAM_START + 05Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00068	l1onAlarm var byte
_l1onAlarm       		EQU	RAM_START + 05Dh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00012	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 05Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00055	relay_alarm_counter var byte
_relay_alarm_counter		EQU	RAM_START + 05Fh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00017	data_received var Byte[payloadLengthD] 'data received
_data_received   		EQU	RAM_START + 080h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00018	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 098h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00027	sameFlag VAR BYTE
_sameFlag        		EQU	RAM_START + 0AEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00030	seconds var byte
_seconds         		EQU	RAM_START + 0AFh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00059	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 0B0h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00022	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 0B1h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00060	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 0B2h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00023	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 0B3h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00061	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 0B4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00024	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 0B5h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00062	temp4_byte var byte
_temp4_byte      		EQU	RAM_START + 0B6h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00025	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 0B7h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00058	temp_byte var byte
_temp_byte       		EQU	RAM_START + 0B8h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00057	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 0B9h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00021	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 0BAh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00029	ticks var byte
_ticks           		EQU	RAM_START + 0BBh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00013	val var byte 'temp value
_val             		EQU	RAM_START + 0BCh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00019	w var byte
_w               		EQU	RAM_START + 0BDh
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
#define _alarm           	_PORTC_1
#define _RES             	_PORTB_5
#define _RELAY           	_PORTA_4
#define _SSPCON_5        	 SSPCON, 005h
#define _SSPCON_4        	 SSPCON, 004h
#define _SSPSTAT_7       	 SSPSTAT, 007h
#define _SSPSTAT_6       	 SSPSTAT, 006h
#define _PIR1_3          	 PIR1, 003h
#define _PORTA_2         	 PORTA, 002h
#define _PORTC_0         	 PORTC, 000h
#define _PORTC_2         	 PORTC, 002h
#define _SSPCON_0        	 SSPCON, 000h
#define _val_0           	_val, 000h
#define _PORTC_1         	 PORTC, 001h
#define _PORTB_5         	 PORTB, 005h
#define _PORTA_4         	 PORTA, 004h
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00021	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,0,0]
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

	INCLUDE	"LIGHTA~1.MAC"
	INCLUDE	"PBPPIC14.LIB"


; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00012	BANK0   $0020, $007F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00013	BANK1   $00A0, $00EF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00014	BANK2   $0120, $016F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00015	EEPROM  $2100, $21FF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00016	LIBRARY "PBPPIC14"
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00019	        include "PIC14EXT.BAS"

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00026	        include "PBPPIC14.RAM"

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00005	@ DEVICE PIC16F690,MCLR_OFF

	ASM?
 DEVICE PIC16F690,MCLR_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00006	@ DEVICE PIC16F690,CPD_OFF

	ASM?
 DEVICE PIC16F690,CPD_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00007	@ DEVICE PIC16F690,BOD_ON

	ASM?
 DEVICE PIC16F690,BOD_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00008	@ DEVICE PIC16F690,PWRT_ON

	ASM?
 DEVICE PIC16F690,PWRT_ON

	ENDASM?

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00021	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,0,0]

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00023	 INCLUDE "RFM73.pbp"
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00010	payloadLength con 22
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00011	payloadLengthD con 24
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00034	Idle_int con $00 'Idle no interrupt pending
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00035	Max_rt con $10 'Max # of Tx retrans interrupt
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00036	Tx_inter con $30 'Tx interrupted
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00037	Rx_ds con $40 'Rx data received
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00039	Read_reg con $00 'def read command to register
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00040	Write_reg CON $20 'def write command to register
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00041	Rd_rx_pload con $61 'def Rx payload register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00042	Wr_tx_pload con $A0 'def Tx payload register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00043	Flush_tx con $E1 'def flush Tx register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00044	Flush_rx con $E2 'def flush Rx register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00045	Reuse_tx_pl con $E3 'def reuse Tx payload register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00046	Nop_comm con $FF 'def No operation
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00048	Config_nrf con $00 'Config register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00049	En_aa con $01 'enable auto acknowledgment register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00050	En_rxaddr con $02 'enable RX addresses register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00051	Setup_aw con $03 'setup address width register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00052	Setup_retr con $04 'setup auto retrans register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00053	Rf_ch con $05 'RF channel register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00054	Rf_setup con $06 'RF setup register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00055	Stat_us con $07 'Status register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00056	Observe_tx con $08 'Observe TX register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00057	Cd con $09 'Carrier detect register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00058	Rx_addr_p0 con $0A 'RX address pipe0 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00059	Rx_addr_p1 con $0B 'RX address pipe1 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00060	Rx_addr_p2 con $0C 'RX address pipe2 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00061	Rx_addr_p3 con $0D 'RX address pipe3 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00062	Rx_addr_p4 con $0E 'RX address pipe4 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00063	Rx_addr_p5 con $0F 'RX address pipe5 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00064	Tx_addr con $10 'TX address register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00065	Rx_pw_p0 con $11 'RX payload width pipe0 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00066	Rx_pw_p1 con $12 'RX payload width pipe1 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00067	Rx_pw_p2 con $13 'RX payload width pipe2 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00068	Rx_pw_p3 con $14 'RX payload width pipe3 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00069	Rx_pw_p4 con $15 'RX payload width pipe4 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00070	Rx_pw_p5 con $16 'RX payload width pipe5 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00071	Fifo_status con $17 'FIFO status register register address

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00073	goto endRFM73
	GOTO?L	_endRFM73

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00074	initModule:

	LABEL?L	_initModule	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00075	pause 200
	PAUSE?C	0C8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00077	SSPEN = 1 'enable SPI pins
	MOVE?CT	001h, _SSPEN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00078	SSPCON.0=1 'SPI rate=OSC/16
	MOVE?CT	001h, _SSPCON_0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00079	CKP = 0 'clock idle low
	MOVE?CT	000h, _CKP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00080	CKE = 1 'transmit on active to idle
	MOVE?CT	001h, _CKE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00081	SSPIF = 0 'clear buffer full status
	MOVE?CT	000h, _SSPIF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00082	SMP = 0 'sample in middle of data
	MOVE?CT	000h, _SMP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00084	Ce=1 'init spi pins
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00085	pause 10 'wait 10 ms hardware is stable
	PAUSE?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00086	Ce=0 'set CE pin low disable Rx
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00087	CSN=0 'set CSN pin low
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00088	Pack_count=0 'number of packets sent
	MOVE?CW	000h, _Pack_count

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00089	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00091	commonRXTX:

	LABEL?L	_commonRXTX	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00092	data_out[0]=Write_reg+Rx_addr_p0 'Rx address for pipe0
	MOVE?CB	02Ah, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00093	gosub setRxAddressPipe
	GOSUB?L	_setRxAddressPipe

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00094	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00095	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00096	data_out[0]=Write_reg+En_aa 'enable auto ACK pipe0
	MOVE?CB	021h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00097	data_out[1]=%00000001 '1 enable, 0 disable
	MOVE?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00099	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00100	data_out[0]=Write_reg+En_rxaddr 'enable Rx address pipe0
	MOVE?CB	022h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00101	data_out[1]=$01
	MOVE?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00102	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00103	data_out[0]=Write_reg+Rf_ch 'Set RF channel
	MOVE?CB	025h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00104	READ 0, data_out[1] 'number of channel used
	READ?CB	000h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00105	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00106	data_out[0]=Write_reg+Rx_pw_p0 'Set Rx pload width pipe0
	MOVE?CB	031h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00107	data_out[1]=payloadLength 'number of bytes used in data sent
	MOVE?CB	_payloadLength, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00108	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00109	data_out[0]=Write_reg+Rf_setup 'Set RF: 'Set RF:5dbm
	MOVE?CB	026h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00110	data_out[1]=%00100111 '250kbit
	MOVE?CB	027h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00112	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 1
	MOVE?CB	001h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00115	gosub setBank
	GOSUB?L	_setBank

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	000h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	040h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	001h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	0E2h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00117	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	001h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	0C0h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00119	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0D0h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0FCh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	08Ch, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00121	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	003h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	099h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	000h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	039h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	041h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00123	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	004h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	0D9h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	096h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	082h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	01Bh, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00125	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	005h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	028h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	002h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	07Fh, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	0A6h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00127	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	00Ch, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	012h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	073h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00129	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00130	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	00Dh, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00130	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	046h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00130	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	0B4h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00130	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	080h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00130	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00131	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00132	data_out[0]=Write_reg+$0E
	MOVE?CB	02Eh, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00133	data_out[1]=$41
	MOVE?CB	041h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00134	data_out[2]=$20
	MOVE?CB	020h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00135	data_out[3]=$08
	MOVE?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00136	data_out[4]=$04
	MOVE?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00137	data_out[5]=$81
	MOVE?CB	081h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00138	data_out[6]=$20
	MOVE?CB	020h, _data_out + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00139	data_out[7]=$CF
	MOVE?CB	0CFh, _data_out + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00140	data_out[8]=$F7
	MOVE?CB	0F7h, _data_out + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00141	data_out[9]=$FE
	MOVE?CB	0FEh, _data_out + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00142	data_out[10]=$FF
	MOVE?CB	0FFh, _data_out + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00143	data_out[11]=$FF
	MOVE?CB	0FFh, _data_out + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00144	num_byte=11
	MOVE?CB	00Bh, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00145	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00146	temp_byte_rfm = 0
	MOVE?CB	000h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00147	gosub setBank
	GOSUB?L	_setBank

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00148	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00150	setBank:

	LABEL?L	_setBank	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00151	data_out[0]=Read_reg+$07
	MOVE?CB	007h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00152	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00153	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00154	if (temp_byte_rfm != (data_in[0] & $80)) then
	AND?BCW	_data_in, 080h, T1
	CMPEQ?BWL	_temp_byte_rfm, T1, L00003

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00156	    data_out[0]=$50
	MOVE?CB	050h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00157	    data_out[1]=$53    
	MOVE?CB	053h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00158	    gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00159	endif
	LABEL?L	L00003	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00160	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00162	conf4bytes:

	LABEL?L	_conf4bytes	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00163	data_out[0]=Write_reg+temp_byte_rfm
	ADD?CBB	_Write_reg, _temp_byte_rfm, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00164	data_out[1]=temp1_byte_rfm
	MOVE?BB	_temp1_byte_rfm, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00165	data_out[2]=temp2_byte_rfm
	MOVE?BB	_temp2_byte_rfm, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00166	data_out[3]=temp3_byte_rfm
	MOVE?BB	_temp3_byte_rfm, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00167	data_out[4]=temp4_byte_rfm
	MOVE?BB	_temp4_byte_rfm, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00168	num_byte=4
	MOVE?CB	004h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00169	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00170	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00172	sendData:

	LABEL?L	_sendData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00173	gosub debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00174	pause 30
	PAUSE?C	01Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00175	GOSUB debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00176	data_out[0]=Flush_tx 'flush TX_fifo buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00177	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00178	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00179	data_out[0]=Write_reg+Stat_us 'reset IRQ bits
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00180	data_out[1]=%00110000
	MOVE?CB	030h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00181	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00182	gosub setup_tx 'setup Tx
	GOSUB?L	_setup_tx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00183	data_out[0]=Wr_tx_pload 'put 10 bytes data in Tx pload buffer
	MOVE?CB	_Wr_tx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00184	data_out[1]=device_id
	MOVE?BB	_device_id, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00185	for w = 2 to payloadLength+1
	MOVE?CB	002h, _w
	LABEL?L	L00005	
	CMPGT?BCL	_w, 017h, L00006

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00186	    data_out[w]=temp_data[w-2]
	SUB?BCW	_w, 002h, T1
	AOUT?BWB	_temp_data, T1, T1
	AIN?BBB	T1, _data_out, _w

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00187	    if data_out[w] == 10 then contSendX1
	AOUT?BBB	_data_out, _w, T1
	CMPEQ?BCL	T1, 00Ah, _contSendX1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00188	next w
	NEXT?BCL	_w, 001h, L00005
	LABEL?L	L00006	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00189	:contSendX1

	LABEL?L	_contSendX1	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00190	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00191	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00192	pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00193	Ce=1 'CE=1 (toggle) transmit FIFO buffer
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00194	Pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00195	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00196	Pause 1
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00197	trans_irq:

	LABEL?L	_trans_irq	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00198	If Irq !=0 then trans_irq 'wait until IRQ, active low
	CMPNE?TCL	_Irq, 000h, _trans_irq

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00199	data_out[0]=Stat_us 'read status register
	MOVE?CB	_Stat_us, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00200	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00201	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00202	val=data_in[0]&%01110000 'mask the IRQ bits STATUS byte
	AND?BCB	_data_in, 070h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00203	if (val = Max_rt) then gosub max_retry 'maximum TX retries
	CMPNE?BCL	_val, _Max_rt, L00007
	GOSUB?L	_max_retry
	LABEL?L	L00007	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00204	if (val = Tx_inter) then gosub tx_int 'Tx interrupted
	CMPNE?BCL	_val, _Tx_inter, L00009
	GOSUB?L	_tx_int
	LABEL?L	L00009	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00205	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00206	data_out[1]=%00100000 'clear TX_DS IRQ bit
	MOVE?CB	020h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00207	gosub spi_write1
	GOSUB?L	_spi_write1

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

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00221	spi_write1:

	LABEL?L	_spi_write1	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00222	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00223	spi_write:

	LABEL?L	_spi_write	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00224	CSN=0
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00225	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00011	
	CMPGT?BBL	_w, _num_byte, L00012

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00226	SSPBUF=data_out[w] 'send array variable
	AOUT?BBB	_data_out, _w, SSPBUF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00227	GoSub buffer_ok 'wait until buffer ready
	GOSUB?L	_buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00228	Next w 'next location
	NEXT?BCL	_w, 001h, L00011
	LABEL?L	L00012	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00229	CSN=1
	MOVE?CT	001h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00230	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00232	spi_read:

	LABEL?L	_spi_read	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00233	CSN=0
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00234	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00013	
	CMPGT?BBL	_w, _num_byte, L00014

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00235	    SSPBUF = data_out[0] 'write to SSPBUF to start clock
	MOVE?BB	_data_out, SSPBUF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00236	    GoSub buffer_ok 'wait for receipt
	GOSUB?L	_buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00237	data_in[w] = SSPBUF 'store received character in array
	AIN?BBB	SSPBUF, _data_in, _w

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00238	Next w 'get next byte
	NEXT?BCL	_w, 001h, L00013
	LABEL?L	L00014	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00239	CSN=1
	MOVE?CT	001h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00240	Return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00241	buffer_ok:

	LABEL?L	_buffer_ok	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00242	IF SSPIF = 0 Then buffer_ok 'wait for SPI interupt flag
	CMPEQ?TCL	_SSPIF, 000h, _buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00243	SSPIF = 0 'reset flag
	MOVE?CT	000h, _SSPIF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00244	Return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00246	max_retry:

	LABEL?L	_max_retry	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00247	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00248	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00249	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00250	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00251	data_out[1]=%00010000 'clear MAX_RT IRQ bit
	MOVE?CB	010h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00252	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00253	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00255	tx_int:

	LABEL?L	_tx_int	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00256	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00257	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00258	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00259	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00260	data_out[1]=%00110000 'clear TX_DS & MAX_RT IRQ bit
	MOVE?CB	030h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00261	gosub spi_write1
	GOSUB?L	_spi_write1

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

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00268	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00269	gosub debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00270	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00272	setup_sleep:

	LABEL?L	_setup_sleep	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00273	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=0, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00274	data_out[1]=%00001101
	MOVE?CB	00Dh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00275	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00276	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00278	setup_tx:

	LABEL?L	_setup_tx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00279	data_out[0]=Write_reg+Tx_addr 'Tx address
	MOVE?CB	030h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00280	gosub setTxAddressPipe
	GOSUB?L	_setTxAddressPipe

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00281	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00282	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00283	data_out[0]= Write_reg+Setup_retr 'Set retransmit @ ACK
	MOVE?CB	024h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00284	data_out[1]= %11111111 '15x re-transmit (default)
	MOVE?CB	0FFh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00285	Gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00286	data_out[0]=Write_reg+Config_nrf 'Config:PRX=0,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00287	data_out[1]=$0E
	MOVE?CB	00Eh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00288	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00289	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00291	ackData:

	LABEL?L	_ackData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00292	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00293	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00294	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00296	sameFlag = 1
	MOVE?CB	001h, _sameFlag

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00297	for ir=0 to payloadLengthD - 1
	MOVE?CB	000h, _ir
	LABEL?L	L00015	
	CMPGT?BCL	_ir, 017h, L00016

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00298	    if (data_received[ir] != data_in[ir]) then sameFlag = 0
	AOUT?BBB	_data_received, _ir, T1
	AOUT?BBB	_data_in, _ir, T2
	CMPEQ?BBL	T1, T2, L00017
	MOVE?CB	000h, _sameFlag
	LABEL?L	L00017	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00299	    data_received[ir] = data_in[ir]
	AOUT?BBB	_data_in, _ir, T1
	AIN?BBB	T1, _data_received, _ir

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00300	    if (data_received[ir] == 10) then cntAckData
	AOUT?BBB	_data_received, _ir, T1
	CMPEQ?BCL	T1, 00Ah, _cntAckData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00301	next ir
	NEXT?BCL	_ir, 001h, L00015
	LABEL?L	L00016	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00302	:cntAckData

	LABEL?L	_cntAckData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00303	data_out[0]=Fifo_status 'Read FIFO status
	MOVE?CB	_Fifo_status, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00304	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00305	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00306	val= data_in[1] 'FIFO status register
	MOVE?BB	_data_in + 00001h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00307	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	CMPEQ?TCL	_val_0, 000h, _lop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00308	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00309	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	MOVE?CB	040h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00310	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00311	pause 2 'wait 2ms Rx<->Tx
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00312	ticks = 0
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00313	if (sameFlag == 1) then Main_rx
	CMPEQ?BCL	_sameFlag, 001h, _Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00314	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00316	:endRFM73

	LABEL?L	_endRFM73	
; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00025	 DEFINE OSC 8

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00027	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00028	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00029	 ANSELH = 0
	MOVE?CB	000h, ANSELH

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00030	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00031	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00034	INTCON = %10100000
	MOVE?CB	0A0h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00035	PIE1 = %00000000
	MOVE?CB	000h, PIE1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00036	OPTION_REG = %00000111
	MOVE?CB	007h, OPTION_REG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00038	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00039	ENABLE
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00042	TRISA = %00000000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	000h, TRISA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00043	TRISB = %00110000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	030h, TRISB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00044	TRISC = %00000110 'Set IRQ input, 
	ICALL?L	L00001
	MOVE?CB	006h, TRISC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00045	WPUA = %00000000
	ICALL?L	L00001
	MOVE?CB	000h, WPUA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00046	WPUB = %00100000
	ICALL?L	L00001
	MOVE?CB	020h, WPUB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00071	startLabel:

	LABEL?L	_startLabel	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00072	clear
	ICALL?L	L00001
	CLEAR?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00073	read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00074	read 13, l1onAlarm
	ICALL?L	L00001
	READ?CB	00Dh, _l1onAlarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00075	input alarm
	ICALL?L	L00001
	INPUT?T	_alarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00076	input RES
	ICALL?L	L00001
	INPUT?T	_RES

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00077	output relay
	ICALL?L	L00001
	OUTPUT?T	_RELAY

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00078	read 11, temp_byte
	ICALL?L	L00001
	READ?CB	00Bh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00079	if (temp_byte == 0) then 
	ICALL?L	L00001
	CMPNE?BCL	_temp_byte, 000h, L00019

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00080	    gosub highRelay
	ICALL?L	L00001
	GOSUB?L	_highRelay

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00081	else
	ICALL?L	L00001
	GOTO?L	L00020
	LABEL?L	L00019	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00082	    gosub lowrelay
	ICALL?L	L00001
	GOSUB?L	_lowrelay

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00083	endif
	ICALL?L	L00001
	LABEL?L	L00020	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00084	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00085	commonSettings:

	LABEL?L	_commonSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00086	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00087	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00090	Main_rx:

	LABEL?L	_Main_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00091	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00092	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00093	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00094	irqLoop:

	LABEL?L	_irqLoop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00096	if RES == 0 then
	ICALL?L	L00001
	CMPNE?TCL	_RES, 000h, L00021

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00097	    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00098	    write 0, 40
	WRITE?CC	000h, 028h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00099	    write 1, "R"
	WRITE?CC	001h, 052h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00100	    write 2, "E"
	WRITE?CC	002h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00101	    write 3, "M"
	WRITE?CC	003h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00102	    write 4, "O"
	WRITE?CC	004h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00103	    write 5, "T"
	WRITE?CC	005h, 054h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00104	    write 6, "E"
	WRITE?CC	006h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00105	    write 7, "H"
	WRITE?CC	007h, 048h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00106	    write 8, "O"
	WRITE?CC	008h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00107	    write 9, "M"
	WRITE?CC	009h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00108	    write 10, 0
	WRITE?CC	00Ah, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00109	    write 11, 1
	WRITE?CC	00Bh, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00110	    write 12, 0
	WRITE?CC	00Ch, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00111	    write 13, 0
	WRITE?CC	00Dh, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00112	    write 14, 0
	WRITE?CC	00Eh, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00113	    write 15, 0
	WRITE?CC	00Fh, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00114	    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00115	    pause 1000
	ICALL?L	L00001
	PAUSE?C	003E8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00116	    goto startLabel
	ICALL?L	L00001
	GOTO?L	_startLabel

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00117	endif
	ICALL?L	L00001
	LABEL?L	L00021	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00118	if (temp_data[0] != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_data, 000h, L00023

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00119	    if (configure == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_configure, 001h, L00025

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00120	        gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00121	        configure = 0
	ICALL?L	L00001
	MOVE?CB	000h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00122	    endif
	ICALL?L	L00001
	LABEL?L	L00025	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00123	    gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00124	    temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00125	    GOTO main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00126	endif
	ICALL?L	L00001
	LABEL?L	L00023	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00128	if (ALSTATUS == 5) then
	ICALL?L	L00001
	CMPNE?BCL	_ALSTATUS, 005h, L00027

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00129	    ALSTATUS = 2
	ICALL?L	L00001
	MOVE?CB	002h, _ALSTATUS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00130	    temp_data[0] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00131	    temp_data[1] = "L"
	ICALL?L	L00001
	MOVE?CB	04Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00132	    temp_data[2] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00133	    temp_data[3] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00134	    temp_data[4] = "M"
	ICALL?L	L00001
	MOVE?CB	04Dh, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00135	    temp_data[5] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00136	    temp_data[6] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00137	endif
	ICALL?L	L00001
	LABEL?L	L00027	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00138	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00139	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00140	lop:

	LABEL?L	_lop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00141	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00142	gosub ackData
	GOSUB?L	_ackData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00143	temp_data[0] = 0
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00144	if (data_received[1] == device_id) then
	CMPNE?BBL	_data_received + 00001h, _device_id, L00029

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00145	    if (data_received[2] == "c") then    
	CMPNE?BCL	_data_received + 00002h, 063h, L00031

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00146	        if (data_received[3] == "=") then
	CMPNE?BCL	_data_received + 00003h, 03Dh, L00033

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00148	            for i = 0 to 10
	MOVE?CB	000h, _i
	LABEL?L	L00035	
	CMPGT?BCL	_i, 00Ah, L00036

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00149	                disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00150	                write i, data_received[i+4]
	ADD?BCW	_i, 004h, T1
	AOUT?BWB	_data_received, T1, T1
	WRITE?BB	_i, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00151	                enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00152	            next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00035
	LABEL?L	L00036	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00153	            read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00154	            pause 250
	ICALL?L	L00001
	PAUSE?C	0FAh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00155	            configure = 1
	ICALL?L	L00001
	MOVE?CB	001h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00156	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00157	        endif
	ICALL?L	L00001
	LABEL?L	L00033	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00158	    endif
	ICALL?L	L00001
	LABEL?L	L00031	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00159	    if (data_received[2] == "l") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 06Ch, L00037

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00160	        if (data_received[3] == "1") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00003h, 031h, L00039

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00161	            if (data_received[4] == "c") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 063h, L00041

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00162	                if (data_received[5] == "o") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 06Fh, L00043

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00163	                    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00164	                    write 11, 0
	WRITE?CC	00Bh, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00165	                    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00166	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00167	                endif
	ICALL?L	L00001
	LABEL?L	L00043	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00168	                if (data_received[5] == "f") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 066h, L00045

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00169	                    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00170	                    write 11, 1
	WRITE?CC	00Bh, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00171	                    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00172	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00173	                endif
	ICALL?L	L00001
	LABEL?L	L00045	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00174	                if (data_received[5] == "d") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 064h, L00047

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00175	                    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00176	                    write 13, 1
	WRITE?CC	00Dh, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00177	                    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00178	                    l1onAlarm = 1
	ICALL?L	L00001
	MOVE?CB	001h, _l1onAlarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00179	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00180	                endif
	ICALL?L	L00001
	LABEL?L	L00047	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00181	                if (data_received[5] == "c") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 063h, L00049

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00182	                    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00183	                    write 13, 0
	WRITE?CC	00Dh, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00184	                    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00185	                    l1onAlarm = 0
	ICALL?L	L00001
	MOVE?CB	000h, _l1onAlarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00186	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00187	                endif                
	ICALL?L	L00001
	LABEL?L	L00049	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00188	                if (data_received[5] == "t") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 074h, L00051

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00189	                    if (data_received[6] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00006h, 03Dh, L00053

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00190	                        i = 7
	ICALL?L	L00001
	MOVE?CB	007h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00191	                        gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00192	                        if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00055

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00193	                            disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00194	                            write 12, temp_byte
	WRITE?CB	00Ch, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00195	                            enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00196	                            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00197	                        else
	ICALL?L	L00001
	GOTO?L	L00056
	LABEL?L	L00055	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00198	                            gosub sendDataError
	ICALL?L	L00001
	GOSUB?L	_sendDataError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00199	                        endif
	ICALL?L	L00001
	LABEL?L	L00056	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00200	                    endif
	ICALL?L	L00001
	LABEL?L	L00053	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00201	                endif                
	ICALL?L	L00001
	LABEL?L	L00051	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00202	            endif
	ICALL?L	L00001
	LABEL?L	L00041	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00203	            if (data_received[4] == "o") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 06Fh, L00057

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00204	                if (data_received[5] == "f") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 066h, L00059

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00205	                    seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00206	                    read 12, l1counter
	ICALL?L	L00001
	READ?CB	00Ch, _l1counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00207	                    gosub highRelay
	ICALL?L	L00001
	GOSUB?L	_highRelay

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00208	                else
	ICALL?L	L00001
	GOTO?L	L00060
	LABEL?L	L00059	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00209	                    gosub highRelay
	ICALL?L	L00001
	GOSUB?L	_highRelay

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00210	                    l1counter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _l1counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00211	                endif
	ICALL?L	L00001
	LABEL?L	L00060	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00212	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00213	            endif
	ICALL?L	L00001
	LABEL?L	L00057	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00214	            if (data_received[4] == "f") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 066h, L00061

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00215	                gosub LOWrelay
	ICALL?L	L00001
	GOSUB?L	_lowrelay

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00216	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00217	            endif
	ICALL?L	L00001
	LABEL?L	L00061	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00218	        endif
	ICALL?L	L00001
	LABEL?L	L00039	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00219	    endif
	ICALL?L	L00001
	LABEL?L	L00037	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00220	    if (data_received[2] == "a") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 061h, L00063

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00221	        if (data_received[3] == "l") then 
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00003h, 06Ch, L00065

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00222	            if (data_received[4] == "a") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 061h, L00067

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00223	                read 15, ALLeaveCounter
	ICALL?L	L00001
	READ?CB	00Fh, _ALLeaveCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00224	                ALEnterCounter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ALEnterCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00225	                if (ALLeaveCounter == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_ALLeaveCounter, 000h, L00069

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00226	                    alstatus = 1
	ICALL?L	L00001
	MOVE?CB	001h, _ALSTATUS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00227	                else
	ICALL?L	L00001
	GOTO?L	L00070
	LABEL?L	L00069	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00228	                    alstatus = 3
	ICALL?L	L00001
	MOVE?CB	003h, _ALSTATUS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00229	                endif
	ICALL?L	L00001
	LABEL?L	L00070	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00230	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00231	            endif
	ICALL?L	L00001
	LABEL?L	L00067	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00232	            if (data_received[4] == "d") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 064h, L00071

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00233	                alstatus = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ALSTATUS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00234	                ALLeaveCounter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ALLeaveCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00235	                ALEnterCounter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ALEnterCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00236	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00237	            endif
	ICALL?L	L00001
	LABEL?L	L00071	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00238	            if (data_received[4] == "c") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 063h, L00073

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00239	                if (data_received[6] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00006h, 03Dh, L00075

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00240	                    i = 7
	ICALL?L	L00001
	MOVE?CB	007h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00241	                    gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00242	                    if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00077

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00243	                        if (data_received[5] == "e") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 065h, L00079

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00244	                            disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00245	                            write 14, temp_byte
	WRITE?CB	00Eh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00246	                            enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00247	                            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00248	                        endif
	ICALL?L	L00001
	LABEL?L	L00079	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00249	                        if (data_received[5] == "l") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 06Ch, L00081

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00250	                            disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00251	                            write 15, temp_byte
	WRITE?CB	00Fh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00252	                            enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00253	                            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00254	                        endif
	ICALL?L	L00001
	LABEL?L	L00081	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00255	                    endif
	ICALL?L	L00001
	LABEL?L	L00077	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00256	                endif
	ICALL?L	L00001
	LABEL?L	L00075	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00257	            endif
	ICALL?L	L00001
	LABEL?L	L00073	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00258	        endif
	ICALL?L	L00001
	LABEL?L	L00065	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00259	    endif
	ICALL?L	L00001
	LABEL?L	L00063	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00260	    if (data_received[2] == "s") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 073h, L00083

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00261	        if (data_received[3] == "a") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00003h, 061h, L00085

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00262	            temp_data[0] = "1"
	ICALL?L	L00001
	MOVE?CB	031h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00263	            temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00264	            temp_data[2] = "a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00265	            temp_data[3] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00266	            temp_data[4] = ALSTATUS + $30
	ICALL?L	L00001
	ADD?BCB	_ALSTATUS, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00267	            temp_data[5] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00268	            temp_data[6] = alarm + $30
	ICALL?L	L00001
	ADD?TCB	_alarm, 030h, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00269	            temp_data[7] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00270	            read 14, temp_byte 
	ICALL?L	L00001
	READ?CB	00Eh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00271	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00272	            temp_data[8] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00273	            temp_data[9] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00274	            temp_data[10] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00275	            temp_data[11] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00276	            read 15, temp_byte 
	ICALL?L	L00001
	READ?CB	00Fh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00277	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00278	            temp_data[12] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 0000Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00279	            temp_data[13] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 0000Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00280	            temp_data[14] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 0000Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00281	            temp_data[15] = 13            
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 0000Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00282	            temp_data[16] = 10            
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00010h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00283	        endif
	ICALL?L	L00001
	LABEL?L	L00085	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00284	        if (data_received[3] == "c") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00003h, 063h, L00087

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00285	            temp_data[0] = "1"
	ICALL?L	L00001
	MOVE?CB	031h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00286	            temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00287	            temp_data[2] = "c"
	ICALL?L	L00001
	MOVE?CB	063h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00288	            temp_data[3] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00289	            temp_data[4] = RELAY + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00290	            temp_data[5] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00291	            read 11, temp_data[6]
	ICALL?L	L00001
	READ?CB	00Bh, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00292	            temp_data[6] = temp_data[6] + $30        
	ICALL?L	L00001
	ADD?BCB	_temp_data + 00006h, 030h, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00293	            temp_data[7] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00294	            read 13, temp_data[8]
	ICALL?L	L00001
	READ?CB	00Dh, _temp_data + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00295	            temp_data[8] = temp_data[8] + $30        
	ICALL?L	L00001
	ADD?BCB	_temp_data + 00008h, 030h, _temp_data + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00296	            temp_data[9] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00297	            read 12, temp_byte
	ICALL?L	L00001
	READ?CB	00Ch, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00298	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00299	            temp_data[10] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00300	            temp_data[11] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00301	            temp_data[12] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 0000Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00302	            temp_data[13] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 0000Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00303	            temp_byte = l1counter
	ICALL?L	L00001
	MOVE?BB	_l1counter, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00304	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00305	            temp_data[14] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 0000Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00306	            temp_data[15] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 0000Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00307	            temp_data[16] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 00010h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00308	            temp_data[17] = 13    
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00011h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00309	            temp_data[18] = 10    
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00012h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00310	        endif
	ICALL?L	L00001
	LABEL?L	L00087	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00311	    endif
	ICALL?L	L00001
	LABEL?L	L00083	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00312	    if (data_received[2] == "p") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 070h, L00089

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00313	            if (data_received[3] == "n") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00003h, 06Eh, L00091

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00314	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00315	            endif
	ICALL?L	L00001
	LABEL?L	L00091	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00316	    endif
	ICALL?L	L00001
	LABEL?L	L00089	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00317	    if (temp_data[0] == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp_data, 000h, L00093

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00318	        gosub sendDataError
	ICALL?L	L00001
	GOSUB?L	_sendDataError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00319	    endif
	ICALL?L	L00001
	LABEL?L	L00093	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00320	endif
	ICALL?L	L00001
	LABEL?L	L00029	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00321	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00322	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00323	end
	ICALL?L	L00001
	END?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00325	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00326	intManagement:

	LABEL?L	_intManagement	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00327	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON_2, 001h, L00095

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00328	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00329	           if ticks = 10 then
	CMPNE?BCL	_ticks, 00Ah, L00097

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00330	                    for interi=0 to payloadLengthD - 1
	MOVE?CB	000h, _interi
	LABEL?L	L00099	
	CMPGT?BCL	_interi, 017h, L00100

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00331	                        data_received[interi] = 0
	AIN?CBB	000h, _data_received, _interi

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00332	                    next interi
	NEXT?BCL	_interi, 001h, L00099
	LABEL?L	L00100	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00333	           endif
	LABEL?L	L00097	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00334	           If ticks < 31 Then tiexit
	CMPLT?BCL	_ticks, 01Fh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00335	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00336	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00337	           if (ALEnterCounter > 0) then
	CMPLE?BCL	_ALEnterCounter, 000h, L00101

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00338	                ALEnterCounter = ALEnterCounter - 1
	SUB?BCB	_ALEnterCounter, 001h, _ALEnterCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00339	                if (ALEnterCounter == 0) && (alstatus == 4) then
	CMPEQ?BCB	_ALEnterCounter, 000h, T1
	CMPEQ?BCB	_ALSTATUS, 004h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00103

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00340	                      alstatus = 5                      
	MOVE?CB	005h, _ALSTATUS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00341	                endif
	LABEL?L	L00103	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00342	           endif
	LABEL?L	L00101	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00343	           if (ALLeaveCounter > 0) then
	CMPLE?BCL	_ALLeaveCounter, 000h, L00105

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00344	               ALLeaveCounter = ALLeaveCounter - 1
	SUB?BCB	_ALLeaveCounter, 001h, _ALLeaveCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00345	               if (ALLeaveCounter == 0) && (alstatus == 3) then
	CMPEQ?BCB	_ALLeaveCounter, 000h, T1
	CMPEQ?BCB	_ALSTATUS, 003h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00107

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00346	                    alstatus = 1
	MOVE?CB	001h, _ALSTATUS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00347	               endif 
	LABEL?L	L00107	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00348	           endif
	LABEL?L	L00105	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00349	           if (alarm == 1) THEN
	CMPNE?TCL	_alarm, 001h, L00109

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00350	               if (alarmCounter > 0) then
	CMPLE?BCL	_alarmCounter, 000h, L00111

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00351	                    if (ALSTATUS == 1) then
	CMPNE?BCL	_ALSTATUS, 001h, L00113

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00353	                        READ 14, ALEnterCounter
	READ?CB	00Eh, _ALEnterCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00354	                        if (ALEnterCounter == 0) then
	CMPNE?BCL	_ALEnterCounter, 000h, L00115

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00355	                            ALSTATUS = 5
	MOVE?CB	005h, _ALSTATUS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00356	                        else
	GOTO?L	L00116
	LABEL?L	L00115	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00357	                            ALSTATUS = 4
	MOVE?CB	004h, _ALSTATUS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00358	                        endif
	LABEL?L	L00116	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00359	                    endif
	LABEL?L	L00113	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00360	                    if (l1onAlarm = 1) then
	CMPNE?BCL	_l1onAlarm, 001h, L00117

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00361	                        seconds = 0
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00362	                        read 12, l1counter
	READ?CB	00Ch, _l1counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00363	                        gosub highRelay
	GOSUB?L	_highRelay

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00364	                    endif                    
	LABEL?L	L00117	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00365	                    alarmCounter = 0
	MOVE?CB	000h, _alarmCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00366	               else
	GOTO?L	L00112
	LABEL?L	L00111	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00367	                    alarmCounter = alarmCounter + 1
	ADD?BCB	_alarmCounter, 001h, _alarmCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00368	               endif
	LABEL?L	L00112	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00369	           endif
	LABEL?L	L00109	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00370	           if (relay_alarm_counter > 0) then
	CMPLE?BCL	_relay_alarm_counter, 000h, L00119

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00371	               relay_alarm_counter = relay_alarm_counter - 1
	SUB?BCB	_relay_alarm_counter, 001h, _relay_alarm_counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00372	               if (relay_alarm_counter == 0) then
	CMPNE?BCL	_relay_alarm_counter, 000h, L00121

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00373	                    input alarm
	INPUT?T	_alarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00374	               endif 
	LABEL?L	L00121	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00375	           endif
	LABEL?L	L00119	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00376	           if seconds < 59 then tiexit
	CMPLT?BCL	_seconds, 03Bh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00377	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00378	           if (l1counter > 0) then
	CMPLE?BCL	_l1counter, 000h, L00123

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00379	               l1counter = l1counter - 1
	SUB?BCB	_l1counter, 001h, _l1counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00380	               if (l1counter == 0) then
	CMPNE?BCL	_l1counter, 000h, L00125

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00381	                    gosub lowrelay
	GOSUB?L	_lowrelay

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00382	               endif
	LABEL?L	L00125	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00383	           endif           
	LABEL?L	L00123	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00384	           tiexit: 

	LABEL?L	_tiexit	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00385	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00386	        endif
	LABEL?L	L00095	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00387	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00388	resume
	RESUME?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00389	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00391	sendDataOK:

	LABEL?L	_sendDataOK	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00392	    temp_data[0] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00393	    temp_data[1] = "K"
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00394	    temp_data[2] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00395	    temp_data[3] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00396	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00398	sendDataError:

	LABEL?L	_sendDataError	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00399	        temp_data[0] = "E"
	ICALL?L	L00001
	MOVE?CB	045h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00400	        temp_data[1] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00401	        temp_data[2] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00402	        temp_data[3] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00403	        temp_data[4] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00404	        temp_data[5] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00405	        temp_data[6] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00406	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00408	convertInputData:

	LABEL?L	_convertInputData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00409	    conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00410	    TEMP_BYTE="a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00411	    for k=0 to 2    
	ICALL?L	L00001
	MOVE?CB	000h, _k
	LABEL?L	L00127	
	CMPGT?BCL	_k, 002h, L00128

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00412	        TEMP1_BYTE = "a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00413	        TEMP2_BYTE = data_received[i]
	ICALL?L	L00001
	AOUT?BBB	_data_received, _i, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00414	        if (TEMP2_BYTE == "|") then return
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 07Ch, L00129
	RETURN?	
	LABEL?L	L00129	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00415	        GOSUB lookupChar
	ICALL?L	L00001
	GOSUB?L	_lookupChar

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00416	        if (TEMP1_BYTE == "a") then return 
	ICALL?L	L00001
	CMPNE?BCL	_temp1_byte, 061h, L00131
	RETURN?	
	LABEL?L	L00131	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00417	        if (k==0) then 
	ICALL?L	L00001
	CMPNE?BCL	_k, 000h, L00133

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00418	            TEMP_BYTE = TEMP1_BYTE 
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00419	            conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00420	        else 
	ICALL?L	L00001
	GOTO?L	L00134
	LABEL?L	L00133	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00421	            TEMP_BYTE = TEMP_BYTE*10 + TEMP1_BYTE 
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 00Ah, T1
	ADD?WBB	T1, _temp1_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00422	            conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00423	        endif
	ICALL?L	L00001
	LABEL?L	L00134	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00424	        i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00425	    next k
	ICALL?L	L00001
	NEXT?BCL	_k, 001h, L00127
	LABEL?L	L00128	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00426	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00428	lookupChar:

	LABEL?L	_lookupChar	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00429	    LOOKDOWN temp2_byte,["0123456789"], temp1_byte
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

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00430	RETURN
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00432	convertNoToStr:

	LABEL?L	_convertNoToStr	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00433	        temp3_byte = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCB	T1, 030h, _temp3_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00434	        temp2_byte = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCB	T1, 030h, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00435	        temp1_byte = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCB	T1, 030h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00436	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00438	highRelay:

	LABEL?L	_highRelay	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00439	if (relay == 0) then
	ICALL?L	L00001
	CMPNE?TCL	_RELAY, 000h, L00135

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00440	    relay_alarm_counter = 4
	ICALL?L	L00001
	MOVE?CB	004h, _relay_alarm_counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00441	    output alarm
	ICALL?L	L00001
	OUTPUT?T	_alarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00442	    low alarm
	ICALL?L	L00001
	LOW?T	_alarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00443	    high relay
	ICALL?L	L00001
	HIGH?T	_RELAY

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00444	endif
	ICALL?L	L00001
	LABEL?L	L00135	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00445	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00447	lowRelay:

	LABEL?L	_lowrelay	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00448	if (relay == 1) then
	ICALL?L	L00001
	CMPNE?TCL	_RELAY, 001h, L00137

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00449	    relay_alarm_counter = 4
	ICALL?L	L00001
	MOVE?CB	004h, _relay_alarm_counter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00450	    output alarm
	ICALL?L	L00001
	OUTPUT?T	_alarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00451	    low alarm
	ICALL?L	L00001
	LOW?T	_alarm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00452	    low relay
	ICALL?L	L00001
	LOW?T	_RELAY

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00453	endif
	ICALL?L	L00001
	LABEL?L	L00137	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00454	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00456	setRxAddressPipe:

	LABEL?L	_setRxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00457	READ 6, data_out[1]
	ICALL?L	L00001
	READ?CB	006h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00458	READ 7, data_out[2]
	ICALL?L	L00001
	READ?CB	007h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00459	READ 8, data_out[3]
	ICALL?L	L00001
	READ?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00460	READ 9, data_out[4]
	ICALL?L	L00001
	READ?CB	009h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00461	data_out[5] = device_id
	ICALL?L	L00001
	MOVE?BB	_device_id, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00462	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00464	setTxAddressPipe:

	LABEL?L	_setTxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00465	READ 1, data_out[1]
	ICALL?L	L00001
	READ?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00466	READ 2, data_out[2]
	ICALL?L	L00001
	READ?CB	002h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00467	READ 3, data_out[3]
	ICALL?L	L00001
	READ?CB	003h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00468	READ 4, data_out[4]
	ICALL?L	L00001
	READ?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00469	READ 5, data_out[5]
	ICALL?L	L00001
	READ?CB	005h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\LIGHTA~1.PBP	00470	return
	ICALL?L	L00001
	RETURN?	

	END
