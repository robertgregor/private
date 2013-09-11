
; PicBasic Pro Compiler 2.46, (c) 1998, 2005 microEngineering Labs, Inc. All Rights Reserved.  
PM_USED			EQU	1

	INCLUDE	"16F690.INC"


; Define statements.
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4
#define		CODE_SIZE		 4
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00019	 DEFINE OSC 8
#define		OSC		 8
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00020	 DEFINE HSER_RCSTA 90h
#define		HSER_RCSTA		 90h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00021	 DEFINE HSER_TXSTA 24h
#define		HSER_TXSTA		 24h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00022	 DEFINE HSER_SPBRG 51
#define		HSER_SPBRG		 51
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00023	 DEFINE HSER_CLROERR 1
#define		HSER_CLROERR		 1

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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 012h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T2              		EQU	RAM_START + 014h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T3              		EQU	RAM_START + 016h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T4              		EQU	RAM_START + 018h
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00026	FLAGS   VAR     BYTE BANK0 SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 01Ah
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00025	GOP     VAR     BYTE BANK0 SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 01Bh
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00022	RM1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 01Ch
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00024	RM2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 01Dh
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00021	RR1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 01Eh
; C:\PICDEV~1\PBP\PBP246\PBPPIC14.RAM	00023	RR2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 01Fh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00016	data_in var Byte[payloadLengthD] 'data received
_data_in         		EQU	RAM_START + 020h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00015	data_out VAR BYTE[payloadLengthD] 'data sent
_data_out        		EQU	RAM_START + 038h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00014	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 050h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00051	temp_word var word
_temp_word       		EQU	RAM_START + 052h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00059	ci var byte
_ci              		EQU	RAM_START + 054h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00058	conversionSuccessfull var byte
_conversionSuccessfull		EQU	RAM_START + 055h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00025	device_id var byte
_device_id       		EQU	RAM_START + 056h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00060	flagRestoreBackedConfig var byte
_flagRestoreBackedConfig		EQU	RAM_START + 057h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00045	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 058h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00046	j var byte
_j               		EQU	RAM_START + 059h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00019	k VAR byte
_k               		EQU	RAM_START + 05Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00048	manageSerial var byte
_manageSerial    		EQU	RAM_START + 05Bh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00064	minutes var byte
_minutes         		EQU	RAM_START + 05Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00012	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 05Dh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00063	seconds var byte
_seconds         		EQU	RAM_START + 05Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00052	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 05Fh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00057	backup_data var byte[payloadLength]
_backup_data     		EQU	RAM_START + 080h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00056	ser_data var byte[payloadLength]
_ser_data        		EQU	RAM_START + 096h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00017	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 0ACh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00021	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 0C2h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00053	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 0C3h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00022	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 0C4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00054	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 0C5h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00023	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 0C6h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00055	temp4_byte var byte
_temp4_byte      		EQU	RAM_START + 0C7h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00024	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 0C8h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00050	temp_byte var byte
_temp_byte       		EQU	RAM_START + 0C9h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00049	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 0CAh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00020	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 0CBh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00062	ticks var byte
_ticks           		EQU	RAM_START + 0CCh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00013	val var byte 'temp value
_val             		EQU	RAM_START + 0CDh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00018	w var byte
_w               		EQU	RAM_START + 0CEh
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
#define _resetButton     	_PORTA_5
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
#define _val_0           	_val, 000h
#define _INTCON_2        	 INTCON, 002h
#define _PIR1_5          	 PIR1, 005h
#define _RCSTA_2         	 RCSTA, 002h
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00017	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,0,0,0,0,0]
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
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h

	INCLUDE	"TRANSC~1.MAC"
	INCLUDE	"PBPPIC14.LIB"


; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00012	BANK0   $0020, $007F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00013	BANK1   $00A0, $00EF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00014	BANK2   $0120, $016F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00015	EEPROM  $2100, $21FF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00016	LIBRARY "PBPPIC14"
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00019	        include "PIC14EXT.BAS"

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00026	        include "PBPPIC14.RAM"

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00005	@ DEVICE PIC16F690,MCLR_OFF

	ASM?
 DEVICE PIC16F690,MCLR_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00006	@ DEVICE PIC16F690,CPD_OFF

	ASM?
 DEVICE PIC16F690,CPD_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00007	@ DEVICE PIC16F690,BOD_ON

	ASM?
 DEVICE PIC16F690,BOD_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00008	@ DEVICE PIC16F690,PWRT_ON

	ASM?
 DEVICE PIC16F690,PWRT_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00015	INCLUDE "RFM73.pbp"
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00017	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,0,0,0,0,0]
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00019	 DEFINE OSC 8
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00020	 DEFINE HSER_RCSTA 90h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00021	 DEFINE HSER_TXSTA 24h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00022	 DEFINE HSER_SPBRG 51
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00023	 DEFINE HSER_CLROERR 1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00025	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00026	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00027	 ANSELH = 0
	MOVE?CB	000h, ANSELH

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00028	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00029	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00032	INTCON = %11100000
	MOVE?CB	0E0h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00033	PIE1 = %00100000
	MOVE?CB	020h, PIE1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00034	OPTION_REG = %00000111
	MOVE?CB	007h, OPTION_REG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00036	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00037	ENABLE
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00039	TRISA = %00100000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	020h, TRISA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00040	TRISB = %00010000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	010h, TRISB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00041	TRISC = %00000100 'Set IRQ input,
	ICALL?L	L00001
	MOVE?CB	004h, TRISC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00042	WPUA = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00043	WPUB = %11111111 
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00065	resetLabel:

	LABEL?L	_resetLabel	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00066	clear
	ICALL?L	L00001
	CLEAR?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00067	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00069	commonSettings:

	LABEL?L	_commonSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00070	GOSUB commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00072	Main_rx:

	LABEL?L	_Main_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00073	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00074	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00075	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00076	irqLoop:

	LABEL?L	_irqLoop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00077	if (resetButton == 0) then
	ICALL?L	L00001
	CMPNE?TCL	_resetButton, 000h, L00015

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00078	    gosub putDefaultValues
	ICALL?L	L00001
	GOSUB?L	_putDefaultValues

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00079	    gosub printConfig
	ICALL?L	L00001
	GOSUB?L	_printConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00080	    pause 1000
	ICALL?L	L00001
	PAUSE?C	003E8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00081	    goto resetLabel
	ICALL?L	L00001
	GOTO?L	_resetLabel

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00082	endif
	ICALL?L	L00001
	LABEL?L	L00015	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00083	if (flagRestoreBackedConfig == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_flagRestoreBackedConfig, 002h, L00017

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00084	    flagRestoreBackedConfig = 0
	ICALL?L	L00001
	MOVE?CB	000h, _flagRestoreBackedConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00085	    gosub restoreCurrentSettings
	ICALL?L	L00001
	GOSUB?L	_restoreCurrentSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00086	    goto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00087	endif
	ICALL?L	L00001
	LABEL?L	L00017	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00088	if (manageSerial==1) then
	ICALL?L	L00001
	CMPNE?BCL	_manageSerial, 001h, L00019

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00089	    manageserial = 0
	ICALL?L	L00001
	MOVE?CB	000h, _manageSerial

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00090	    if ((ser_data[0] == "C" OR ser_data[0] == "c") AND ser_data[1] == "=") THEN 'channel
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 043h, T1
	CMPEQ?BCB	_ser_data, 063h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00021

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00091	        i=2
	ICALL?L	L00001
	MOVE?CB	002h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00092	        GOSUB convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00093	        if (conversionSuccessfull == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccessfull, 001h, L00023

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00094	            if (temp_byte > 0) then                'not needed
	ICALL?L	L00001
	CMPLE?BCL	_temp_byte, 000h, L00025

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00095	                if (temp_byte < 81) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 051h, L00027

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00096	                    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00097	                    write 0, temp_byte
	WRITE?CB	000h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00098	                    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00099	                    gosub printOK
	ICALL?L	L00001
	GOSUB?L	_printOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00100	                    GOto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00101	                else
	ICALL?L	L00001
	GOTO?L	L00028
	LABEL?L	L00027	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00102	                    gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00103	                endif
	ICALL?L	L00001
	LABEL?L	L00028	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00104	            else
	ICALL?L	L00001
	GOTO?L	L00026
	LABEL?L	L00025	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00105	                gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00106	            endif
	ICALL?L	L00001
	LABEL?L	L00026	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00107	        else
	ICALL?L	L00001
	GOTO?L	L00024
	LABEL?L	L00023	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00108	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00109	        endif
	ICALL?L	L00001
	LABEL?L	L00024	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00110	        goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00111	    endif 
	ICALL?L	L00001
	LABEL?L	L00021	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00112	    if ((ser_data[0] == "P" OR ser_data[0] == "p") AND ser_data[1] == "=") THEN 'password
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 050h, T1
	CMPEQ?BCB	_ser_data, 070h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00029

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00113	            GOSUB savePwd
	ICALL?L	L00001
	GOSUB?L	_savePwd

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00114	            GOto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00115	    endif
	ICALL?L	L00001
	LABEL?L	L00029	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00116	    if ((ser_data[0] == "A" OR ser_data[0] == "a") AND ser_data[1] == "=") THEN 'add device
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 041h, T1
	CMPEQ?BCB	_ser_data, 061h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00031

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00117	            i=2
	ICALL?L	L00001
	MOVE?CB	002h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00118	            GOSUB convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00119	            if (conversionSuccessfull == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccessfull, 001h, L00033

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00120	                gosub saveCurrentConfig
	ICALL?L	L00001
	GOSUB?L	_saveCurrentConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00121	                gosub putDefaultValues
	ICALL?L	L00001
	GOSUB?L	_putDefaultValues

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00122	                gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00123	                gosub debounce
	ICALL?L	L00001
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00124	                gosub addNewDevice
	ICALL?L	L00001
	GOSUB?L	_addNewDevice

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00125	                flagRestoreBackedConfig = 2
	ICALL?L	L00001
	MOVE?CB	002h, _flagRestoreBackedConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00126	            else
	ICALL?L	L00001
	GOTO?L	L00034
	LABEL?L	L00033	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00127	                gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00128	            endif
	ICALL?L	L00001
	LABEL?L	L00034	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00129	            goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00130	    endif
	ICALL?L	L00001
	LABEL?L	L00031	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00131	    if ((ser_data[0] == "S" OR ser_data[0] == "s")) THEN 'print config
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 053h, T1
	CMPEQ?BCB	_ser_data, 073h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00035

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00132	        GOSUB printConfig
	ICALL?L	L00001
	GOSUB?L	_printConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00133	        goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00134	    else
	ICALL?L	L00001
	GOTO?L	L00036
	LABEL?L	L00035	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00135	        i=0
	ICALL?L	L00001
	MOVE?CB	000h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00136	        gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00137	        if (conversionSuccessfull != 1) then
	ICALL?L	L00001
	CMPEQ?BCL	_conversionSuccessfull, 001h, L00037

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00138	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00139	            goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00140	        endif
	ICALL?L	L00001
	LABEL?L	L00037	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00141	        if (ser_data[i] != "=") then
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPEQ?BCL	T1, 03Dh, L00039

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00142	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00143	        else
	ICALL?L	L00001
	GOTO?L	L00040
	LABEL?L	L00039	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00144	            device_id = temp_byte                        
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00145	            for j = 0 to payloadLength
	ICALL?L	L00001
	MOVE?CB	000h, _j
	LABEL?L	L00041	
	CMPGT?BCL	_j, _payloadLength, L00042

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00146	                temp_data[j]=ser_data[i + 1]
	ICALL?L	L00001
	ADD?BCW	_i, 001h, T1
	AOUT?BWB	_ser_data, T1, T1
	AIN?BBB	T1, _temp_data, _j

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00147	                if temp_data[j] == 0 then 
	ICALL?L	L00001
	AOUT?BBB	_temp_data, _j, T1
	CMPNE?BCL	T1, 000h, L00043

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00148	                    temp_data[j] = 10
	ICALL?L	L00001
	AIN?CBB	00Ah, _temp_data, _j

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00149	                    goto endCycleS
	ICALL?L	L00001
	GOTO?L	_endCycleS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00150	                endif
	ICALL?L	L00001
	LABEL?L	L00043	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00151	                i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00152	                if (i==payloadLength) then
	ICALL?L	L00001
	CMPNE?BCL	_i, _payloadLength, L00045

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00153	                    gosub printError 
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00154	                    goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00155	                endif
	ICALL?L	L00001
	LABEL?L	L00045	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00156	            next j
	ICALL?L	L00001
	NEXT?BCL	_j, 001h, L00041
	LABEL?L	L00042	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00157	            :endCycleS

	LABEL?L	_endCycleS	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00158	            if (device_id == 0) then 'default values device -> default values to use...
	ICALL?L	L00001
	CMPNE?BCL	_device_id, 000h, L00047

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00159	                gosub saveCurrentConfig
	ICALL?L	L00001
	GOSUB?L	_saveCurrentConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00160	                gosub putDefaultValues
	ICALL?L	L00001
	GOSUB?L	_putDefaultValues

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00161	                gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00162	                gosub debounce
	ICALL?L	L00001
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00163	                GOSUB sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00164	                flagRestoreBackedConfig = 1
	ICALL?L	L00001
	MOVE?CB	001h, _flagRestoreBackedConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00165	                ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00166	            else
	ICALL?L	L00001
	GOTO?L	L00048
	LABEL?L	L00047	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00167	                GOSUB sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00168	            endif
	ICALL?L	L00001
	LABEL?L	L00048	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00169	        endif
	ICALL?L	L00001
	LABEL?L	L00040	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00170	    endif
	ICALL?L	L00001
	LABEL?L	L00036	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00171	    GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00172	endif
	ICALL?L	L00001
	LABEL?L	L00019	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00173	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00175	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00176	lop:

	LABEL?L	_lop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00177	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	ICALL?L	L00001
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00178	num_byte=payloadLength
	ICALL?L	L00001
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00179	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00180	HSEROUT["+", DEC data_in[1], " "]
	ICALL?L	L00001
	HSEROUT?C	02Bh
	HSEROUTCOUNT?C	000h
	HSEROUTNUM?B	_data_in + 00001h
	HSEROUTDEC?	
	HSEROUT?C	020h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00181	for w=2 to payloadLength
	ICALL?L	L00001
	MOVE?CB	002h, _w
	LABEL?L	L00049	
	CMPGT?BCL	_w, _payloadLength, L00050

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00182	    HSEROUT[data_in[w]]
	ICALL?L	L00001
	AOUT?BBB	_data_in, _w, T1
	HSEROUT?B	T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00183	    if (data_in[w]) == 10 then goto contInRcv
	ICALL?L	L00001
	AOUT?BBB	_data_in, _w, T1
	CMPNE?BCL	T1, 00Ah, L00051
	GOTO?L	_contInRcv
	LABEL?L	L00051	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00184	next w
	ICALL?L	L00001
	NEXT?BCL	_w, 001h, L00049
	LABEL?L	L00050	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00185	contInRcv:

	LABEL?L	_contInRcv	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00186	data_out[0]=Fifo_status 'Read FIFO status
	ICALL?L	L00001
	MOVE?CB	_Fifo_status, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00187	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00188	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00189	val= data_in[1] 'FIFO status register
	ICALL?L	L00001
	MOVE?BB	_data_in + 00001h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00190	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	ICALL?L	L00001
	CMPEQ?TCL	_val_0, 000h, _lop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00191	endRx:

	LABEL?L	_endRx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00192	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	ICALL?L	L00001
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00193	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	ICALL?L	L00001
	MOVE?CB	040h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00194	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00195	gosub spi_write
	ICALL?L	L00001
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00196	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00197	end
	ICALL?L	L00001
	END?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00199	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00200	intManagement:

	LABEL?L	_intManagement	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00201	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON_2, 001h, L00053

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00202	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00203	           if (flagRestoreBackedConfig == 1) then
	CMPNE?BCL	_flagRestoreBackedConfig, 001h, L00055

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00204	                if (ticks > 10) then
	CMPLE?BCL	_ticks, 00Ah, L00057

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00205	                    flagRestoreBackedConfig = 2
	MOVE?CB	002h, _flagRestoreBackedConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00206	                endif
	LABEL?L	L00057	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00207	           endif
	LABEL?L	L00055	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00208	           If ticks < 31 Then tiexit
	CMPLT?BCL	_ticks, 01Fh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00209	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00210	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00211	           if seconds <= 58 then tiexit
	CMPLE?BCL	_seconds, 03Ah, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00212	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00213	           minutes = minutes + 1
	ADD?BCB	_minutes, 001h, _minutes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00214	           tiexit: 

	LABEL?L	_tiexit	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00215	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00216	        else 
	GOTO?L	L00054
	LABEL?L	L00053	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00217	            if (PIR1.5 == 1) then
	CMPNE?TCL	_PIR1_5, 001h, L00059

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00218	                 if (manageSerial == 1) then mainInt
	CMPEQ?BCL	_manageSerial, 001h, _mainInt

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00219	                 if (RCSTA.2 == 1) then
	CMPNE?TCL	_RCSTA_2, 001h, L00061

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00220	                    hserin[temp_byte_int]
	HSERIN?B	_temp_byte_int

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00221	                 endif
	LABEL?L	L00061	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00222	                 HSERIN 100, mainInt, [wait ("AT+"), STR ser_data\payloadLength\10]
	HSERINTIME?C	064h

	LABEL?L	L00002	
	HSERINWAIT?CLL	041h, L00002, _mainInt
	HSERINWAIT?CLL	054h, L00002, _mainInt
	HSERINWAIT?CLL	02Bh, L00002, _mainInt
	HSERINCOUNT?C	_payloadLength
	HSERINCHAR?C	00Ah
	HSERINSTRC?BL	_ser_data, _mainInt

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00223	                 manageSerial = 1
	MOVE?CB	001h, _manageSerial

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00224	                 :mainInt

	LABEL?L	_mainInt	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00225	            ENDIF
	LABEL?L	L00059	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00226	        endif
	LABEL?L	L00054	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00227	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00228	resume
	RESUME?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00229	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00231	cleanSerialPort:

	LABEL?L	_cleanSerialPort	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00232	    while (PIR1.5==1) 
	ICALL?L	L00001
	LABEL?L	L00063	
	CMPNE?TCL	_PIR1_5, 001h, L00064

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00233	        hserin [temp_byte]
	ICALL?L	L00001
	HSERIN?B	_temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00234	    wend
	ICALL?L	L00001
	GOTO?L	L00063
	LABEL?L	L00064	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00235	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00238	printError:

	LABEL?L	_printError	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00239	    HSEROUT["ERROR",13,10]
	ICALL?L	L00001
	HSEROUT?C	045h
	HSEROUT?C	052h
	HSEROUT?C	052h
	HSEROUT?C	04Fh
	HSEROUT?C	052h
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00240	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00242	printOK:

	LABEL?L	_printOK	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00243	    HSEROUT["OK",13,10]
	ICALL?L	L00001
	HSEROUT?C	04Fh
	HSEROUT?C	04Bh
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00244	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00246	convertInputData:

	LABEL?L	_convertInputData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00247	    temp_word = 0
	ICALL?L	L00001
	MOVE?CW	000h, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00248	    conversionSuccessfull = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccessfull

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00249	    labelContReadDecimals:

	LABEL?L	_labelContReadDecimals	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00250	        if ser_data[i] > 47 then
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPLE?BCL	T1, 02Fh, L00065

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00251	            if ser_data[i] < 58 then
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPGE?BCL	T1, 03Ah, L00067

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00252	                conversionSuccessfull = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccessfull

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00253	                TEMP_word = TEMP_word*10 + ((ser_data[i]+2)-50)
	ICALL?L	L00001
	MUL?WCW	_temp_word, 00Ah, T1
	AOUT?BBB	_ser_data, _i, T2
	ADD?BCW	T2, 002h, T2
	SUB?WCW	T2, 032h, T2
	ADD?WWW	T1, T2, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00254	                i=i+1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00255	                if (TEMP_word < 256) then goto labelContReadDecimals
	ICALL?L	L00001
	CMPGE?WCL	_temp_word, 00100h, L00069
	GOTO?L	_labelContReadDecimals
	LABEL?L	L00069	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00256	            endif
	ICALL?L	L00001
	LABEL?L	L00067	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00257	        endif
	ICALL?L	L00001
	LABEL?L	L00065	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00258	    if (TEMP_word > 255) then
	ICALL?L	L00001
	CMPLE?WCL	_temp_word, 0FFh, L00071

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00259	         conversionSuccessfull = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccessfull

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00260	    else
	ICALL?L	L00001
	GOTO?L	L00072
	LABEL?L	L00071	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00261	        temp_byte = TEMP_word
	ICALL?L	L00001
	MOVE?WB	_temp_word, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00262	    endif
	ICALL?L	L00001
	LABEL?L	L00072	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00263	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00265	savePwd:

	LABEL?L	_savePwd	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00266	    for i=2 to 10
	ICALL?L	L00001
	MOVE?CB	002h, _i
	LABEL?L	L00073	
	CMPGT?BCL	_i, 00Ah, L00074

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00267	        if (ser_data[i] == 0) or (ser_data[i] == 10) or (ser_data[i] == 13) or (ser_data[i] == " ") then 
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPEQ?BCB	T1, 000h, T1
	AOUT?BBB	_ser_data, _i, T2
	CMPEQ?BCB	T2, 00Ah, T2
	LOR?BBW	T1, T2, T2
	AOUT?BBB	_ser_data, _i, T3
	CMPEQ?BCB	T3, 00Dh, T3
	LOR?WBW	T2, T3, T3
	AOUT?BBB	_ser_data, _i, T4
	CMPEQ?BCB	T4, 020h, T4
	LOR?WBW	T3, T4, T4
	CMPF?WL	T4, L00075

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00268	            GOSUB printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00269	            return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00270	        endif
	ICALL?L	L00001
	LABEL?L	L00075	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00271	    next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00073
	LABEL?L	L00074	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00272	    if (ser_data[2] == ser_data[7]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00002h, _ser_data + 00007h, L00077

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00273	        if (ser_data[3] == ser_data[8]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00003h, _ser_data + 00008h, L00079

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00274	            if (ser_data[4] == ser_data[9]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00004h, _ser_data + 00009h, L00081

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00275	                if (ser_data[5] == ser_data[10]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00005h, _ser_data + 0000Ah, L00083

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00276	                        GOSUB printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00277	                        return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00278	                endif
	ICALL?L	L00001
	LABEL?L	L00083	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00279	            endif
	ICALL?L	L00001
	LABEL?L	L00081	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00280	        endif
	ICALL?L	L00001
	LABEL?L	L00079	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00281	    endif
	ICALL?L	L00001
	LABEL?L	L00077	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00282	    if (ser_data[11] == 0) then    
	ICALL?L	L00001
	CMPNE?BCL	_ser_data + 0000Bh, 000h, L00085

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00283	        for i=2 to 10
	ICALL?L	L00001
	MOVE?CB	002h, _i
	LABEL?L	L00087	
	CMPGT?BCL	_i, 00Ah, L00088

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00284	            disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00285	            write i-1, ser_data[i]
	SUB?BCW	_i, 001h, T1
	AOUT?BBB	_ser_data, _i, T2
	WRITE?WB	T1, T2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00286	            enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00287	        next i        
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00087
	LABEL?L	L00088	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00288	        gosub printOK
	ICALL?L	L00001
	GOSUB?L	_printOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00289	    else 
	ICALL?L	L00001
	GOTO?L	L00086
	LABEL?L	L00085	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00290	        gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00291	    endif
	ICALL?L	L00001
	LABEL?L	L00086	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00292	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00294	saveCurrentConfig:

	LABEL?L	_saveCurrentConfig	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00295	for i=0 to 9
	ICALL?L	L00001
	MOVE?CB	000h, _i
	LABEL?L	L00089	
	CMPGT?BCL	_i, 009h, L00090

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00296	    read i, backup_data[i]
	ICALL?L	L00001
	READ?BW	_i, T1
	AIN?BBB	T1, _backup_data, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00297	next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00089
	LABEL?L	L00090	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00298	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00300	restoreCurrentSettings:

	LABEL?L	_restoreCurrentSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00301	for i=0 to 9
	ICALL?L	L00001
	MOVE?CB	000h, _i
	LABEL?L	L00091	
	CMPGT?BCL	_i, 009h, L00092

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00302	    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00303	    write i, backup_data[i]
	AOUT?BBB	_backup_data, _i, T1
	WRITE?BB	_i, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00304	    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00305	next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00091
	LABEL?L	L00092	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00306	GOSUB commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00307	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00309	putDefaultValues:

	LABEL?L	_putDefaultValues	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00310	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00311	write 0, 40
	WRITE?CC	000h, 028h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00312	write 1, "R"
	WRITE?CC	001h, 052h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00313	write 2, "E"
	WRITE?CC	002h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00314	write 3, "M"
	WRITE?CC	003h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00315	write 4, "O"
	WRITE?CC	004h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00316	write 5, "T"
	WRITE?CC	005h, 054h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00317	write 6, "E"
	WRITE?CC	006h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00318	write 7, "H"
	WRITE?CC	007h, 048h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00319	write 8, "O"
	WRITE?CC	008h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00320	write 9, "M"
	WRITE?CC	009h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00321	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00322	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00324	addNewDevice:

	LABEL?L	_addNewDevice	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00326	device_id = 0
	ICALL?L	L00001
	MOVE?CB	000h, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00327	temp_data[0] = "c"
	ICALL?L	L00001
	MOVE?CB	063h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00328	temp_data[1] = "="
	ICALL?L	L00001
	MOVE?CB	03Dh, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00329	for i=2 to 11
	ICALL?L	L00001
	MOVE?CB	002h, _i
	LABEL?L	L00093	
	CMPGT?BCL	_i, 00Bh, L00094

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00330	    temp_data[i] = backup_data[i-2]
	ICALL?L	L00001
	SUB?BCW	_i, 002h, T1
	AOUT?BWB	_backup_data, T1, T1
	AIN?BBB	T1, _temp_data, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00331	next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00093
	LABEL?L	L00094	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00332	temp_data[12] = temp_byte 'deviceId
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _temp_data + 0000Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00333	temp_data[13] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 0000Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00334	temp_data[14] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 0000Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00335	gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00336	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00338	printConfig:

	LABEL?L	_printConfig	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00339	    read 0, temp_byte
	ICALL?L	L00001
	READ?CB	000h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00340	    HSEROUT["+Channel:",DEC temp_byte,13,10]
	ICALL?L	L00001
	HSEROUT?C	02Bh
	HSEROUT?C	043h
	HSEROUT?C	068h
	HSEROUT?C	061h
	HSEROUT?C	06Eh
	HSEROUT?C	06Eh
	HSEROUT?C	065h
	HSEROUT?C	06Ch
	HSEROUT?C	03Ah
	HSEROUTCOUNT?C	000h
	HSEROUTNUM?B	_temp_byte
	HSEROUTDEC?	
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00341	    HSEROUT["+Password:"]
	ICALL?L	L00001
	HSEROUT?C	02Bh
	HSEROUT?C	050h
	HSEROUT?C	061h
	HSEROUT?C	073h
	HSEROUT?C	073h
	HSEROUT?C	077h
	HSEROUT?C	06Fh
	HSEROUT?C	072h
	HSEROUT?C	064h
	HSEROUT?C	03Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00342	    for i = 1 to 9
	ICALL?L	L00001
	MOVE?CB	001h, _i
	LABEL?L	L00095	
	CMPGT?BCL	_i, 009h, L00096

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00343	        read i, temp_byte
	ICALL?L	L00001
	READ?BB	_i, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00344	        HSEROUT[temp_byte]        
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00345	    next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00095
	LABEL?L	L00096	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00346	    HSEROUT[13,10]
	ICALL?L	L00001
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00347	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00349	setRxAddressPipe:

	LABEL?L	_setRxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00350	READ 1, data_out[1]
	ICALL?L	L00001
	READ?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00351	READ 2, data_out[2]
	ICALL?L	L00001
	READ?CB	002h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00352	READ 3, data_out[3]
	ICALL?L	L00001
	READ?CB	003h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00353	READ 4, data_out[4]
	ICALL?L	L00001
	READ?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00354	READ 5, data_out[5]
	ICALL?L	L00001
	READ?CB	005h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00355	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00357	setTxAddressPipe:

	LABEL?L	_setTxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00358	READ 6, data_out[1]
	ICALL?L	L00001
	READ?CB	006h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00359	READ 7, data_out[2]
	ICALL?L	L00001
	READ?CB	007h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00360	READ 8, data_out[3]
	ICALL?L	L00001
	READ?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00361	READ 9, data_out[4]
	ICALL?L	L00001
	READ?CB	009h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00362	data_out[5] = device_id
	ICALL?L	L00001
	MOVE?BB	_device_id, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00363	return
	ICALL?L	L00001
	RETURN?	

	END
