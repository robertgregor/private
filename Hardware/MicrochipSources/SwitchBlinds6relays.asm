
; PicBasic Pro Compiler 2.46, (c) 1998, 2005 microEngineering Labs, Inc. All Rights Reserved.  
PM_USED			EQU	1

	INCLUDE	"16F690.INC"


; Define statements.
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4
#define		CODE_SIZE		 4
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00025	 DEFINE OSC 8
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 012h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00074	counter var word[3]
_counter         		EQU	RAM_START + 04Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00075	initialCounter var word[3]
_initialCounter  		EQU	RAM_START + 052h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00078	timeout_value var word[3]
_timeout_value   		EQU	RAM_START + 058h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00014	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 05Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00017	data_received var Byte[payloadLengthD] 'data received
_data_received   		EQU	RAM_START + 080h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00018	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 098h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00079	currentCounter var byte[3]
_currentCounter  		EQU	RAM_START + 0AEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00080	currentDirection var byte[3]
_currentDirection		EQU	RAM_START + 0B1h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00076	initialPercent var byte[3]
_initialPercent  		EQU	RAM_START + 0B4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00070	temp2_word var word
_temp2_word      		EQU	RAM_START + 0B7h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00071	temp3_word var word
_temp3_word      		EQU	RAM_START + 0B9h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00069	temp_word var word
_temp_word       		EQU	RAM_START + 0BBh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00061	ci var byte
_ci              		EQU	RAM_START + 0BDh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00062	configure var byte
_configure       		EQU	RAM_START + 0BEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00077	conversionSuccess VAR BYTE
_conversionSuccess		EQU	RAM_START + 0BFh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00081	currentPositionRelayNotifNumber var byte
_currentPositionRelayNotifNumber		EQU	RAM_START + 0C0h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00026	device_id var byte
_device_id       		EQU	RAM_START + 0C1h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00072	EEPROMBYTE      VAR BYTE
_EEPROMBYTE      		EQU	RAM_START + 0C2h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00073	EEPROMPOSITION  VAR BYTE
_EEPROMPOSITION  		EQU	RAM_START + 0C3h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00055	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 0C4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00057	icurrpos var byte
_icurrpos        		EQU	RAM_START + 0C5h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00058	icurrposArr var byte
_icurrposArr     		EQU	RAM_START + 0C6h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00056	iint var byte
_iint            		EQU	RAM_START + 0C7h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00031	interi var byte
_interi          		EQU	RAM_START + 0C8h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00028	ir var byte
_ir              		EQU	RAM_START + 0C9h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00060	j var byte
_j               		EQU	RAM_START + 0CAh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00020	k VAR byte
_k               		EQU	RAM_START + 0CBh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00012	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 0CCh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00059	relaysGroup var byte
_relaysGroup     		EQU	RAM_START + 0CDh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00027	sameFlag VAR BYTE
_sameFlag        		EQU	RAM_START + 0CEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00030	seconds var byte
_seconds         		EQU	RAM_START + 0CFh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00065	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 00100h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00022	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 00101h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00066	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 00102h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00023	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 00103h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00067	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 00104h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00024	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 00105h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00068	temp4_byte var byte
_temp4_byte      		EQU	RAM_START + 00106h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00025	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 00107h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00064	temp_byte var byte
_temp_byte       		EQU	RAM_START + 00108h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00063	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 00109h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00021	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 0010Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00029	ticks var byte
_ticks           		EQU	RAM_START + 0010Bh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00013	val var byte 'temp value
_val             		EQU	RAM_START + 0010Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00019	w var byte
_w               		EQU	RAM_START + 0010Dh
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
#define _RELAY1_DOWN     	_PORTA_5
#define _RELAY1_UP       	_PORTA_4
#define _RELAY2_DOWN     	_PORTC_4
#define _RELAY2_UP       	_PORTC_3
#define _RELAY3_DOWN     	_PORTC_6
#define _RELAY3_UP       	_PORTC_5
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
#define _val_0           	_val, 000h
#define _PORTA_5         	 PORTA, 005h
#define _PORTA_4         	 PORTA, 004h
#define _PORTC_4         	 PORTC, 004h
#define _PORTC_3         	 PORTC, 003h
#define _PORTC_6         	 PORTC, 006h
#define _PORTC_5         	 PORTC, 005h
#define _PORTB_5         	 PORTB, 005h
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00020	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,1,1,0,0]
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
	DE	001h
	DE	001h
	DE	000h
	DE	000h

	INCLUDE	"SWITCH~2.MAC"
	INCLUDE	"PBPPIC14.LIB"


; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00012	BANK0   $0020, $007F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00013	BANK1   $00A0, $00EF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00014	BANK2   $0120, $016F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00015	EEPROM  $2100, $21FF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00016	LIBRARY "PBPPIC14"
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00019	        include "PIC14EXT.BAS"

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00026	        include "PBPPIC14.RAM"

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00005	@ DEVICE PIC16F690,MCLR_OFF

	ASM?
 DEVICE PIC16F690,MCLR_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00006	@ DEVICE PIC16F690,CPD_OFF

	ASM?
 DEVICE PIC16F690,CPD_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00007	@ DEVICE PIC16F690,BOD_ON

	ASM?
 DEVICE PIC16F690,BOD_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00008	@ DEVICE PIC16F690,PWRT_ON

	ASM?
 DEVICE PIC16F690,PWRT_ON

	ENDASM?

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00020	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,1,1,0,0]

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00023	INCLUDE "RFM73.pbp"
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00025	 DEFINE OSC 8

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00027	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00028	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00029	 ANSELH = 0
	MOVE?CB	000h, ANSELH

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00030	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00031	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00034	    INTCON = %10100000  'T01 enabled PEIE disabled.
	MOVE?CB	0A0h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00035	    PIE1 = %00000000    'USART disabled
	MOVE?CB	000h, PIE1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00036	    OPTION_REG = %00000111
	MOVE?CB	007h, OPTION_REG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00038	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00039	ENABLE
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00041	TRISA = %00000000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	000h, TRISA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00042	TRISB = %00110000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	030h, TRISB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00043	TRISC = %00000100 'Set IRQ input, 
	ICALL?L	L00001
	MOVE?CB	004h, TRISC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00044	WPUA = %00000000
	ICALL?L	L00001
	MOVE?CB	000h, WPUA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00045	WPUB = %00100000
	ICALL?L	L00001
	MOVE?CB	020h, WPUB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00083	startProgram:

	LABEL?L	_startProgram	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00084	clear
	ICALL?L	L00001
	CLEAR?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00085	relaysGroup = 0
	ICALL?L	L00001
	MOVE?CB	000h, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00086	gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00087	relaysGroup = 1
	ICALL?L	L00001
	MOVE?CB	001h, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00088	gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00089	relaysGroup = 2
	ICALL?L	L00001
	MOVE?CB	002h, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00090	gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00091	read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00092	read 11, timeout_value[0]
	ICALL?L	L00001
	READ?CW	00Bh, _timeout_value

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00093	timeout_value[0] = timeout_value[0] * 30
	ICALL?L	L00001
	MUL?WCW	_timeout_value, 01Eh, _timeout_value

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00094	read 12, timeout_value[1]
	ICALL?L	L00001
	READ?CW	00Ch, _timeout_value + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00095	timeout_value[1] = timeout_value[1] * 30
	ICALL?L	L00001
	MUL?WCW	_timeout_value + 00002h, 01Eh, _timeout_value + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00096	read 13, timeout_value[2]
	ICALL?L	L00001
	READ?CW	00Dh, _timeout_value + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00097	timeout_value[2] = timeout_value[2] * 30
	ICALL?L	L00001
	MUL?WCW	_timeout_value + 00004h, 01Eh, _timeout_value + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00099	output RELAY1_DOWN
	ICALL?L	L00001
	OUTPUT?T	_RELAY1_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00100	output RELAY1_UP
	ICALL?L	L00001
	OUTPUT?T	_RELAY1_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00101	output RELAY2_DOWN
	ICALL?L	L00001
	OUTPUT?T	_RELAY2_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00102	output RELAY2_UP
	ICALL?L	L00001
	OUTPUT?T	_RELAY2_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00103	output RELAY3_DOWN
	ICALL?L	L00001
	OUTPUT?T	_RELAY3_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00104	output RELAY3_UP
	ICALL?L	L00001
	OUTPUT?T	_RELAY3_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00106	input res
	ICALL?L	L00001
	INPUT?T	_RES

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00108	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00110	commonSettings:

	LABEL?L	_commonSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00111	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00112	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00115	Main_rx:

	LABEL?L	_Main_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00116	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00117	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00118	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00119	irqLoop:

	LABEL?L	_irqLoop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00120	if RES == 0 then
	ICALL?L	L00001
	CMPNE?TCL	_RES, 000h, L00019

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00121	    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00122	    write 0, 40
	WRITE?CC	000h, 028h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00123	    write 1, "R"
	WRITE?CC	001h, 052h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00124	    write 2, "E"
	WRITE?CC	002h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00125	    write 3, "M"
	WRITE?CC	003h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00126	    write 4, "O"
	WRITE?CC	004h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00127	    write 5, "T"
	WRITE?CC	005h, 054h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00128	    write 6, "E"
	WRITE?CC	006h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00129	    write 7, "H"
	WRITE?CC	007h, 048h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00130	    write 8, "O"
	WRITE?CC	008h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00131	    write 9, "M"
	WRITE?CC	009h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00132	    write 10, 0
	WRITE?CC	00Ah, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00133	    write 11, 1
	WRITE?CC	00Bh, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00134	    write 12, 1
	WRITE?CC	00Ch, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00135	    write 13, 1
	WRITE?CC	00Dh, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00136	    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00137	    pause 1000
	ICALL?L	L00001
	PAUSE?C	003E8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00138	    goto startProgram
	ICALL?L	L00001
	GOTO?L	_startProgram

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00139	endif
	ICALL?L	L00001
	LABEL?L	L00019	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00142	if (temp_data[0] != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_data, 000h, L00021

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00143	    if (configure == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_configure, 001h, L00023

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00144	        gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00145	        configure = 0
	ICALL?L	L00001
	MOVE?CB	000h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00146	    endif
	ICALL?L	L00001
	LABEL?L	L00023	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00147	    gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00148	    temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00149	    GOTO main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00150	endif
	ICALL?L	L00001
	LABEL?L	L00021	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00151	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00152	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00153	lop:

	LABEL?L	_lop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00154	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00155	gosub ackData
	GOSUB?L	_ackData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00156	temp_data[0] = 0
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00157	if (data_received[1] == device_id) then
	CMPNE?BBL	_data_received + 00001h, _device_id, L00025

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00158	    if (data_received[2] == "c") then    
	CMPNE?BCL	_data_received + 00002h, 063h, L00027

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00159	        if (data_received[3] == "=") then
	CMPNE?BCL	_data_received + 00003h, 03Dh, L00029

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00161	            for i = 0 to 10
	MOVE?CB	000h, _i
	LABEL?L	L00031	
	CMPGT?BCL	_i, 00Ah, L00032

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00162	                disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00163	                write i, data_received[i+4]
	ADD?BCW	_i, 004h, T1
	AOUT?BWB	_data_received, T1, T1
	WRITE?BB	_i, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00164	                enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00165	            next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00031
	LABEL?L	L00032	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00166	            read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00167	            pause 250
	ICALL?L	L00001
	PAUSE?C	0FAh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00168	            configure = 1
	ICALL?L	L00001
	MOVE?CB	001h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00169	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00170	        endif
	ICALL?L	L00001
	LABEL?L	L00029	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00171	    else
	ICALL?L	L00001
	GOTO?L	L00028
	LABEL?L	L00027	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00172	     if (data_received[2] == "b") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 062h, L00033

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00173	        I = 3
	ICALL?L	L00001
	MOVE?CB	003h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00174	        gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00175	        if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00035

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00176	            temp4_byte = temp_byte - 1 'this is relay number
	ICALL?L	L00001
	SUB?BCB	_temp_byte, 001h, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00177	            if (TEMP_BYTE > 0) then
	ICALL?L	L00001
	CMPLE?BCL	_temp_byte, 000h, L00037

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00178	                if (TEMP_BYTE < 4) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 004h, L00039

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00179	                    if (data_received[4] == "t") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 074h, L00041

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00180	                        if (data_received[5] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 03Dh, L00043

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00181	                            i = 6
	ICALL?L	L00001
	MOVE?CB	006h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00182	                            gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00183	                            if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00045

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00184	                                if (temp_byte != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_byte, 000h, L00047

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00185	                                     disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00186	                                     write (11+temp4_byte), temp_byte
	ADD?CBW	00Bh, _temp4_byte, T1
	WRITE?WB	T1, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00187	                                     enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00188	                                     timeout_value[temp4_byte] = temp_byte * 30
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 01Eh, T1
	AIN?WWB	T1, _timeout_value, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00189	                                     gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00190	                                endif
	ICALL?L	L00001
	LABEL?L	L00047	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00191	                            endif                                   
	ICALL?L	L00001
	LABEL?L	L00045	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00192	                        endif
	ICALL?L	L00001
	LABEL?L	L00043	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00193	                    else
	ICALL?L	L00001
	GOTO?L	L00042
	LABEL?L	L00041	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00194	                     if (data_received[4] == "d") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 064h, L00049

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00195	                        counter[temp4_byte] = timeout_value[temp4_byte]
	ICALL?L	L00001
	AOUT?WBW	_timeout_value, _temp4_byte, T1
	AIN?WWB	T1, _counter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00196	                        initialcounter[temp4_byte] = counter[temp4_byte]
	ICALL?L	L00001
	AOUT?WBW	_counter, _temp4_byte, T1
	AIN?WWB	T1, _initialCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00197	                        relaysGroup = temp4_byte
	ICALL?L	L00001
	MOVE?BB	_temp4_byte, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00198	                        gosub blindsDown
	ICALL?L	L00001
	GOSUB?L	_blindsDown

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00199	                        initialPercent[temp4_byte] = currentCounter[temp4_byte]
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, T1
	AIN?BBB	T1, _initialPercent, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00200	                        currentCounter[temp4_byte] = 100
	ICALL?L	L00001
	AIN?CBB	064h, _currentCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00201	                        gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00202	                     else
	ICALL?L	L00001
	GOTO?L	L00050
	LABEL?L	L00049	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00203	                      if (data_received[4] == "u") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 075h, L00051

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00204	                        counter[temp4_byte] = timeout_value[temp4_byte]
	ICALL?L	L00001
	AOUT?WBW	_timeout_value, _temp4_byte, T1
	AIN?WWB	T1, _counter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00205	                        initialCounter[temp4_byte] = counter[temp4_byte]
	ICALL?L	L00001
	AOUT?WBW	_counter, _temp4_byte, T1
	AIN?WWB	T1, _initialCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00206	                        relaysGroup = temp4_byte
	ICALL?L	L00001
	MOVE?BB	_temp4_byte, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00207	                        gosub blindsup
	ICALL?L	L00001
	GOSUB?L	_blindsup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00208	                        initialPercent[temp4_byte] = currentCounter[temp4_byte]            
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, T1
	AIN?BBB	T1, _initialPercent, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00209	                        currentCounter[temp4_byte] = 0
	ICALL?L	L00001
	AIN?CBB	000h, _currentCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00210	                        gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00211	                      else
	ICALL?L	L00001
	GOTO?L	L00052
	LABEL?L	L00051	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00212	                       if (data_received[4] == "m") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 06Dh, L00053

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00213	                        if (data_received[5] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00005h, 03Dh, L00055

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00214	                            i = 6
	ICALL?L	L00001
	MOVE?CB	006h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00215	                            gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00216	                            if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00057

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00217	                              if (temp_byte < 101) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 065h, L00059

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00218	                                if (temp_byte == currentCounter[temp4_byte]) then
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, T1
	CMPNE?BBL	_temp_byte, T1, L00061

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00219	                                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00220	                                    counter[temp4_byte] = 4
	ICALL?L	L00001
	AIN?CWB	004h, _counter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00221	                                else
	ICALL?L	L00001
	GOTO?L	L00062
	LABEL?L	L00061	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00222	                                 if (temp_byte > currentCounter[temp4_byte]) then
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, T1
	CMPLE?BBL	_temp_byte, T1, L00063

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00223	                                    temp2_byte = temp_byte - currentCounter[temp4_byte]
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, T1
	SUB?BBB	_temp_byte, T1, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00224	                                    initialPercent[temp4_byte] = currentCounter[temp4_byte]
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, T1
	AIN?BBB	T1, _initialPercent, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00225	                                    relaysGroup = temp4_byte
	ICALL?L	L00001
	MOVE?BB	_temp4_byte, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00226	                                    gosub computeCounter
	ICALL?L	L00001
	GOSUB?L	_computeCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00227	                                    initialCounter[temp4_byte] = counter[temp4_byte]
	ICALL?L	L00001
	AOUT?WBW	_counter, _temp4_byte, T1
	AIN?WWB	T1, _initialCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00228	                                    gosub blindsDown
	ICALL?L	L00001
	GOSUB?L	_blindsDown

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00229	                                    currentCounter[temp4_byte] = temp_byte
	ICALL?L	L00001
	AIN?BBB	_temp_byte, _currentCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00230	                                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00231	                                 else
	ICALL?L	L00001
	GOTO?L	L00064
	LABEL?L	L00063	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00232	                                    temp2_byte = currentCounter[temp4_byte] - temp_byte
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, T1
	SUB?BBB	T1, _temp_byte, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00233	                                    initialPercent[temp4_byte] = currentCounter[temp4_byte]
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, T1
	AIN?BBB	T1, _initialPercent, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00234	                                    relaysGroup = temp4_byte
	ICALL?L	L00001
	MOVE?BB	_temp4_byte, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00235	                                    gosub computeCounter
	ICALL?L	L00001
	GOSUB?L	_computeCounter

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00236	                                    initialCounter[temp4_byte] = counter[temp4_byte]
	ICALL?L	L00001
	AOUT?WBW	_counter, _temp4_byte, T1
	AIN?WWB	T1, _initialCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00237	                                    gosub blindsUp
	ICALL?L	L00001
	GOSUB?L	_blindsup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00238	                                    currentCounter[temp4_byte] = temp_byte
	ICALL?L	L00001
	AIN?BBB	_temp_byte, _currentCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00239	                                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00240	                                 endif
	ICALL?L	L00001
	LABEL?L	L00064	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00241	                                endif
	ICALL?L	L00001
	LABEL?L	L00062	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00242	                              endif  
	ICALL?L	L00001
	LABEL?L	L00059	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00243	                            endif                                                   
	ICALL?L	L00001
	LABEL?L	L00057	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00244	                        endif
	ICALL?L	L00001
	LABEL?L	L00055	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00245	                       else
	ICALL?L	L00001
	GOTO?L	L00054
	LABEL?L	L00053	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00246	                        if (data_received[4] == "s") then               
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00004h, 073h, L00065

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00247	                         if (currentDirection[temp4_byte] != 0) then
	ICALL?L	L00001
	AOUT?BBB	_currentDirection, _temp4_byte, T1
	CMPEQ?BCL	T1, 000h, L00067

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00248	                            temp_word = initialCounter[temp4_byte] - counter[temp4_byte]
	ICALL?L	L00001
	AOUT?WBW	_initialCounter, _temp4_byte, T1
	AOUT?WBW	_counter, _temp4_byte, T2
	SUB?WWW	T1, T2, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00249	                            disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00250	                            temp_word = temp_word * 100
	MUL?WCW	_temp_word, 064h, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00251	                            temp2_word = DIV32 timeout_value[temp4_byte]
	AOUT?WBW	_timeout_value, _temp4_byte, T1
	DIV32?WW	T1, _temp2_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00252	                            enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00253	                            if (currentDirection[temp4_byte] == 1) then
	ICALL?L	L00001
	AOUT?BBB	_currentDirection, _temp4_byte, T1
	CMPNE?BCL	T1, 001h, L00069

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00254	                                temp3_word = initialPercent[temp4_byte] + temp2_word
	ICALL?L	L00001
	AOUT?BBB	_initialPercent, _temp4_byte, T1
	ADD?BWW	T1, _temp2_word, _temp3_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00255	                                if (temp3_word > 100 ) then temp3_word = 100
	ICALL?L	L00001
	CMPLE?WCL	_temp3_word, 064h, L00071
	MOVE?CW	064h, _temp3_word
	LABEL?L	L00071	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00256	                                currentCounter[temp4_byte] = temp3_word
	ICALL?L	L00001
	AIN?WBB	_temp3_word, _currentCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00257	                            else
	ICALL?L	L00001
	GOTO?L	L00070
	LABEL?L	L00069	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00258	                             if (currentDirection[temp4_byte] == 2) then
	ICALL?L	L00001
	AOUT?BBB	_currentDirection, _temp4_byte, T1
	CMPNE?BCL	T1, 002h, L00073

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00259	                                if (initialPercent[temp4_byte] > temp2_word) then
	ICALL?L	L00001
	AOUT?BBB	_initialPercent, _temp4_byte, T1
	CMPLE?BWL	T1, _temp2_word, L00075

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00260	                                    currentCounter[temp4_byte] = initialPercent[temp4_byte] - temp2_word
	ICALL?L	L00001
	AOUT?BBB	_initialPercent, _temp4_byte, T1
	SUB?BWW	T1, _temp2_word, T1
	AIN?WBB	T1, _currentCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00261	                                else
	ICALL?L	L00001
	GOTO?L	L00076
	LABEL?L	L00075	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00262	                                    currentCounter[temp4_byte] = 0
	ICALL?L	L00001
	AIN?CBB	000h, _currentCounter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00263	                                endif
	ICALL?L	L00001
	LABEL?L	L00076	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00264	                             endif
	ICALL?L	L00001
	LABEL?L	L00073	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00265	                            endif
	ICALL?L	L00001
	LABEL?L	L00070	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00266	                            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00267	                            counter[temp4_byte] = 4
	ICALL?L	L00001
	AIN?CWB	004h, _counter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00268	                         else
	ICALL?L	L00001
	GOTO?L	L00068
	LABEL?L	L00067	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00269	                            gosub sendDataOK            
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00270	                            counter[temp4_byte] = 4
	ICALL?L	L00001
	AIN?CWB	004h, _counter, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00271	                         endif
	ICALL?L	L00001
	LABEL?L	L00068	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00272	                        endif
	ICALL?L	L00001
	LABEL?L	L00065	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00273	                       endif
	ICALL?L	L00001
	LABEL?L	L00054	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00274	                      endif
	ICALL?L	L00001
	LABEL?L	L00052	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00275	                     endif
	ICALL?L	L00001
	LABEL?L	L00050	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00276	                    endif
	ICALL?L	L00001
	LABEL?L	L00042	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00277	                endif
	ICALL?L	L00001
	LABEL?L	L00039	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00278	            endif
	ICALL?L	L00001
	LABEL?L	L00037	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00279	        endif
	ICALL?L	L00001
	LABEL?L	L00035	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00280	     else
	ICALL?L	L00001
	GOTO?L	L00034
	LABEL?L	L00033	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00281	      if (data_received[2] == "s") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 073h, L00077

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00282	        I = 3
	ICALL?L	L00001
	MOVE?CB	003h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00283	        gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00284	        if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00079

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00285	            temp4_byte = temp_byte - 1 'this is relay number
	ICALL?L	L00001
	SUB?BCB	_temp_byte, 001h, _temp4_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00286	            if (TEMP_BYTE > 0) then
	ICALL?L	L00001
	CMPLE?BCL	_temp_byte, 000h, L00081

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00287	                if (TEMP_BYTE < 4) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 004h, L00083

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00288	                    temp_data[0] = "5"
	ICALL?L	L00001
	MOVE?CB	035h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00289	                    temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00290	                    if (temp4_byte == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp4_byte, 000h, L00085

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00291	                        temp_data[2] = RELAY1_DOWN + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY1_DOWN, 030h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00292	                        temp_data[3] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00293	                        temp_data[4] = RELAY1_UP + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY1_UP, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00294	                    else
	ICALL?L	L00001
	GOTO?L	L00086
	LABEL?L	L00085	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00295	                     if (temp4_byte == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_temp4_byte, 001h, L00087

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00296	                        temp_data[2] = RELAY2_DOWN + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY2_DOWN, 030h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00297	                        temp_data[3] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00298	                        temp_data[4] = RELAY2_UP + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY2_UP, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00299	                     else
	ICALL?L	L00001
	GOTO?L	L00088
	LABEL?L	L00087	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00300	                      if (temp4_byte == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_temp4_byte, 002h, L00089

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00301	                        temp_data[2] = RELAY3_DOWN + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY3_DOWN, 030h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00302	                        temp_data[3] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00303	                        temp_data[4] = RELAY3_UP + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY3_UP, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00304	                      endif
	ICALL?L	L00001
	LABEL?L	L00089	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00305	                     endif
	ICALL?L	L00001
	LABEL?L	L00088	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00306	                    endif
	ICALL?L	L00001
	LABEL?L	L00086	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00307	                    temp_data[5] = "|"            
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00308	                    temp_byte = timeout_value[temp4_byte] / 30
	ICALL?L	L00001
	AOUT?WBW	_timeout_value, _temp4_byte, T1
	DIV?WCB	T1, 01Eh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00309	                    gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00310	                    temp_data[6] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00311	                    temp_data[7] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00312	                    temp_data[8] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00313	                    temp_data[9] = "|"            
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00314	                    temp_byte = currentCounter[temp4_byte]
	ICALL?L	L00001
	AOUT?BBB	_currentCounter, _temp4_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00315	                    gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00316	                    temp_data[10] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00317	                    temp_data[11] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00318	                    temp_data[12] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 0000Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00319	                    temp_data[13] = 13    
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 0000Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00320	                    temp_data[14] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 0000Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00321	                endif
	ICALL?L	L00001
	LABEL?L	L00083	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00322	            endif
	ICALL?L	L00001
	LABEL?L	L00081	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00323	        endif
	ICALL?L	L00001
	LABEL?L	L00079	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00324	      else
	ICALL?L	L00001
	GOTO?L	L00078
	LABEL?L	L00077	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00325	       if (data_received[2] == "p") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 070h, L00091

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00326	            if (data_received[3] == "n") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00003h, 06Eh, L00093

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00327	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00328	            endif
	ICALL?L	L00001
	LABEL?L	L00093	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00329	       else
	ICALL?L	L00001
	GOTO?L	L00092
	LABEL?L	L00091	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00330	        if (data_received[2] == "u") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 075h, L00095

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00331	         I = 3
	ICALL?L	L00001
	MOVE?CB	003h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00332	         gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00333	         if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00097

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00334	            if (temp_byte > 0) then
	ICALL?L	L00001
	CMPLE?BCL	_temp_byte, 000h, L00099

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00335	                if (temp_byte < 4) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 004h, L00101

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00336	                    relaysGroup = temp_byte - 1
	ICALL?L	L00001
	SUB?BCB	_temp_byte, 001h, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00337	                    gosub blindsUp
	ICALL?L	L00001
	GOSUB?L	_blindsup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00338	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00339	                endif
	ICALL?L	L00001
	LABEL?L	L00101	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00340	            endif
	ICALL?L	L00001
	LABEL?L	L00099	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00341	         endif
	ICALL?L	L00001
	LABEL?L	L00097	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00342	        else
	ICALL?L	L00001
	GOTO?L	L00096
	LABEL?L	L00095	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00343	         if (data_received[2] == "d") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 064h, L00103

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00344	          I = 3
	ICALL?L	L00001
	MOVE?CB	003h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00345	          gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00346	          if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00105

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00347	            if (temp_byte > 0) then
	ICALL?L	L00001
	CMPLE?BCL	_temp_byte, 000h, L00107

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00348	                if (temp_byte < 4) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 004h, L00109

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00349	                    relaysGroup = temp_byte - 1
	ICALL?L	L00001
	SUB?BCB	_temp_byte, 001h, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00350	                    gosub blindsDown
	ICALL?L	L00001
	GOSUB?L	_blindsDown

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00351	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00352	                endif
	ICALL?L	L00001
	LABEL?L	L00109	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00353	            endif
	ICALL?L	L00001
	LABEL?L	L00107	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00354	          endif
	ICALL?L	L00001
	LABEL?L	L00105	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00355	         else
	ICALL?L	L00001
	GOTO?L	L00104
	LABEL?L	L00103	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00356	          if (data_received[2] == "e") then
	ICALL?L	L00001
	CMPNE?BCL	_data_received + 00002h, 065h, L00111

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00357	           I = 3
	ICALL?L	L00001
	MOVE?CB	003h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00358	           gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00359	           if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00113

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00360	            if (temp_byte > 0) then
	ICALL?L	L00001
	CMPLE?BCL	_temp_byte, 000h, L00115

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00361	                if (temp_byte < 4) then
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 004h, L00117

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00362	                    relaysGroup = temp_byte - 1
	ICALL?L	L00001
	SUB?BCB	_temp_byte, 001h, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00363	                    gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00364	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00365	                endif
	ICALL?L	L00001
	LABEL?L	L00117	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00366	            endif
	ICALL?L	L00001
	LABEL?L	L00115	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00367	           endif
	ICALL?L	L00001
	LABEL?L	L00113	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00368	          endif
	ICALL?L	L00001
	LABEL?L	L00111	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00369	         endif
	ICALL?L	L00001
	LABEL?L	L00104	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00370	        endif
	ICALL?L	L00001
	LABEL?L	L00096	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00371	       endif
	ICALL?L	L00001
	LABEL?L	L00092	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00372	      endif
	ICALL?L	L00001
	LABEL?L	L00078	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00373	     endif
	ICALL?L	L00001
	LABEL?L	L00034	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00374	    endif
	ICALL?L	L00001
	LABEL?L	L00028	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00375	    if (temp_data[0] == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp_data, 000h, L00119

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00376	        temp_data[0] = "E"
	ICALL?L	L00001
	MOVE?CB	045h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00377	        temp_data[1] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00378	        temp_data[2] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00379	        temp_data[3] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00380	        temp_data[4] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00381	        temp_data[5] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00382	    endif
	ICALL?L	L00001
	LABEL?L	L00119	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00383	endif
	ICALL?L	L00001
	LABEL?L	L00025	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00384	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00385	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00386	end
	ICALL?L	L00001
	END?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00388	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00389	intManagement:

	LABEL?L	_intManagement	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00390	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON_2, 001h, L00121

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00391	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00392	           if ticks = 5 then
	CMPNE?BCL	_ticks, 005h, L00123

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00393	                    for interi=0 to payloadLengthD - 1
	MOVE?CB	000h, _interi
	LABEL?L	L00125	
	CMPGT?BCL	_interi, 017h, L00126

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00394	                        data_received[interi] = 0
	AIN?CBB	000h, _data_received, _interi

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00395	                    next interi
	NEXT?BCL	_interi, 001h, L00125
	LABEL?L	L00126	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00396	           endif           
	LABEL?L	L00123	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00397	           for iint = 0 to 2
	MOVE?CB	000h, _iint
	LABEL?L	L00127	
	CMPGT?BCL	_iint, 002h, L00128

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00398	               if (counter[iint] > 0) then
	AOUT?WBW	_counter, _iint, T1
	CMPLE?WCL	T1, 000h, L00129

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00399	                   counter[iint] = counter[iint] - 1
	AOUT?WBW	_counter, _iint, T1
	SUB?WCW	T1, 001h, T1
	AIN?WWB	T1, _counter, _iint

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00400	                   if (counter[iint] == 0) then
	AOUT?WBW	_counter, _iint, T1
	CMPNE?WCL	T1, 000h, L00131

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00401	                        if (iint == 0) then
	CMPNE?BCL	_iint, 000h, L00133

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00402	                            low RELAY1_DOWN
	LOW?T	_RELAY1_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00403	                            low RELAY1_UP
	LOW?T	_RELAY1_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00404	                            currentDirection[iint] = 0
	AIN?CBB	000h, _currentDirection, _iint

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00405	                            currentPositionRelayNotifNumber = 49
	MOVE?CB	031h, _currentPositionRelayNotifNumber

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00406	                            gosub sendCurrentPosition
	GOSUB?L	_sendCurrentPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00407	                        else
	GOTO?L	L00134
	LABEL?L	L00133	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00408	                         if (iint == 1) then
	CMPNE?BCL	_iint, 001h, L00135

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00409	                            low RELAY2_DOWN
	LOW?T	_RELAY2_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00410	                            low RELAY2_UP                            
	LOW?T	_RELAY2_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00411	                            currentDirection[iint] = 0
	AIN?CBB	000h, _currentDirection, _iint

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00412	                            currentPositionRelayNotifNumber = 50                            
	MOVE?CB	032h, _currentPositionRelayNotifNumber

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00413	                            gosub sendCurrentPosition
	GOSUB?L	_sendCurrentPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00414	                         else
	GOTO?L	L00136
	LABEL?L	L00135	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00415	                          if (iint == 2) then
	CMPNE?BCL	_iint, 002h, L00137

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00416	                            low RELAY3_DOWN
	LOW?T	_RELAY3_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00417	                            low RELAY3_UP                            
	LOW?T	_RELAY3_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00418	                            currentDirection[iint] = 0
	AIN?CBB	000h, _currentDirection, _iint

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00419	                            currentPositionRelayNotifNumber = 51
	MOVE?CB	033h, _currentPositionRelayNotifNumber

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00420	                            gosub sendCurrentPosition
	GOSUB?L	_sendCurrentPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00421	                          endif
	LABEL?L	L00137	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00422	                         endif
	LABEL?L	L00136	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00423	                        endif                        
	LABEL?L	L00134	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00424	                   endif
	LABEL?L	L00131	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00425	               endif
	LABEL?L	L00129	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00426	           next iint
	NEXT?BCL	_iint, 001h, L00127
	LABEL?L	L00128	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00427	           If ticks < 31 Then tiexit
	CMPLT?BCL	_ticks, 01Fh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00428	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00429	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00430	           if seconds <= 59 then tiexit
	CMPLE?BCL	_seconds, 03Bh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00431	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00432	           tiexit: 

	LABEL?L	_tiexit	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00433	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00434	        endif
	LABEL?L	L00121	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00435	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00436	resume
	RESUME?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00437	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00439	stopBlinds:

	LABEL?L	_stopBlinds	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00440	    gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00441	    gosub sendCurrentPosition
	ICALL?L	L00001
	GOSUB?L	_sendCurrentPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00442	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00444	stopBlindsSilent:

	LABEL?L	_stopBlindsSilent	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00445	    if (relaysGroup == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 000h, L00139

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00446	        LOW RELAY1_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY1_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00447	        low RELAY1_UP
	ICALL?L	L00001
	LOW?T	_RELAY1_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00448	        currentPositionRelayNotifNumber = 49
	ICALL?L	L00001
	MOVE?CB	031h, _currentPositionRelayNotifNumber

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00449	    else
	ICALL?L	L00001
	GOTO?L	L00140
	LABEL?L	L00139	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00450	     if (relaysGroup == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 001h, L00141

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00451	        LOW RELAY2_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY2_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00452	        low RELAY2_UP
	ICALL?L	L00001
	LOW?T	_RELAY2_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00453	        currentPositionRelayNotifNumber = 50
	ICALL?L	L00001
	MOVE?CB	032h, _currentPositionRelayNotifNumber

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00454	     else
	ICALL?L	L00001
	GOTO?L	L00142
	LABEL?L	L00141	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00455	      if (relaysGroup == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 002h, L00143

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00456	        LOW RELAY3_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY3_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00457	        low RELAY3_UP
	ICALL?L	L00001
	LOW?T	_RELAY3_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00458	        currentPositionRelayNotifNumber = 51
	ICALL?L	L00001
	MOVE?CB	033h, _currentPositionRelayNotifNumber

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00459	      endif
	ICALL?L	L00001
	LABEL?L	L00143	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00460	     endif
	ICALL?L	L00001
	LABEL?L	L00142	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00461	    endif
	ICALL?L	L00001
	LABEL?L	L00140	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00462	    currentDirection[relaysGroup] = 0
	ICALL?L	L00001
	AIN?CBB	000h, _currentDirection, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00463	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00465	blindsUp:

	LABEL?L	_blindsup	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00466	    gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00467	    pause 100
	ICALL?L	L00001
	PAUSE?C	064h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00468	    if (relaysGroup == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 000h, L00145

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00469	        high RELAY1_DOWN
	ICALL?L	L00001
	HIGH?T	_RELAY1_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00470	        low RELAY1_UP
	ICALL?L	L00001
	LOW?T	_RELAY1_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00471	    else
	ICALL?L	L00001
	GOTO?L	L00146
	LABEL?L	L00145	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00472	     if (relaysGroup == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 001h, L00147

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00473	        high RELAY2_DOWN
	ICALL?L	L00001
	HIGH?T	_RELAY2_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00474	        low RELAY2_UP
	ICALL?L	L00001
	LOW?T	_RELAY2_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00475	     else
	ICALL?L	L00001
	GOTO?L	L00148
	LABEL?L	L00147	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00476	      if (relaysGroup == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 002h, L00149

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00477	        high RELAY3_DOWN
	ICALL?L	L00001
	HIGH?T	_RELAY3_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00478	        low RELAY3_UP
	ICALL?L	L00001
	LOW?T	_RELAY3_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00479	      endif
	ICALL?L	L00001
	LABEL?L	L00149	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00480	     endif
	ICALL?L	L00001
	LABEL?L	L00148	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00481	    endif
	ICALL?L	L00001
	LABEL?L	L00146	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00482	    currentDirection[relaysGroup] = 2
	ICALL?L	L00001
	AIN?CBB	002h, _currentDirection, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00483	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00485	blindsDown:

	LABEL?L	_blindsDown	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00486	    gosub stopBlindsSilent
	ICALL?L	L00001
	GOSUB?L	_stopBlindsSilent

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00487	    pause 100
	ICALL?L	L00001
	PAUSE?C	064h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00488	    if (relaysGroup == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 000h, L00151

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00489	        LOW RELAY1_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY1_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00490	        HIGH RELAY1_UP
	ICALL?L	L00001
	HIGH?T	_RELAY1_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00491	    else
	ICALL?L	L00001
	GOTO?L	L00152
	LABEL?L	L00151	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00492	     if (relaysGroup == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 001h, L00153

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00493	        LOW RELAY2_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY2_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00494	        HIGH RELAY2_UP
	ICALL?L	L00001
	HIGH?T	_RELAY2_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00495	     else
	ICALL?L	L00001
	GOTO?L	L00154
	LABEL?L	L00153	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00496	      if (relaysGroup == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_relaysGroup, 002h, L00155

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00497	        LOW RELAY3_DOWN
	ICALL?L	L00001
	LOW?T	_RELAY3_DOWN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00498	        HIGH RELAY3_UP
	ICALL?L	L00001
	HIGH?T	_RELAY3_UP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00499	      endif
	ICALL?L	L00001
	LABEL?L	L00155	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00500	     endif
	ICALL?L	L00001
	LABEL?L	L00154	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00501	    endif
	ICALL?L	L00001
	LABEL?L	L00152	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00502	    currentDirection[relaysGroup] = 1
	ICALL?L	L00001
	AIN?CBB	001h, _currentDirection, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00503	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00505	sendCurrentPosition:

	LABEL?L	_sendCurrentPosition	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00506	    temp_data[0] = "l"
	ICALL?L	L00001
	MOVE?CB	06Ch, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00507	    temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00508	    if (currentPositionRelayNotifNumber == 49) then
	ICALL?L	L00001
	CMPNE?BCL	_currentPositionRelayNotifNumber, 031h, L00157

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00509	        temp_byte = currentCounter[0]
	ICALL?L	L00001
	MOVE?BB	_currentCounter, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00510	    else
	ICALL?L	L00001
	GOTO?L	L00158
	LABEL?L	L00157	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00511	     if (currentPositionRelayNotifNumber == 50) then
	ICALL?L	L00001
	CMPNE?BCL	_currentPositionRelayNotifNumber, 032h, L00159

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00512	        temp_byte = currentCounter[1]
	ICALL?L	L00001
	MOVE?BB	_currentCounter + 00001h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00513	     else
	ICALL?L	L00001
	GOTO?L	L00160
	LABEL?L	L00159	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00514	      if (currentPositionRelayNotifNumber == 51) then
	ICALL?L	L00001
	CMPNE?BCL	_currentPositionRelayNotifNumber, 033h, L00161

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00515	        temp_byte = currentCounter[2]
	ICALL?L	L00001
	MOVE?BB	_currentCounter + 00002h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00516	      endif
	ICALL?L	L00001
	LABEL?L	L00161	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00517	     endif
	ICALL?L	L00001
	LABEL?L	L00160	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00518	    endif        
	ICALL?L	L00001
	LABEL?L	L00158	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00519	    gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00520	    temp_data[2] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00521	    temp_data[3] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00522	    temp_data[4] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00523	    temp_data[5] = "|"    
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00524	    temp_data[6] = currentPositionRelayNotifNumber
	ICALL?L	L00001
	MOVE?BB	_currentPositionRelayNotifNumber, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00525	    temp_data[7] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00526	    temp_data[8] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00527	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00529	computeCounter:

	LABEL?L	_computeCounter	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00530	    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00531	    temp_word = timeout_value[relaysGroup] * temp2_byte
	AOUT?WBW	_timeout_value, _relaysGroup, T1
	MUL?WBW	T1, _temp2_byte, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00532	    counter[relaysGroup] = div32 100
	DIV32?CW	064h, T1
	AIN?WWB	T1, _counter, _relaysGroup

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00533	    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00534	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00536	sendDataOK:

	LABEL?L	_sendDataOK	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00537	    temp_data[0] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00538	    temp_data[1] = "K"
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00539	    temp_data[2] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00540	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00542	convertInputData:

	LABEL?L	_convertInputData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00543	    conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00544	    TEMP_BYTE="a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00545	    for ci=0 to 2    
	ICALL?L	L00001
	MOVE?CB	000h, _ci
	LABEL?L	L00163	
	CMPGT?BCL	_ci, 002h, L00164

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00546	        TEMP1_BYTE = "a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00547	        TEMP2_BYTE = data_received[i]
	ICALL?L	L00001
	AOUT?BBB	_data_received, _i, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00548	        if (TEMP2_BYTE == "|") then return
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 07Ch, L00165
	RETURN?	
	LABEL?L	L00165	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00549	        GOSUB lookupChar
	ICALL?L	L00001
	GOSUB?L	_lookupChar

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00550	        if (TEMP1_BYTE == "a") then return 
	ICALL?L	L00001
	CMPNE?BCL	_temp1_byte, 061h, L00167
	RETURN?	
	LABEL?L	L00167	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00551	        if (ci==0) then 
	ICALL?L	L00001
	CMPNE?BCL	_ci, 000h, L00169

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00552	            TEMP_BYTE = TEMP1_BYTE
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00553	            conversionSuccess = 1 
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00554	        else 
	ICALL?L	L00001
	GOTO?L	L00170
	LABEL?L	L00169	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00555	            TEMP_BYTE = TEMP_BYTE*10 + TEMP1_BYTE
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 00Ah, T1
	ADD?WBB	T1, _temp1_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00556	            conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00557	        endif
	ICALL?L	L00001
	LABEL?L	L00170	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00558	        i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00559	    next ci
	ICALL?L	L00001
	NEXT?BCL	_ci, 001h, L00163
	LABEL?L	L00164	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00560	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00562	lookupChar:

	LABEL?L	_lookupChar	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00563	    LOOKDOWN temp2_byte,["0123456789"], temp1_byte
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

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00564	RETURN
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00566	convertNoToStr:

	LABEL?L	_convertNoToStr	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00567	        temp3_byte = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCB	T1, 030h, _temp3_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00568	        temp2_byte = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCB	T1, 030h, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00569	        temp1_byte = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCB	T1, 030h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00570	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00572	setRxAddressPipe:

	LABEL?L	_setRxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00573	READ 6, data_out[1]
	ICALL?L	L00001
	READ?CB	006h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00574	READ 7, data_out[2]
	ICALL?L	L00001
	READ?CB	007h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00575	READ 8, data_out[3]
	ICALL?L	L00001
	READ?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00576	READ 9, data_out[4]
	ICALL?L	L00001
	READ?CB	009h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00577	data_out[5] = device_id
	ICALL?L	L00001
	MOVE?BB	_device_id, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00578	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00580	setTxAddressPipe:

	LABEL?L	_setTxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00581	READ 1, data_out[1]
	ICALL?L	L00001
	READ?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00582	READ 2, data_out[2]
	ICALL?L	L00001
	READ?CB	002h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00583	READ 3, data_out[3]
	ICALL?L	L00001
	READ?CB	003h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00584	READ 4, data_out[4]
	ICALL?L	L00001
	READ?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00585	READ 5, data_out[5]
	ICALL?L	L00001
	READ?CB	005h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\SWITCH~2.PBP	00586	return
	ICALL?L	L00001
	RETURN?	

	END
