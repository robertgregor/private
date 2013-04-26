
; PICBASIC PRO(TM) Compiler 2.60C, (c) 1998, 2011 microEngineering Labs, Inc. All Rights Reserved. 
PM_USED			EQU	1

	INCLUDE	"16F690.INC"


; Define statements.
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00017	DEFINE  CODE_SIZE 4
#define		CODE_SIZE		 4
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00018	DEFINE	CCP1_REG PORTC
#define		CCP1_REG		 PORTC
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00019	DEFINE	CCP1_BIT 5
#define		CCP1_BIT		 5
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00019	 DEFINE OSC 8
#define		OSC		 8
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00020	 DEFINE HSER_RCSTA 90h
#define		HSER_RCSTA		 90h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00021	 DEFINE HSER_TXSTA 24h
#define		HSER_TXSTA		 24h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00022	 DEFINE HSER_SPBRG 51
#define		HSER_SPBRG		 51
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00023	 DEFINE HSER_CLROERR 1
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

; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00012	A00020	R0      VAR     WORD BANK0 SYSTEM       ' System Register
R0              		EQU	RAM_START + 000h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00013	A00022	R1      VAR     WORD BANK0 SYSTEM       ' System Register
R1              		EQU	RAM_START + 002h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00014	A00024	R2      VAR     WORD BANK0 SYSTEM       ' System Register
R2              		EQU	RAM_START + 004h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00015	A00026	R3      VAR     WORD BANK0 SYSTEM       ' System Register
R3              		EQU	RAM_START + 006h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00016	A00028	R4      VAR     WORD BANK0 SYSTEM       ' System Register
R4              		EQU	RAM_START + 008h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00017	A0002A	R5      VAR     WORD BANK0 SYSTEM       ' System Register
R5              		EQU	RAM_START + 00Ah
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00018	A0002C	R6      VAR     WORD BANK0 SYSTEM       ' System Register
R6              		EQU	RAM_START + 00Ch
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00019	A0002E	R7      VAR     WORD BANK0 SYSTEM       ' System Register
R7              		EQU	RAM_START + 00Eh
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00020	A00030	R8      VAR     WORD BANK0 SYSTEM       ' System Register
R8              		EQU	RAM_START + 010h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00026	A00032	FLAGS   VAR     BYTE BANK0 SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 012h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00025	A00033	GOP     VAR     BYTE BANK0 SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 013h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00022	A00034	RM1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 014h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00024	A00035	RM2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 015h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00021	A00036	RR1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 016h
; C:\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00023	A00037	RR2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 017h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00016	A00038	data_in var Byte[payloadLengthD] 'data received
_data_in         		EQU	RAM_START + 018h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00015	A00050	data_out VAR BYTE[payloadLengthD] 'data sent
_data_out        		EQU	RAM_START + 030h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00057	A00068	backup_data var byte[payloadLength]
_backup_data     		EQU	RAM_START + 048h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00014	A0007E	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 05Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00056	A000A0	ser_data var byte[payloadLength]
_ser_data        		EQU	RAM_START + 080h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00017	A000B6	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 096h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00001	A000CC	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 0ACh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00001	A000CE	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T2              		EQU	RAM_START + 0AEh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00001	A000D0	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T3              		EQU	RAM_START + 0B0h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00001	A000D2	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T4              		EQU	RAM_START + 0B2h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00051	A000D4	temp_word var word
_temp_word       		EQU	RAM_START + 0B4h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00059	A000D6	ci var byte
_ci              		EQU	RAM_START + 0B6h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00058	A000D7	conversionSuccessfull var byte
_conversionSuccessfull		EQU	RAM_START + 0B7h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00025	A000D8	device_id var byte
_device_id       		EQU	RAM_START + 0B8h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00045	A000D9	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 0B9h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00046	A000DA	j var byte
_j               		EQU	RAM_START + 0BAh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00019	A000DB	k VAR byte
_k               		EQU	RAM_START + 0BBh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00048	A000DC	manageSerial var byte
_manageSerial    		EQU	RAM_START + 0BCh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00063	A000DD	minutes var byte
_minutes         		EQU	RAM_START + 0BDh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00012	A000DE	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 0BEh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00062	A000DF	seconds var byte
_seconds         		EQU	RAM_START + 0BFh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00052	A000E0	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 0C0h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00021	A000E1	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 0C1h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00053	A000E2	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 0C2h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00022	A000E3	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 0C3h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00054	A000E4	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 0C4h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00023	A000E5	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 0C5h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00055	A000E6	temp4_byte var byte
_temp4_byte      		EQU	RAM_START + 0C6h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00024	A000E7	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 0C7h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00050	A000E8	temp_byte var byte
_temp_byte       		EQU	RAM_START + 0C8h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00049	A000E9	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 0C9h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00020	A000EA	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 0CAh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00061	A000EB	ticks var byte
_ticks           		EQU	RAM_START + 0CBh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00013	A000EC	val var byte 'temp value
_val             		EQU	RAM_START + 0CCh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00018	A000ED	w var byte
_w               		EQU	RAM_START + 0CDh
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00023	PORTL   VAR     PORTA
_PORTL           		EQU	 PORTA
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00024	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00025	TRISL   VAR     TRISA
_TRISL           		EQU	 TRISA
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00026	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC
#define _SSPEN           	_SSPCON??5
#define _CKP             	_SSPCON??4
#define _SMP             	_SSPSTAT??7
#define _CKE             	_SSPSTAT??6
#define _SSPIF           	_PIR1??3
#define _Ce              	_PORTA??2
#define _CSN             	_PORTC??0
#define _Irq             	_PORTC??2
#define _resetButton     	_PORTA??5
#define _SSPCON??5       	 SSPCON, 005h
#define _SSPCON??4       	 SSPCON, 004h
#define _SSPSTAT??7      	 SSPSTAT, 007h
#define _SSPSTAT??6      	 SSPSTAT, 006h
#define _PIR1??3         	 PIR1, 003h
#define _PORTA??2        	 PORTA, 002h
#define _PORTC??0        	 PORTC, 000h
#define _PORTC??2        	 PORTC, 002h
#define _SSPCON??0       	 SSPCON, 000h
#define _PORTA??5        	 PORTA, 005h
#define _val??0          	_val, 000h
#define _INTCON??2       	 INTCON, 002h
#define _PIR1??5         	 PIR1, 005h
#define _RCSTA??2        	 RCSTA, 002h
#define _INTCON??7       	 INTCON, 007h

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
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00017	EEPROM  0, [40,"R","O","B","I","K","B","O","B","0",0,0,0,0,0,0]
	DE	028h
	DE	052h
	DE	04Fh
	DE	042h
	DE	049h
	DE	04Bh
	DE	042h
	DE	04Fh
	DE	042h
	DE	030h
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h

	INCLUDE	"TRANSC~1.MAC"
	INCLUDE	"PBPPIC14.LIB"


; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00012	BANK0   $0020, $007F
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00013	BANK1   $00A0, $00EF
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00014	BANK2   $0120, $016F
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00015	EEPROM  $2100, $21FF
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00016	LIBRARY "PBPPIC14"
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00017	DEFINE  CODE_SIZE 4
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00018	DEFINE	CCP1_REG PORTC
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00019	DEFINE	CCP1_BIT 5

; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00021	        include "PIC14EXT.BAS"

; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00028	        include "PBPPIC14.RAM"

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00005	@ DEVICE PIC16F690,MCLR_OFF

	ASM?
 DEVICE PIC16F690,MCLR_OFF

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00006	@ DEVICE PIC16F690,CPD_OFF

	ASM?
 DEVICE PIC16F690,CPD_OFF

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00007	@ DEVICE PIC16F690,BOD_ON

	ASM?
 DEVICE PIC16F690,BOD_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00008	@ DEVICE PIC16F690,PWRT_ON

	ASM?
 DEVICE PIC16F690,PWRT_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00015	INCLUDE "RFM73.pbp"
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00010	payloadLength con 22
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00011	payloadLengthD con 24
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00028	Idle_int con $00 'Idle no interrupt pending
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00029	Max_rt con $10 'Max # of Tx retrans interrupt
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00030	Tx_inter con $30 'Tx interrupted
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00031	Rx_ds con $40 'Rx data received
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00033	Read_reg con $00 'def read command to register
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00034	Write_reg CON $20 'def write command to register
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00035	Rd_rx_pload con $61 'def Rx payload register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00036	Wr_tx_pload con $A0 'def Tx payload register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00037	Flush_tx con $E1 'def flush Tx register command
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00038	Flush_rx con $E2 'def flush Rx register command
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00039	Reuse_tx_pl con $E3 'def reuse Tx payload register command
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00040	Nop_comm con $FF 'def No operation
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00042	Config_nrf con $00 'Config register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00043	En_aa con $01 'enable auto acknowledgment register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00044	En_rxaddr con $02 'enable RX addresses register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00045	Setup_aw con $03 'setup address width register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00046	Setup_retr con $04 'setup auto retrans register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00047	Rf_ch con $05 'RF channel register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00048	Rf_setup con $06 'RF setup register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00049	Stat_us con $07 'Status register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00050	Observe_tx con $08 'Observe TX register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00051	Cd con $09 'Carrier detect register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00052	Rx_addr_p0 con $0A 'RX address pipe0 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00053	Rx_addr_p1 con $0B 'RX address pipe1 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00054	Rx_addr_p2 con $0C 'RX address pipe2 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00055	Rx_addr_p3 con $0D 'RX address pipe3 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00056	Rx_addr_p4 con $0E 'RX address pipe4 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00057	Rx_addr_p5 con $0F 'RX address pipe5 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00058	Tx_addr con $10 'TX address register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00059	Rx_pw_p0 con $11 'RX payload width pipe0 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00060	Rx_pw_p1 con $12 'RX payload width pipe1 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00061	Rx_pw_p2 con $13 'RX payload width pipe2 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00062	Rx_pw_p3 con $14 'RX payload width pipe3 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00063	Rx_pw_p4 con $15 'RX payload width pipe4 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00064	Rx_pw_p5 con $16 'RX payload width pipe5 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00065	Fifo_status con $17 'FIFO status register register address

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00067	goto endRFM70
	GOTO?L	_endRFM70

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00068	initModule:

	LABEL?L	_initModule	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00069	pause 200
	PAUSE?C	0C8h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00071	SSPEN = 1 'enable SPI pins
	MOVE?CT	001h, _SSPEN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00072	SSPCON.0=1 'SPI rate=OSC/16
	MOVE?CT	001h, _SSPCON??0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00073	CKP = 0 'clock idle low
	MOVE?CT	000h, _CKP

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00074	CKE = 1 'transmit on active to idle
	MOVE?CT	001h, _CKE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00075	SSPIF = 0 'clear buffer full status
	MOVE?CT	000h, _SSPIF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00076	SMP = 0 'sample in middle of data
	MOVE?CT	000h, _SMP

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00078	Ce=1 'init spi pins
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00079	pause 10 'wait 10 ms hardware is stable
	PAUSE?C	00Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00080	Ce=0 'set CE pin low disable Rx
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00081	CSN=0 'set CSN pin low
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00082	Pack_count=0 'number of packets sent
	MOVE?CW	000h, _Pack_count

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00083	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00085	commonRXTX:

	LABEL?L	_commonRXTX	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00086	data_out[0]=Write_reg+Rx_addr_p0 'Rx address for pipe0
	MOVE?CB	02Ah, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00087	READ 1, data_out[1]
	READADDRESS?C	001h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00088	READ 2, data_out[2]
	READADDRESS?C	002h
	READ?B	_data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00089	READ 3, data_out[3]
	READADDRESS?C	003h
	READ?B	_data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00090	READ 4, data_out[4]
	READADDRESS?C	004h
	READ?B	_data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00091	READ 5, data_out[5]
	READADDRESS?C	005h
	READ?B	_data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00092	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00093	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00094	data_out[0]=Write_reg+En_aa 'enable auto ACK pipe0
	MOVE?CB	021h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00095	data_out[1]=$01 '1 enable, 0 disable
	MOVE?CB	001h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00096	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00097	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00098	data_out[0]=Write_reg+En_rxaddr 'enable Rx address pipe0
	MOVE?CB	022h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00099	data_out[1]=$01
	MOVE?CB	001h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00100	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00101	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00102	data_out[0]=Write_reg+Rf_ch 'Set RF channel
	MOVE?CB	025h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00103	READ 0, data_out[1] 'number of channel used
	READADDRESS?C	000h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00104	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00105	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00106	data_out[0]=Write_reg+Rx_pw_p0 'Set Rx pload width pipe0
	MOVE?CB	031h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00107	data_out[1]=payloadLength 'number of bytes used in data sent
	MOVE?CB	_payloadLength, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00108	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00109	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00110	data_out[0]=Write_reg+Rf_setup 'Set RF: 'Set RF:5dbm, 1Mbps
	MOVE?CB	026h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00112	 data_out[1]=%00000111 '1mbit
	MOVE?CB	007h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00113	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00114	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00116	temp_byte_rfm = 1
	MOVE?CB	001h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00117	gosub setBank
	GOSUB?L	_setBank

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	000h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	040h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	001h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	0E2h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00119	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	001h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	0C0h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00121	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0D0h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0FCh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	08Ch, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00123	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	003h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	099h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	000h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	039h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	041h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00125	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	004h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	0D9h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	096h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	082h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	01Bh, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00127	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	005h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	024h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	002h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	07Fh, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	0A6h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00129	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00130	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	00Ch, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00130	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00130	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	012h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00130	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	073h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00130	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00131	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00132	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	00Dh, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00132	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	046h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00132	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	0B4h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00132	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	080h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00132	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00133	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00134	data_out[0]=Write_reg+$0E
	MOVE?CB	02Eh, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00135	data_out[1]=$41
	MOVE?CB	041h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00136	data_out[2]=$20
	MOVE?CB	020h, _data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00137	data_out[3]=$08
	MOVE?CB	008h, _data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00138	data_out[4]=$04
	MOVE?CB	004h, _data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00139	data_out[5]=$81
	MOVE?CB	081h, _data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00140	data_out[6]=$20
	MOVE?CB	020h, _data_out + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00141	data_out[7]=$CF
	MOVE?CB	0CFh, _data_out + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00142	data_out[8]=$F7
	MOVE?CB	0F7h, _data_out + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00143	data_out[9]=$FE
	MOVE?CB	0FEh, _data_out + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00144	data_out[10]=$FF
	MOVE?CB	0FFh, _data_out + 0000Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00145	data_out[11]=$FF
	MOVE?CB	0FFh, _data_out + 0000Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00146	num_byte=11
	MOVE?CB	00Bh, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00147	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00148	temp_byte_rfm = 0
	MOVE?CB	000h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00149	gosub setBank
	GOSUB?L	_setBank

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00150	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00152	setBank:

	LABEL?L	_setBank	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00153	data_out[0]=Read_reg+$07
	MOVE?CB	007h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00154	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00155	gosub spi_read
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00156	if (temp_byte_rfm != (data_in[0] & $80)) then
	AND?BCW	_data_in, 080h, T1
	CMPEQ?BWL	_temp_byte_rfm, T1, L00003

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00158	    data_out[0]=$50
	MOVE?CB	050h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00159	    data_out[1]=$53    
	MOVE?CB	053h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00160	    num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00161	    gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00162	endif
	LABEL?L	L00003	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00163	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00165	conf4bytes:

	LABEL?L	_conf4bytes	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00166	data_out[0]=Write_reg+temp_byte_rfm
	ADD?CBB	_Write_reg, _temp_byte_rfm, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00167	data_out[1]=temp1_byte_rfm
	MOVE?BB	_temp1_byte_rfm, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00168	data_out[2]=temp2_byte_rfm
	MOVE?BB	_temp2_byte_rfm, _data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00169	data_out[3]=temp3_byte_rfm
	MOVE?BB	_temp3_byte_rfm, _data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00170	data_out[4]=temp4_byte_rfm
	MOVE?BB	_temp4_byte_rfm, _data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00171	num_byte=4
	MOVE?CB	004h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00172	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00173	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00175	sendData:

	LABEL?L	_sendData	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00176	pause 30
	PAUSE?C	01Eh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00177	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00178	data_out[0]=Flush_tx 'flush TX_fifo buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00179	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00180	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00181	data_out[0]=Write_reg+Stat_us 'reset IRQ bits
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00182	data_out[1]=%00110000
	MOVE?CB	030h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00183	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00184	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00185	gosub setup_tx 'setup Tx
	GOSUB?L	_setup_tx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00186	data_out[0]=Wr_tx_pload 'put 10 bytes data in Tx pload buffer
	MOVE?CB	_Wr_tx_pload, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00187	data_out[1]=device_id
	MOVE?BB	_device_id, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00188	for w = 2 to payloadLength+1
	MOVE?CB	002h, _w
	LABEL?L	L00005	
	CMPGT?BCL	_w, 017h, L00006

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00189	    data_out[w]=temp_data[w-2]
	SUB?BCW	_w, 002h, T1
	AOUT?BWB	_temp_data, T1, T1
	AIN?BBB	T1, _data_out, _w

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00190	    if data_out[w] == 10 then contSendX1
	AOUT?BBB	_data_out, _w, T1
	CMPEQ?BCL	T1, 00Ah, _contSendX1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00191	next w
	NEXT?BCL	_w, 001h, L00005
	LABEL?L	L00006	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00192	:contSendX1

	LABEL?L	_contSendX1	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00193	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00194	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00195	pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00196	Ce=1 'CE=1 (toggle) transmit FIFO buffer
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00197	Pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00198	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00199	Pause 1
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00200	trans_irq:

	LABEL?L	_trans_irq	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00201	If Irq !=0 then trans_irq 'wait until IRQ, active low
	CMPNE?TCL	_Irq, 000h, _trans_irq

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00202	data_out[0]=Stat_us 'read status register
	MOVE?CB	_Stat_us, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00203	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00204	gosub spi_read
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00205	val=data_in[0]&%01110000 'mask the IRQ bits STATUS byte
	AND?BCB	_data_in, 070h, _val

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00206	if (val = Max_rt) then gosub max_retry 'maximum TX retries
	CMPNE?BCL	_val, _Max_rt, L00007
	GOSUB?L	_max_retry
	LABEL?L	L00007	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00207	if (val = Tx_inter) then gosub tx_int 'Tx interrupted
	CMPNE?BCL	_val, _Tx_inter, L00009
	GOSUB?L	_tx_int
	LABEL?L	L00009	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00208	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00209	data_out[1]=%00100000 'clear TX_DS IRQ bit
	MOVE?CB	020h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00210	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00211	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00212	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00213	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00216	debounce:

	LABEL?L	_debounce	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00217	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00218	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00219	Ce=1
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00220	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00221	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00222	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00223	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00225	spi_write:

	LABEL?L	_spi_write	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00226	CSN=0
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00227	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00011	
	CMPGT?BBL	_w, _num_byte, L00012

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00228	SSPBUF=data_out[w] 'send array variable
	AOUT?BBB	_data_out, _w, SSPBUF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00229	GoSub buffer_ok 'wait until buffer ready
	GOSUB?L	_buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00230	Next w 'next location
	NEXT?BCL	_w, 001h, L00011
	LABEL?L	L00012	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00231	CSN=1
	MOVE?CT	001h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00232	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00234	spi_read:

	LABEL?L	_spi_read	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00235	CSN=0
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00236	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00013	
	CMPGT?BBL	_w, _num_byte, L00014

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00237	    SSPBUF = data_out[0] 'write to SSPBUF to start clock
	MOVE?BB	_data_out, SSPBUF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00238	    GoSub buffer_ok 'wait for receipt
	GOSUB?L	_buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00239	data_in[w] = SSPBUF 'store received character in array
	AIN?BBB	SSPBUF, _data_in, _w

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00240	Next w 'get next byte
	NEXT?BCL	_w, 001h, L00013
	LABEL?L	L00014	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00241	CSN=1
	MOVE?CT	001h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00242	Return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00243	buffer_ok:

	LABEL?L	_buffer_ok	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00244	IF SSPIF = 0 Then buffer_ok 'wait for SPI interupt flag
	CMPEQ?TCL	_SSPIF, 000h, _buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00245	SSPIF = 0 'reset flag
	MOVE?CT	000h, _SSPIF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00246	Return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00248	max_retry:

	LABEL?L	_max_retry	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00249	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00250	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00251	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00252	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00253	data_out[1]=%00010000 'clear MAX_RT IRQ bit
	MOVE?CB	010h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00254	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00255	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00256	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00258	tx_int:

	LABEL?L	_tx_int	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00259	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00260	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00261	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00262	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00263	data_out[1]=%00110000 'clear TX_DS & MAX_RT IRQ bit
	MOVE?CB	030h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00264	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00265	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00266	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00268	setup_rx:

	LABEL?L	_setup_rx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00269	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00270	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00271	data_out[1]=$0F
	MOVE?CB	00Fh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00272	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00273	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00275	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00277	setup_sleep:

	LABEL?L	_setup_sleep	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00278	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=0, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00279	data_out[1]=%00001101
	MOVE?CB	00Dh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00280	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00281	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00282	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00284	setup_tx:

	LABEL?L	_setup_tx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00285	data_out[0]=Write_reg+Tx_addr 'Tx address
	MOVE?CB	030h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00286	READ 1, data_out[1]
	READADDRESS?C	001h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00287	READ 2, data_out[2]
	READADDRESS?C	002h
	READ?B	_data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00288	READ 3, data_out[3]
	READADDRESS?C	003h
	READ?B	_data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00289	READ 4, data_out[4]
	READADDRESS?C	004h
	READ?B	_data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00290	READ 5, data_out[5]
	READADDRESS?C	005h
	READ?B	_data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00291	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00292	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00293	data_out[0]= Write_reg+Setup_retr 'Set retransmit @ ACK
	MOVE?CB	024h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00294	data_out[1]= %00110101 '15x re-transmit (default)
	MOVE?CB	035h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00295	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00296	Gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00297	data_out[0]=Write_reg+Config_nrf 'Config:PRX=0,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00298	data_out[1]=$0E
	MOVE?CB	00Eh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00299	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00300	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00301	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00302	:endRFM70

	LABEL?L	_endRFM70	
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00017	EEPROM  0, [40,"R","O","B","I","K","B","O","B","0",0,0,0,0,0,0]
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00019	 DEFINE OSC 8
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00020	 DEFINE HSER_RCSTA 90h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00021	 DEFINE HSER_TXSTA 24h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00022	 DEFINE HSER_SPBRG 51
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00023	 DEFINE HSER_CLROERR 1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00025	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00026	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00027	 ANSELH = 0
	MOVE?CB	000h, ANSELH

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00028	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00029	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00032	INTCON = %11100000
	MOVE?CB	0E0h, INTCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00033	PIE1 = %00100000
	MOVE?CB	020h, PIE1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00034	OPTION_REG = %00000111
	MOVE?CB	007h, OPTION_REG

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00036	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00037	ENABLE
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00039	TRISA = %00100000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	020h, TRISA

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00040	TRISB = %00010000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	010h, TRISB

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00041	TRISC = %00000100 'Set IRQ input,
	ICALL?L	L00001
	MOVE?CB	004h, TRISC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00042	WPUA = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUA

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00043	WPUB = %11111111 
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUB

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00064	resetLabel:

	LABEL?L	_resetLabel	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00065	clear
	ICALL?L	L00001
	CLEAR?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00066	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00068	commonSettings:

	LABEL?L	_commonSettings	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00069	GOSUB commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00071	Main_rx:

	LABEL?L	_Main_rx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00072	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00073	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00074	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00075	irqLoop:

	LABEL?L	_irqLoop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00076	if (1 == 0) then
	ICALL?L	L00001
	CMPNE?CCL	001h, 000h, L00015

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00078	    disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00079	    write 0, 40
	WRITEADDRESS?C	000h
	WRITE?C	028h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00080	    write 1, "R"
	WRITEADDRESS?C	001h
	WRITE?C	052h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00081	    write 2, "O"
	WRITEADDRESS?C	002h
	WRITE?C	04Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00082	    write 3, "B"
	WRITEADDRESS?C	003h
	WRITE?C	042h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00083	    write 4, "I"
	WRITEADDRESS?C	004h
	WRITE?C	049h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00084	    write 5, "K"
	WRITEADDRESS?C	005h
	WRITE?C	04Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00085	    enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00086	    gosub printConfig
	ICALL?L	L00001
	GOSUB?L	_printConfig

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00087	    pause 2000
	ICALL?L	L00001
	PAUSE?C	007D0h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00088	    goto resetLabel
	ICALL?L	L00001
	GOTO?L	_resetLabel

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00089	endif
	ICALL?L	L00001
	LABEL?L	L00015	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00090	if (manageSerial==1) then
	ICALL?L	L00001
	CMPNE?BCL	_manageSerial, 001h, L00017

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00091	    manageserial = 0
	ICALL?L	L00001
	MOVE?CB	000h, _manageSerial

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00092	    if ((ser_data[0] == "C" OR ser_data[0] == "c") AND ser_data[1] == "=") THEN 'channel
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 043h, T1
	CMPEQ?BCB	_ser_data, 063h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00019

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00093	        i=2
	ICALL?L	L00001
	MOVE?CB	002h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00094	        GOSUB convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00095	        if (conversionSuccessfull == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccessfull, 001h, L00021

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00096	            if (temp_byte > 0) then                'not needed
	ICALL?L	L00001
	CMPLE?BCL	_temp_byte, 000h, L00023

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00097	                if (temp_byte < 255) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 0FFh, L00025

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00098	                    write 0, temp_byte
	ICALL?L	L00001
	WRITEADDRESS?C	000h
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00099	                    gosub printOK
	ICALL?L	L00001
	GOSUB?L	_printOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00100	                    GOSUB commonSettings
	ICALL?L	L00001
	GOSUB?L	_commonSettings

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00101	                else
	ICALL?L	L00001
	GOTO?L	L00026
	LABEL?L	L00025	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00102	                    gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00103	                endif
	ICALL?L	L00001
	LABEL?L	L00026	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00104	            else
	ICALL?L	L00001
	GOTO?L	L00024
	LABEL?L	L00023	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00105	                gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00106	            endif
	ICALL?L	L00001
	LABEL?L	L00024	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00107	        else
	ICALL?L	L00001
	GOTO?L	L00022
	LABEL?L	L00021	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00108	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00109	        endif
	ICALL?L	L00001
	LABEL?L	L00022	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00110	    elseif ((ser_data[0] == "P" OR ser_data[0] == "p") AND ser_data[1] == "=") THEN 'password
	ICALL?L	L00001
	GOTO?L	L00020
	LABEL?L	L00019	
	CMPEQ?BCB	_ser_data, 050h, T1
	CMPEQ?BCB	_ser_data, 070h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00027

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00111	        GOSUB savePwd
	ICALL?L	L00001
	GOSUB?L	_savePwd

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00112	        GOSUB commonSettings
	ICALL?L	L00001
	GOSUB?L	_commonSettings

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00113	    elseif ((ser_data[0] == "A" OR ser_data[0] == "a") AND ser_data[1] == "=") THEN 'add device
	ICALL?L	L00001
	GOTO?L	L00020
	LABEL?L	L00027	
	CMPEQ?BCB	_ser_data, 041h, T1
	CMPEQ?BCB	_ser_data, 061h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00029

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00114	        i=2
	ICALL?L	L00001
	MOVE?CB	002h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00115	        GOSUB convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00116	        if (conversionSuccessfull == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccessfull, 001h, L00031

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00117	            gosub addNewDevice
	ICALL?L	L00001
	GOSUB?L	_addNewDevice

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00118	            GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00119	        else
	ICALL?L	L00001
	GOTO?L	L00032
	LABEL?L	L00031	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00120	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00121	        endif
	ICALL?L	L00001
	LABEL?L	L00032	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00122	    elseif ((ser_data[0] == "S" OR ser_data[0] == "s")) THEN 'print config
	ICALL?L	L00001
	GOTO?L	L00020
	LABEL?L	L00029	
	CMPEQ?BCB	_ser_data, 053h, T1
	CMPEQ?BCB	_ser_data, 073h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00033

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00123	        GOSUB printConfig
	ICALL?L	L00001
	GOSUB?L	_printConfig

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00124	    else
	ICALL?L	L00001
	GOTO?L	L00020
	LABEL?L	L00033	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00125	        i=0
	ICALL?L	L00001
	MOVE?CB	000h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00126	        gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00127	        if (conversionSuccessfull != 1) then
	ICALL?L	L00001
	CMPEQ?BCL	_conversionSuccessfull, 001h, L00035

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00128	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00129	        elseif (ser_data[i] != "=") then
	ICALL?L	L00001
	GOTO?L	L00036
	LABEL?L	L00035	
	AOUT?BBB	_ser_data, _i, T1
	CMPEQ?BCL	T1, 03Dh, L00037

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00130	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00131	        else
	ICALL?L	L00001
	GOTO?L	L00036
	LABEL?L	L00037	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00132	            device_id = temp_byte                        
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _device_id

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00133	            for j = 0 to payloadLength
	ICALL?L	L00001
	MOVE?CB	000h, _j
	LABEL?L	L00039	
	CMPGT?BCL	_j, _payloadLength, L00040

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00134	                temp_data[j]=ser_data[i + 1]
	ICALL?L	L00001
	ADD?BCW	_i, 001h, T1
	AOUT?BWB	_ser_data, T1, T1
	AIN?BBB	T1, _temp_data, _j

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00135	                if temp_data[j] == 0 then 
	ICALL?L	L00001
	AOUT?BBB	_temp_data, _j, T1
	CMPNE?BCL	T1, 000h, L00041

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00136	                    temp_data[j] = 10
	ICALL?L	L00001
	AIN?CBB	00Ah, _temp_data, _j

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00137	                    goto endCycleS
	ICALL?L	L00001
	GOTO?L	_endCycleS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00138	                endif
	ICALL?L	L00001
	LABEL?L	L00041	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00139	                i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00140	                if (i==payloadLength) then
	ICALL?L	L00001
	CMPNE?BCL	_i, _payloadLength, L00043

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00141	                    gosub printError 
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00142	                    goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00143	                endif
	ICALL?L	L00001
	LABEL?L	L00043	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00144	            next j
	ICALL?L	L00001
	NEXT?BCL	_j, 001h, L00039
	LABEL?L	L00040	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00145	            :endCycleS

	LABEL?L	_endCycleS	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00146	            if (device_id == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_device_id, 000h, L00045

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00147	                gosub saveCurrentConfig
	ICALL?L	L00001
	GOSUB?L	_saveCurrentConfig

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00148	                gosub putDefaultValues
	ICALL?L	L00001
	GOSUB?L	_putDefaultValues

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00149	                GOSUB sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00150	                gosub restoreCurrentSettings
	ICALL?L	L00001
	GOSUB?L	_restoreCurrentSettings

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00151	            else
	ICALL?L	L00001
	GOTO?L	L00046
	LABEL?L	L00045	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00152	                GOSUB sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00153	            endif
	ICALL?L	L00001
	LABEL?L	L00046	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00154	        endif
	ICALL?L	L00001
	LABEL?L	L00036	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00155	    endif
	ICALL?L	L00001
	LABEL?L	L00020	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00156	    GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00157	endif
	ICALL?L	L00001
	LABEL?L	L00017	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00158	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00160	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00161	lop:

	LABEL?L	_lop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00162	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	ICALL?L	L00001
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00163	num_byte=payloadLength
	ICALL?L	L00001
	MOVE?CB	_payloadLength, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00164	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00165	HSEROUT["+", DEC data_in[1], " "]
	ICALL?L	L00001
	HSEROUT?C	02Bh
	HSEROUTCOUNT?C	000h
	HSEROUTNUM?B	_data_in + 00001h
	HSEROUTDEC?	
	HSEROUT?C	020h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00166	for w=2 to payloadLength
	ICALL?L	L00001
	MOVE?CB	002h, _w
	LABEL?L	L00047	
	CMPGT?BCL	_w, _payloadLength, L00048

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00167	    HSEROUT[data_in[w]]
	ICALL?L	L00001
	AOUT?BBB	_data_in, _w, T1
	HSEROUT?B	T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00168	    if (data_in[w]) == 10 then goto contInRcv
	ICALL?L	L00001
	AOUT?BBB	_data_in, _w, T1
	CMPNE?BCL	T1, 00Ah, L00049
	GOTO?L	_contInRcv
	LABEL?L	L00049	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00169	next w
	ICALL?L	L00001
	NEXT?BCL	_w, 001h, L00047
	LABEL?L	L00048	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00170	contInRcv:

	LABEL?L	_contInRcv	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00171	data_out[0]=Fifo_status 'Read FIFO status
	ICALL?L	L00001
	MOVE?CB	_Fifo_status, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00172	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00173	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00174	val= data_in[1] 'FIFO status register
	ICALL?L	L00001
	MOVE?BB	_data_in + 00001h, _val

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00175	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	ICALL?L	L00001
	CMPEQ?TCL	_val??0, 000h, _lop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00176	endRx:

	LABEL?L	_endRx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00177	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	ICALL?L	L00001
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00178	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	ICALL?L	L00001
	MOVE?CB	040h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00179	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00180	gosub spi_write
	ICALL?L	L00001
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00181	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00182	end
	ICALL?L	L00001
	END?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00184	disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00185	intManagement:

	LABEL?L	_intManagement	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00186	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON??2, 001h, L00051

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00187	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00188	           If ticks < 31 Then tiexit
	CMPLT?BCL	_ticks, 01Fh, _tiexit

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00189	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00190	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00191	           if seconds <= 58 then tiexit
	CMPLE?BCL	_seconds, 03Ah, _tiexit

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00192	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00193	           minutes = minutes + 1
	ADD?BCB	_minutes, 001h, _minutes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00194	           tiexit: 

	LABEL?L	_tiexit	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00195	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON??2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00196	        else 
	GOTO?L	L00052
	LABEL?L	L00051	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00197	            if (PIR1.5 == 1) then
	CMPNE?TCL	_PIR1??5, 001h, L00053

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00198	                 if (manageSerial == 1) then mainInt
	CMPEQ?BCL	_manageSerial, 001h, _mainInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00199	                 if (RCSTA.2 == 1) then
	CMPNE?TCL	_RCSTA??2, 001h, L00055

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00200	                    hserin[temp_byte_int]
	HSERIN?B	_temp_byte_int

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00201	                 endif
	LABEL?L	L00055	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00202	                 HSERIN 100, mainInt, [wait ("AT+"), STR ser_data\payloadLength\10]
	HSERINTIME?C	064h

	LABEL?L	L00002	
	HSERINWAIT?CLL	041h, L00002, _mainInt
	HSERINWAIT?CLL	054h, L00002, _mainInt
	HSERINWAIT?CLL	02Bh, L00002, _mainInt
	HSERINCOUNT?C	_payloadLength
	HSERINCHAR?C	00Ah
	HSERINSTRC?BL	_ser_data, _mainInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00203	                 manageSerial = 1
	MOVE?CB	001h, _manageSerial

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00204	                 :mainInt

	LABEL?L	_mainInt	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00205	            ENDIF
	LABEL?L	L00053	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00206	        endif
	LABEL?L	L00052	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00207	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON??7

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00208	resume
	RESUME?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00209	enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00211	cleanSerialPort:

	LABEL?L	_cleanSerialPort	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00212	    while (PIR1.5==1) 
	ICALL?L	L00001
	LABEL?L	L00057	
	CMPNE?TCL	_PIR1??5, 001h, L00058

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00213	        hserin [temp_byte]
	ICALL?L	L00001
	HSERIN?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00214	    wend
	ICALL?L	L00001
	GOTO?L	L00057
	LABEL?L	L00058	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00215	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00218	printError:

	LABEL?L	_printError	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00219	    HSEROUT["ERROR",13,10]
	ICALL?L	L00001
	HSEROUT?C	045h
	HSEROUT?C	052h
	HSEROUT?C	052h
	HSEROUT?C	04Fh
	HSEROUT?C	052h
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00220	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00222	printOK:

	LABEL?L	_printOK	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00223	    HSEROUT["OK",13,10]
	ICALL?L	L00001
	HSEROUT?C	04Fh
	HSEROUT?C	04Bh
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00224	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00226	convertInputData:

	LABEL?L	_convertInputData	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00227	    temp_word = 0
	ICALL?L	L00001
	MOVE?CW	000h, _temp_word

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00228	    conversionSuccessfull = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccessfull

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00229	    labelContReadDecimals:

	LABEL?L	_labelContReadDecimals	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00230	        if ser_data[i] > 47 then
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPLE?BCL	T1, 02Fh, L00059

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00231	            if ser_data[i] < 58 then
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPGE?BCL	T1, 03Ah, L00061

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00232	                conversionSuccessfull = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccessfull

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00233	                TEMP_word = TEMP_word*10 + ((ser_data[i]+2)-50)
	ICALL?L	L00001
	MUL?WCW	_temp_word, 00Ah, T1
	AOUT?BBB	_ser_data, _i, T2
	ADD?BCW	T2, 002h, T2
	SUB?WCW	T2, 032h, T2
	ADD?WWW	T1, T2, _temp_word

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00234	                i=i+1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00235	                if (TEMP_word < 256) then goto labelContReadDecimals
	ICALL?L	L00001
	CMPGE?WCL	_temp_word, 00100h, L00063
	GOTO?L	_labelContReadDecimals
	LABEL?L	L00063	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00236	            endif
	ICALL?L	L00001
	LABEL?L	L00061	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00237	        endif
	ICALL?L	L00001
	LABEL?L	L00059	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00238	    if (TEMP_word > 255) then
	ICALL?L	L00001
	CMPLE?WCL	_temp_word, 0FFh, L00065

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00239	         conversionSuccessfull = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccessfull

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00240	    else
	ICALL?L	L00001
	GOTO?L	L00066
	LABEL?L	L00065	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00241	        temp_byte = TEMP_word
	ICALL?L	L00001
	MOVE?WB	_temp_word, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00242	    endif
	ICALL?L	L00001
	LABEL?L	L00066	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00243	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00245	savePwd:

	LABEL?L	_savePwd	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00246	    for i=2 to 10
	ICALL?L	L00001
	MOVE?CB	002h, _i
	LABEL?L	L00067	
	CMPGT?BCL	_i, 00Ah, L00068

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00247	        if (ser_data[i] == 0) or (ser_data[i] == 10) or (ser_data[i] == 13) or (ser_data[i] == " ") then 
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
	CMPF?WL	T4, L00069

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00248	            GOSUB printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00249	            return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00250	        endif
	ICALL?L	L00001
	LABEL?L	L00069	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00251	    next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00067
	LABEL?L	L00068	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00252	    if (ser_data[2] == ser_data[7]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00002h, _ser_data + 00007h, L00071

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00253	        if (ser_data[3] == ser_data[8]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00003h, _ser_data + 00008h, L00073

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00254	            if (ser_data[4] == ser_data[9]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00004h, _ser_data + 00009h, L00075

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00255	                if (ser_data[5] == ser_data[10]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00005h, _ser_data + 0000Ah, L00077

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00256	                        GOSUB printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00257	                        return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00258	                endif
	ICALL?L	L00001
	LABEL?L	L00077	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00259	            endif
	ICALL?L	L00001
	LABEL?L	L00075	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00260	        endif
	ICALL?L	L00001
	LABEL?L	L00073	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00261	    endif
	ICALL?L	L00001
	LABEL?L	L00071	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00262	    if (ser_data[11] == 0) then    
	ICALL?L	L00001
	CMPNE?BCL	_ser_data + 0000Bh, 000h, L00079

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00263	        for i=2 to 10
	ICALL?L	L00001
	MOVE?CB	002h, _i
	LABEL?L	L00081	
	CMPGT?BCL	_i, 00Ah, L00082

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00264	            write i-1, ser_data[i]
	ICALL?L	L00001
	SUB?BCW	_i, 001h, T1
	WRITEADDRESS?W	T1
	AOUT?BBB	_ser_data, _i, T1
	WRITE?B	T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00265	        next i        
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00081
	LABEL?L	L00082	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00266	        gosub printOK
	ICALL?L	L00001
	GOSUB?L	_printOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00267	    else 
	ICALL?L	L00001
	GOTO?L	L00080
	LABEL?L	L00079	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00268	        gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00269	    endif
	ICALL?L	L00001
	LABEL?L	L00080	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00270	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00272	saveCurrentConfig:

	LABEL?L	_saveCurrentConfig	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00273	read 0, backup_data[0]
	ICALL?L	L00001
	READADDRESS?C	000h
	READ?B	_backup_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00274	READ 1, backup_data[1]
	ICALL?L	L00001
	READADDRESS?C	001h
	READ?B	_backup_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00275	READ 2, backup_data[2]
	ICALL?L	L00001
	READADDRESS?C	002h
	READ?B	_backup_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00276	READ 3, backup_data[3]
	ICALL?L	L00001
	READADDRESS?C	003h
	READ?B	_backup_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00277	READ 4, backup_data[4]
	ICALL?L	L00001
	READADDRESS?C	004h
	READ?B	_backup_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00278	READ 5, backup_data[5]
	ICALL?L	L00001
	READADDRESS?C	005h
	READ?B	_backup_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00279	READ 6, backup_data[6]
	ICALL?L	L00001
	READADDRESS?C	006h
	READ?B	_backup_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00280	READ 7, backup_data[7]
	ICALL?L	L00001
	READADDRESS?C	007h
	READ?B	_backup_data + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00281	READ 8, backup_data[8]
	ICALL?L	L00001
	READADDRESS?C	008h
	READ?B	_backup_data + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00282	READ 9, backup_data[9]
	ICALL?L	L00001
	READADDRESS?C	009h
	READ?B	_backup_data + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00283	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00285	restoreCurrentSettings:

	LABEL?L	_restoreCurrentSettings	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00286	write 0, backup_data[0]
	ICALL?L	L00001
	WRITEADDRESS?C	000h
	WRITE?B	_backup_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00287	write 1, backup_data[1]
	ICALL?L	L00001
	WRITEADDRESS?C	001h
	WRITE?B	_backup_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00288	write 2, backup_data[2]
	ICALL?L	L00001
	WRITEADDRESS?C	002h
	WRITE?B	_backup_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00289	write 3, backup_data[3]
	ICALL?L	L00001
	WRITEADDRESS?C	003h
	WRITE?B	_backup_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00290	write 4, backup_data[4]
	ICALL?L	L00001
	WRITEADDRESS?C	004h
	WRITE?B	_backup_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00291	write 5, backup_data[5]
	ICALL?L	L00001
	WRITEADDRESS?C	005h
	WRITE?B	_backup_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00292	write 6, backup_data[6]
	ICALL?L	L00001
	WRITEADDRESS?C	006h
	WRITE?B	_backup_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00293	write 7, backup_data[7]
	ICALL?L	L00001
	WRITEADDRESS?C	007h
	WRITE?B	_backup_data + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00294	write 8, backup_data[8]
	ICALL?L	L00001
	WRITEADDRESS?C	008h
	WRITE?B	_backup_data + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00295	write 9, backup_data[9]
	ICALL?L	L00001
	WRITEADDRESS?C	009h
	WRITE?B	_backup_data + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00296	GOSUB commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00297	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00299	putDefaultValues:

	LABEL?L	_putDefaultValues	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00300	write 0, 40
	ICALL?L	L00001
	WRITEADDRESS?C	000h
	WRITE?C	028h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00301	write 1, "R"
	ICALL?L	L00001
	WRITEADDRESS?C	001h
	WRITE?C	052h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00302	write 2, "O"
	ICALL?L	L00001
	WRITEADDRESS?C	002h
	WRITE?C	04Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00303	write 3, "B"
	ICALL?L	L00001
	WRITEADDRESS?C	003h
	WRITE?C	042h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00304	write 4, "I"
	ICALL?L	L00001
	WRITEADDRESS?C	004h
	WRITE?C	049h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00305	write 5, "K"
	ICALL?L	L00001
	WRITEADDRESS?C	005h
	WRITE?C	04Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00306	write 6, "B"
	ICALL?L	L00001
	WRITEADDRESS?C	006h
	WRITE?C	042h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00307	write 7, "O"
	ICALL?L	L00001
	WRITEADDRESS?C	007h
	WRITE?C	04Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00308	write 8, "B"
	ICALL?L	L00001
	WRITEADDRESS?C	008h
	WRITE?C	042h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00309	write 9, "O"
	ICALL?L	L00001
	WRITEADDRESS?C	009h
	WRITE?C	04Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00310	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00312	addNewDevice:

	LABEL?L	_addNewDevice	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00313	gosub saveCurrentConfig
	ICALL?L	L00001
	GOSUB?L	_saveCurrentConfig

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00314	GOSUB putDefaultValues                                                                                                         
	ICALL?L	L00001
	GOSUB?L	_putDefaultValues

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00316	device_id = 0
	ICALL?L	L00001
	MOVE?CB	000h, _device_id

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00317	temp_data[0] = "c"
	ICALL?L	L00001
	MOVE?CB	063h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00318	temp_data[1] = "="
	ICALL?L	L00001
	MOVE?CB	03Dh, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00319	temp_data[2] = backup_data[0] 'channel
	ICALL?L	L00001
	MOVE?BB	_backup_data, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00320	temp_data[3] = backup_data[1] 'password
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00001h, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00321	temp_data[4] = backup_data[2]
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00002h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00322	temp_data[5] = backup_data[3]
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00003h, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00323	temp_data[6] = backup_data[4]
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00004h, _temp_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00324	temp_data[7] = backup_data[5]
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00005h, _temp_data + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00325	temp_data[8] = backup_data[6]
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00006h, _temp_data + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00326	temp_data[9] = backup_data[7]
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00007h, _temp_data + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00327	temp_data[10] = backup_data[8]
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00008h, _temp_data + 0000Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00328	temp_data[11] = backup_data[9]
	ICALL?L	L00001
	MOVE?BB	_backup_data + 00009h, _temp_data + 0000Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00329	temp_data[12] = temp_byte 'deviceId
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _temp_data + 0000Ch

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00330	temp_data[13] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 0000Dh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00331	temp_data[14] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 0000Eh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00332	GOSUB commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00333	gosub debounce
	ICALL?L	L00001
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00334	gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00335	gosub debounce
	ICALL?L	L00001
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00337	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00339	printConfig:

	LABEL?L	_printConfig	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00340	    read 0, temp_byte
	ICALL?L	L00001
	READADDRESS?C	000h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00341	    HSEROUT["+Channel:",DEC temp_byte,13,10]
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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00342	    HSEROUT["+Password:"]
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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00343	    read 1, temp_byte
	ICALL?L	L00001
	READADDRESS?C	001h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00344	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00345	    read 2, temp_byte
	ICALL?L	L00001
	READADDRESS?C	002h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00346	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00347	    read 3, temp_byte
	ICALL?L	L00001
	READADDRESS?C	003h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00348	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00349	    read 4, temp_byte
	ICALL?L	L00001
	READADDRESS?C	004h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00350	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00351	    read 5, temp_byte
	ICALL?L	L00001
	READADDRESS?C	005h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00352	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00353	    read 6, temp_byte
	ICALL?L	L00001
	READADDRESS?C	006h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00354	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00355	    read 7, temp_byte
	ICALL?L	L00001
	READADDRESS?C	007h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00356	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00357	    read 8, temp_byte
	ICALL?L	L00001
	READADDRESS?C	008h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00358	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00359	    read 9, temp_byte
	ICALL?L	L00001
	READADDRESS?C	009h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00360	    HSEROUT[temp_byte]
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00361	    HSEROUT[13,10]
	ICALL?L	L00001
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\TRANSC~1.PBP	00362	return
	ICALL?L	L00001
	RETURN?	

	END