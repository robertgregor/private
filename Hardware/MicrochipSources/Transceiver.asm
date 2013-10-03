
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00050	temp_word var word
_temp_word       		EQU	RAM_START + 052h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00058	ci var byte
_ci              		EQU	RAM_START + 054h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00057	conversionSuccessfull var byte
_conversionSuccessfull		EQU	RAM_START + 055h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00026	device_id var byte
_device_id       		EQU	RAM_START + 056h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00059	flagRestoreBackedConfig var byte
_flagRestoreBackedConfig		EQU	RAM_START + 057h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00045	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 058h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00031	interi var byte
_interi          		EQU	RAM_START + 059h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00028	ir var byte
_ir              		EQU	RAM_START + 05Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00046	j var byte
_j               		EQU	RAM_START + 05Bh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00020	k VAR byte
_k               		EQU	RAM_START + 05Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00047	manageSerial var byte
_manageSerial    		EQU	RAM_START + 05Dh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00060	minutes var byte
_minutes         		EQU	RAM_START + 05Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00012	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 05Fh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00017	data_received var Byte[payloadLengthD] 'data received
_data_received   		EQU	RAM_START + 080h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00056	backup_data var byte[payloadLength]
_backup_data     		EQU	RAM_START + 098h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00055	ser_data var byte[payloadLength]
_ser_data        		EQU	RAM_START + 0AEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00027	sameFlag VAR BYTE
_sameFlag        		EQU	RAM_START + 0C4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00030	seconds var byte
_seconds         		EQU	RAM_START + 0C5h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00051	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 0C6h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00022	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 0C7h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00052	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 0C8h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00023	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 0C9h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00053	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 0CAh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00024	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 0CBh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00054	temp4_byte var byte
_temp4_byte      		EQU	RAM_START + 0CCh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00025	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 0CDh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00049	temp_byte var byte
_temp_byte       		EQU	RAM_START + 0CEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00048	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 0CFh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00018	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 00100h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00021	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 00116h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00029	ticks var byte
_ticks           		EQU	RAM_START + 00117h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00013	val var byte 'temp value
_val             		EQU	RAM_START + 00118h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00019	w var byte
_w               		EQU	RAM_START + 00119h
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
#define _val_0           	_val, 000h
#define _PORTA_5         	 PORTA, 005h
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

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00061	resetLabel:

	LABEL?L	_resetLabel	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00062	clear
	ICALL?L	L00001
	CLEAR?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00063	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00065	commonSettings:

	LABEL?L	_commonSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00066	GOSUB commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00068	Main_rx:

	LABEL?L	_Main_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00069	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00070	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00071	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00072	irqLoop:

	LABEL?L	_irqLoop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00073	if (resetButton == 0) then
	ICALL?L	L00001
	CMPNE?TCL	_resetButton, 000h, L00019

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00074	    gosub putDefaultValues
	ICALL?L	L00001
	GOSUB?L	_putDefaultValues

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00075	    gosub printConfig
	ICALL?L	L00001
	GOSUB?L	_printConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00076	    pause 1000
	ICALL?L	L00001
	PAUSE?C	003E8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00077	    goto resetLabel
	ICALL?L	L00001
	GOTO?L	_resetLabel

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00078	endif
	ICALL?L	L00001
	LABEL?L	L00019	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00079	if (flagRestoreBackedConfig == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_flagRestoreBackedConfig, 002h, L00021

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00080	    flagRestoreBackedConfig = 0
	ICALL?L	L00001
	MOVE?CB	000h, _flagRestoreBackedConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00081	    gosub restoreCurrentSettings
	ICALL?L	L00001
	GOSUB?L	_restoreCurrentSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00082	    goto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00083	endif
	ICALL?L	L00001
	LABEL?L	L00021	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00084	if (manageSerial==1) then
	ICALL?L	L00001
	CMPNE?BCL	_manageSerial, 001h, L00023

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00085	    manageserial = 0
	ICALL?L	L00001
	MOVE?CB	000h, _manageSerial

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00086	    if ((ser_data[0] == "C" OR ser_data[0] == "c") AND ser_data[1] == "=") THEN 'channel
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 043h, T1
	CMPEQ?BCB	_ser_data, 063h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00025

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00087	        i=2
	ICALL?L	L00001
	MOVE?CB	002h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00088	        GOSUB convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00089	        if (conversionSuccessfull == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccessfull, 001h, L00027

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00090	            if (temp_byte > 0) then                'not needed
	ICALL?L	L00001
	CMPLE?BCL	_temp_byte, 000h, L00029

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00091	                if (temp_byte < 81) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 051h, L00031

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00092	                    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00093	                    write 0, temp_byte
	WRITE?CB	000h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00094	                    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00095	                    gosub printOK
	ICALL?L	L00001
	GOSUB?L	_printOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00096	                    GOto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00097	                else
	ICALL?L	L00001
	GOTO?L	L00032
	LABEL?L	L00031	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00098	                    gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00099	                endif
	ICALL?L	L00001
	LABEL?L	L00032	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00100	            else
	ICALL?L	L00001
	GOTO?L	L00030
	LABEL?L	L00029	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00101	                gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00102	            endif
	ICALL?L	L00001
	LABEL?L	L00030	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00103	        else
	ICALL?L	L00001
	GOTO?L	L00028
	LABEL?L	L00027	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00104	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00105	        endif
	ICALL?L	L00001
	LABEL?L	L00028	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00106	        goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00107	    endif 
	ICALL?L	L00001
	LABEL?L	L00025	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00108	    if ((ser_data[0] == "P" OR ser_data[0] == "p") AND ser_data[1] == "=") THEN 'password
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 050h, T1
	CMPEQ?BCB	_ser_data, 070h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00033

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00109	            GOSUB savePwd
	ICALL?L	L00001
	GOSUB?L	_savePwd

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00110	            GOto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00111	    endif
	ICALL?L	L00001
	LABEL?L	L00033	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00112	    if ((ser_data[0] == "A" OR ser_data[0] == "a") AND ser_data[1] == "=") THEN 'add device
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 041h, T1
	CMPEQ?BCB	_ser_data, 061h, T2
	LOR?BBW	T1, T2, T2
	CMPEQ?BCB	_ser_data + 00001h, 03Dh, T3
	LAND?WBW	T2, T3, T3
	CMPF?WL	T3, L00035

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00113	            i=2
	ICALL?L	L00001
	MOVE?CB	002h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00114	            GOSUB convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00115	            if (conversionSuccessfull == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccessfull, 001h, L00037

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00116	                gosub saveCurrentConfig
	ICALL?L	L00001
	GOSUB?L	_saveCurrentConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00117	                gosub putDefaultValues
	ICALL?L	L00001
	GOSUB?L	_putDefaultValues

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00118	                gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00119	                gosub debounce
	ICALL?L	L00001
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00120	                gosub addNewDevice
	ICALL?L	L00001
	GOSUB?L	_addNewDevice

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00121	                flagRestoreBackedConfig = 2
	ICALL?L	L00001
	MOVE?CB	002h, _flagRestoreBackedConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00122	            else
	ICALL?L	L00001
	GOTO?L	L00038
	LABEL?L	L00037	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00123	                gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00124	            endif
	ICALL?L	L00001
	LABEL?L	L00038	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00125	            goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00126	    endif
	ICALL?L	L00001
	LABEL?L	L00035	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00127	    if ((ser_data[0] == "S" OR ser_data[0] == "s")) THEN 'print config
	ICALL?L	L00001
	CMPEQ?BCB	_ser_data, 053h, T1
	CMPEQ?BCB	_ser_data, 073h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00039

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00128	        GOSUB printConfig
	ICALL?L	L00001
	GOSUB?L	_printConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00129	        goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00130	    else
	ICALL?L	L00001
	GOTO?L	L00040
	LABEL?L	L00039	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00131	        i=0
	ICALL?L	L00001
	MOVE?CB	000h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00132	        gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00133	        if (conversionSuccessfull != 1) then
	ICALL?L	L00001
	CMPEQ?BCL	_conversionSuccessfull, 001h, L00041

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00134	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00135	            goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00136	        endif
	ICALL?L	L00001
	LABEL?L	L00041	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00137	        if (ser_data[i] != "=") then
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPEQ?BCL	T1, 03Dh, L00043

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00138	            gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00139	        else
	ICALL?L	L00001
	GOTO?L	L00044
	LABEL?L	L00043	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00140	            device_id = temp_byte                        
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00141	            for j = 0 to payloadLength
	ICALL?L	L00001
	MOVE?CB	000h, _j
	LABEL?L	L00045	
	CMPGT?BCL	_j, _payloadLength, L00046

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00142	                temp_data[j]=ser_data[i + 1]
	ICALL?L	L00001
	ADD?BCW	_i, 001h, T1
	AOUT?BWB	_ser_data, T1, T1
	AIN?BBB	T1, _temp_data, _j

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00143	                if temp_data[j] == 0 then 
	ICALL?L	L00001
	AOUT?BBB	_temp_data, _j, T1
	CMPNE?BCL	T1, 000h, L00047

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00144	                    temp_data[j] = 10
	ICALL?L	L00001
	AIN?CBB	00Ah, _temp_data, _j

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00145	                    goto endCycleS
	ICALL?L	L00001
	GOTO?L	_endCycleS

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00146	                endif
	ICALL?L	L00001
	LABEL?L	L00047	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00147	                i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00148	                if (i==payloadLength) then
	ICALL?L	L00001
	CMPNE?BCL	_i, _payloadLength, L00049

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00149	                    gosub printError 
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00150	                    goto Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00151	                endif
	ICALL?L	L00001
	LABEL?L	L00049	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00152	            next j
	ICALL?L	L00001
	NEXT?BCL	_j, 001h, L00045
	LABEL?L	L00046	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00153	            :endCycleS

	LABEL?L	_endCycleS	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00154	            if (device_id == 0) then 'default values device -> default values to use...
	ICALL?L	L00001
	CMPNE?BCL	_device_id, 000h, L00051

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00155	                gosub saveCurrentConfig
	ICALL?L	L00001
	GOSUB?L	_saveCurrentConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00156	                gosub putDefaultValues
	ICALL?L	L00001
	GOSUB?L	_putDefaultValues

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00157	                gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00158	                GOSUB sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00159	                flagRestoreBackedConfig = 1
	ICALL?L	L00001
	MOVE?CB	001h, _flagRestoreBackedConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00160	                ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00161	            else
	ICALL?L	L00001
	GOTO?L	L00052
	LABEL?L	L00051	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00162	                GOSUB sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00163	            endif
	ICALL?L	L00001
	LABEL?L	L00052	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00164	        endif
	ICALL?L	L00001
	LABEL?L	L00044	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00165	    endif
	ICALL?L	L00001
	LABEL?L	L00040	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00166	    GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00167	endif
	ICALL?L	L00001
	LABEL?L	L00023	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00168	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00169	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00170	lop:

	LABEL?L	_lop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00171	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00172	gosub ackData
	GOSUB?L	_ackData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00174	HSEROUT["+", DEC data_received[1], " "]
	HSEROUT?C	02Bh
	HSEROUTCOUNT?C	000h
	HSEROUTNUM?B	_data_received + 00001h
	HSEROUTDEC?	
	HSEROUT?C	020h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00175	for w=2 to payloadLengthD - 1
	MOVE?CB	002h, _w
	LABEL?L	L00053	
	CMPGT?BCL	_w, 017h, L00054

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00176	    HSEROUT[data_received[w]]
	AOUT?BBB	_data_received, _w, T1
	HSEROUT?B	T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00177	    if (data_received[w]) == 10 then goto contInRcv
	AOUT?BBB	_data_received, _w, T1
	CMPNE?BCL	T1, 00Ah, L00055
	GOTO?L	_contInRcv
	LABEL?L	L00055	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00178	next w
	NEXT?BCL	_w, 001h, L00053
	LABEL?L	L00054	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00179	contInRcv:

	LABEL?L	_contInRcv	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00180	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00181	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00182	end
	ICALL?L	L00001
	END?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00184	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00185	intManagement:

	LABEL?L	_intManagement	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00186	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON_2, 001h, L00057

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00187	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00188	           if (flagRestoreBackedConfig == 1) then
	CMPNE?BCL	_flagRestoreBackedConfig, 001h, L00059

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00189	                if (ticks > 10) then
	CMPLE?BCL	_ticks, 00Ah, L00061

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00190	                    flagRestoreBackedConfig = 2
	MOVE?CB	002h, _flagRestoreBackedConfig

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00191	                endif
	LABEL?L	L00061	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00192	           endif
	LABEL?L	L00059	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00193	           if ticks = 10 then
	CMPNE?BCL	_ticks, 00Ah, L00063

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00194	                    for interi=0 to payloadLengthD - 1
	MOVE?CB	000h, _interi
	LABEL?L	L00065	
	CMPGT?BCL	_interi, 017h, L00066

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00195	                        data_received[interi] = 0
	AIN?CBB	000h, _data_received, _interi

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00196	                    next interi
	NEXT?BCL	_interi, 001h, L00065
	LABEL?L	L00066	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00197	           endif
	LABEL?L	L00063	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00198	           If ticks < 31 Then tiexit
	CMPLT?BCL	_ticks, 01Fh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00199	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00200	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00201	           if seconds <= 58 then tiexit
	CMPLE?BCL	_seconds, 03Ah, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00202	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00203	           minutes = minutes + 1
	ADD?BCB	_minutes, 001h, _minutes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00204	           tiexit: 

	LABEL?L	_tiexit	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00205	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00206	        else 
	GOTO?L	L00058
	LABEL?L	L00057	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00207	            if (PIR1.5 == 1) then
	CMPNE?TCL	_PIR1_5, 001h, L00067

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00208	                 if (manageSerial == 1) then mainInt
	CMPEQ?BCL	_manageSerial, 001h, _mainInt

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00209	                 if (RCSTA.2 == 1) then
	CMPNE?TCL	_RCSTA_2, 001h, L00069

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00210	                    hserin[temp_byte_int]
	HSERIN?B	_temp_byte_int

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00211	                 endif
	LABEL?L	L00069	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00212	                 HSERIN 100, mainInt, [wait ("AT+"), STR ser_data\payloadLength\10]
	HSERINTIME?C	064h

	LABEL?L	L00002	
	HSERINWAIT?CLL	041h, L00002, _mainInt
	HSERINWAIT?CLL	054h, L00002, _mainInt
	HSERINWAIT?CLL	02Bh, L00002, _mainInt
	HSERINCOUNT?C	_payloadLength
	HSERINCHAR?C	00Ah
	HSERINSTRC?BL	_ser_data, _mainInt

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00213	                 manageSerial = 1
	MOVE?CB	001h, _manageSerial

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00214	                 :mainInt

	LABEL?L	_mainInt	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00215	            ENDIF
	LABEL?L	L00067	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00216	        endif
	LABEL?L	L00058	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00217	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00218	resume
	RESUME?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00219	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00221	cleanSerialPort:

	LABEL?L	_cleanSerialPort	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00222	    while (PIR1.5==1) 
	ICALL?L	L00001
	LABEL?L	L00071	
	CMPNE?TCL	_PIR1_5, 001h, L00072

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00223	        hserin [temp_byte]
	ICALL?L	L00001
	HSERIN?B	_temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00224	    wend
	ICALL?L	L00001
	GOTO?L	L00071
	LABEL?L	L00072	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00225	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00228	printError:

	LABEL?L	_printError	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00229	    HSEROUT["ERROR",13,10]
	ICALL?L	L00001
	HSEROUT?C	045h
	HSEROUT?C	052h
	HSEROUT?C	052h
	HSEROUT?C	04Fh
	HSEROUT?C	052h
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00230	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00232	printOK:

	LABEL?L	_printOK	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00233	    HSEROUT["OK",13,10]
	ICALL?L	L00001
	HSEROUT?C	04Fh
	HSEROUT?C	04Bh
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00234	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00236	convertInputData:

	LABEL?L	_convertInputData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00237	    temp_word = 0
	ICALL?L	L00001
	MOVE?CW	000h, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00238	    conversionSuccessfull = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccessfull

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00239	    labelContReadDecimals:

	LABEL?L	_labelContReadDecimals	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00240	        if ser_data[i] > 47 then
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPLE?BCL	T1, 02Fh, L00073

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00241	            if ser_data[i] < 58 then
	ICALL?L	L00001
	AOUT?BBB	_ser_data, _i, T1
	CMPGE?BCL	T1, 03Ah, L00075

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00242	                conversionSuccessfull = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccessfull

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00243	                TEMP_word = TEMP_word*10 + ((ser_data[i]+2)-50)
	ICALL?L	L00001
	MUL?WCW	_temp_word, 00Ah, T1
	AOUT?BBB	_ser_data, _i, T2
	ADD?BCW	T2, 002h, T2
	SUB?WCW	T2, 032h, T2
	ADD?WWW	T1, T2, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00244	                i=i+1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00245	                if (TEMP_word < 256) then goto labelContReadDecimals
	ICALL?L	L00001
	CMPGE?WCL	_temp_word, 00100h, L00077
	GOTO?L	_labelContReadDecimals
	LABEL?L	L00077	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00246	            endif
	ICALL?L	L00001
	LABEL?L	L00075	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00247	        endif
	ICALL?L	L00001
	LABEL?L	L00073	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00248	    if (TEMP_word > 255) then
	ICALL?L	L00001
	CMPLE?WCL	_temp_word, 0FFh, L00079

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00249	         conversionSuccessfull = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccessfull

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00250	    else
	ICALL?L	L00001
	GOTO?L	L00080
	LABEL?L	L00079	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00251	        temp_byte = TEMP_word
	ICALL?L	L00001
	MOVE?WB	_temp_word, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00252	    endif
	ICALL?L	L00001
	LABEL?L	L00080	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00253	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00255	savePwd:

	LABEL?L	_savePwd	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00256	    for i=2 to 10
	ICALL?L	L00001
	MOVE?CB	002h, _i
	LABEL?L	L00081	
	CMPGT?BCL	_i, 00Ah, L00082

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00257	        if (ser_data[i] == 0) or (ser_data[i] == 10) or (ser_data[i] == 13) or (ser_data[i] == " ") then 
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
	CMPF?WL	T4, L00083

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00258	            GOSUB printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00259	            return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00260	        endif
	ICALL?L	L00001
	LABEL?L	L00083	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00261	    next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00081
	LABEL?L	L00082	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00262	    if (ser_data[2] == ser_data[7]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00002h, _ser_data + 00007h, L00085

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00263	        if (ser_data[3] == ser_data[8]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00003h, _ser_data + 00008h, L00087

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00264	            if (ser_data[4] == ser_data[9]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00004h, _ser_data + 00009h, L00089

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00265	                if (ser_data[5] == ser_data[10]) then
	ICALL?L	L00001
	CMPNE?BBL	_ser_data + 00005h, _ser_data + 0000Ah, L00091

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00266	                        GOSUB printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00267	                        return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00268	                endif
	ICALL?L	L00001
	LABEL?L	L00091	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00269	            endif
	ICALL?L	L00001
	LABEL?L	L00089	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00270	        endif
	ICALL?L	L00001
	LABEL?L	L00087	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00271	    endif
	ICALL?L	L00001
	LABEL?L	L00085	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00272	    if (ser_data[11] == 0) then    
	ICALL?L	L00001
	CMPNE?BCL	_ser_data + 0000Bh, 000h, L00093

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00273	        for i=2 to 10
	ICALL?L	L00001
	MOVE?CB	002h, _i
	LABEL?L	L00095	
	CMPGT?BCL	_i, 00Ah, L00096

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00274	            disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00275	            write i-1, ser_data[i]
	SUB?BCW	_i, 001h, T1
	AOUT?BBB	_ser_data, _i, T2
	WRITE?WB	T1, T2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00276	            enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00277	        next i        
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00095
	LABEL?L	L00096	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00278	        gosub printOK
	ICALL?L	L00001
	GOSUB?L	_printOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00279	    else 
	ICALL?L	L00001
	GOTO?L	L00094
	LABEL?L	L00093	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00280	        gosub printError
	ICALL?L	L00001
	GOSUB?L	_printError

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00281	    endif
	ICALL?L	L00001
	LABEL?L	L00094	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00282	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00284	saveCurrentConfig:

	LABEL?L	_saveCurrentConfig	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00285	for i=0 to 9
	ICALL?L	L00001
	MOVE?CB	000h, _i
	LABEL?L	L00097	
	CMPGT?BCL	_i, 009h, L00098

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00286	    read i, backup_data[i]
	ICALL?L	L00001
	READ?BW	_i, T1
	AIN?BBB	T1, _backup_data, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00287	next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00097
	LABEL?L	L00098	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00288	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00290	restoreCurrentSettings:

	LABEL?L	_restoreCurrentSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00291	for i=0 to 9
	ICALL?L	L00001
	MOVE?CB	000h, _i
	LABEL?L	L00099	
	CMPGT?BCL	_i, 009h, L00100

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00292	    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00293	    write i, backup_data[i]
	AOUT?BBB	_backup_data, _i, T1
	WRITE?BB	_i, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00294	    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00295	next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00099
	LABEL?L	L00100	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00296	GOSUB commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00297	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00299	putDefaultValues:

	LABEL?L	_putDefaultValues	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00300	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00301	write 0, 40
	WRITE?CC	000h, 028h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00302	write 1, "R"
	WRITE?CC	001h, 052h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00303	write 2, "E"
	WRITE?CC	002h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00304	write 3, "M"
	WRITE?CC	003h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00305	write 4, "O"
	WRITE?CC	004h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00306	write 5, "T"
	WRITE?CC	005h, 054h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00307	write 6, "E"
	WRITE?CC	006h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00308	write 7, "H"
	WRITE?CC	007h, 048h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00309	write 8, "O"
	WRITE?CC	008h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00310	write 9, "M"
	WRITE?CC	009h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00311	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00312	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00314	addNewDevice:

	LABEL?L	_addNewDevice	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00316	device_id = 0
	ICALL?L	L00001
	MOVE?CB	000h, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00317	temp_data[0] = "c"
	ICALL?L	L00001
	MOVE?CB	063h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00318	temp_data[1] = "="
	ICALL?L	L00001
	MOVE?CB	03Dh, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00319	for i=2 to 11
	ICALL?L	L00001
	MOVE?CB	002h, _i
	LABEL?L	L00101	
	CMPGT?BCL	_i, 00Bh, L00102

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00320	    temp_data[i] = backup_data[i-2]
	ICALL?L	L00001
	SUB?BCW	_i, 002h, T1
	AOUT?BWB	_backup_data, T1, T1
	AIN?BBB	T1, _temp_data, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00321	next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00101
	LABEL?L	L00102	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00322	temp_data[12] = temp_byte 'deviceId
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _temp_data + 0000Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00323	temp_data[13] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 0000Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00324	temp_data[14] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 0000Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00325	gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00326	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00328	printConfig:

	LABEL?L	_printConfig	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00329	    read 0, temp_byte
	ICALL?L	L00001
	READ?CB	000h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00330	    HSEROUT["+Channel:",DEC temp_byte,13,10]
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

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00331	    HSEROUT["+Password:"]
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

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00332	    for i = 1 to 9
	ICALL?L	L00001
	MOVE?CB	001h, _i
	LABEL?L	L00103	
	CMPGT?BCL	_i, 009h, L00104

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00333	        read i, temp_byte
	ICALL?L	L00001
	READ?BB	_i, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00334	        HSEROUT[temp_byte]        
	ICALL?L	L00001
	HSEROUT?B	_temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00335	    next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00103
	LABEL?L	L00104	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00336	    HSEROUT[13,10]
	ICALL?L	L00001
	HSEROUT?C	00Dh
	HSEROUT?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00337	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00339	setRxAddressPipe:

	LABEL?L	_setRxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00340	READ 1, data_out[1]
	ICALL?L	L00001
	READ?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00341	READ 2, data_out[2]
	ICALL?L	L00001
	READ?CB	002h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00342	READ 3, data_out[3]
	ICALL?L	L00001
	READ?CB	003h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00343	READ 4, data_out[4]
	ICALL?L	L00001
	READ?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00344	READ 5, data_out[5]
	ICALL?L	L00001
	READ?CB	005h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00345	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00347	setTxAddressPipe:

	LABEL?L	_setTxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00348	READ 6, data_out[1]
	ICALL?L	L00001
	READ?CB	006h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00349	READ 7, data_out[2]
	ICALL?L	L00001
	READ?CB	007h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00350	READ 8, data_out[3]
	ICALL?L	L00001
	READ?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00351	READ 9, data_out[4]
	ICALL?L	L00001
	READ?CB	009h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00352	data_out[5] = device_id
	ICALL?L	L00001
	MOVE?BB	_device_id, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TRANSC~1.PBP	00353	return
	ICALL?L	L00001
	RETURN?	

	END
