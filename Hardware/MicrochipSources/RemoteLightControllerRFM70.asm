
; PICBASIC PRO(TM) Compiler 2.60C, (c) 1998, 2011 microEngineering Labs, Inc. All Rights Reserved. 
PM_USED			EQU	1

	INCLUDE	"16F690.INC"


; Define statements.
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00017	DEFINE  CODE_SIZE 4
#define		CODE_SIZE		 4
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00018	DEFINE	CCP1_REG PORTC
#define		CCP1_REG		 PORTC
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00019	DEFINE	CCP1_BIT 5
#define		CCP1_BIT		 5
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00024	 DEFINE OSC 8
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

; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00012	A00020	R0      VAR     WORD BANK0 SYSTEM       ' System Register
R0              		EQU	RAM_START + 000h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00013	A00022	R1      VAR     WORD BANK0 SYSTEM       ' System Register
R1              		EQU	RAM_START + 002h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00014	A00024	R2      VAR     WORD BANK0 SYSTEM       ' System Register
R2              		EQU	RAM_START + 004h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00015	A00026	R3      VAR     WORD BANK0 SYSTEM       ' System Register
R3              		EQU	RAM_START + 006h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00016	A00028	R4      VAR     WORD BANK0 SYSTEM       ' System Register
R4              		EQU	RAM_START + 008h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00017	A0002A	R5      VAR     WORD BANK0 SYSTEM       ' System Register
R5              		EQU	RAM_START + 00Ah
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00018	A0002C	R6      VAR     WORD BANK0 SYSTEM       ' System Register
R6              		EQU	RAM_START + 00Ch
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00019	A0002E	R7      VAR     WORD BANK0 SYSTEM       ' System Register
R7              		EQU	RAM_START + 00Eh
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00020	A00030	R8      VAR     WORD BANK0 SYSTEM       ' System Register
R8              		EQU	RAM_START + 010h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00026	A00032	FLAGS   VAR     BYTE BANK0 SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 012h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00025	A00033	GOP     VAR     BYTE BANK0 SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 013h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00022	A00034	RM1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 014h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00024	A00035	RM2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 015h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00021	A00036	RR1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 016h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\PBPPIC14.RAM	00023	A00037	RR2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 017h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00016	A00038	data_in var Byte[payloadLengthD] 'data received
_data_in         		EQU	RAM_START + 018h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00015	A00050	data_out VAR BYTE[payloadLengthD] 'data sent
_data_out        		EQU	RAM_START + 030h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00017	A00068	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 048h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00014	A0007E	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 05Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00001	A000A0	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 080h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00001	A000A2	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T2              		EQU	RAM_START + 082h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00062	A000A4	temp_word var word
_temp_word       		EQU	RAM_START + 084h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00048	A000A6	alarmCounter VAR byte
_alarmCounter    		EQU	RAM_START + 086h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00064	A000A7	ALEnterCounter VAR BYTE
_ALEnterCounter  		EQU	RAM_START + 087h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00065	A000A8	ALLeaveCounter VAR BYTE
_ALLeaveCounter  		EQU	RAM_START + 088h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00063	A000A9	ALSTATUS VAR BYTE '0 disabled, 1 enabled, 2 activated, 3 leave timeout running, 4 enter timeout running
_ALSTATUS        		EQU	RAM_START + 089h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00055	A000AA	configure var byte
_configure       		EQU	RAM_START + 08Ah
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00070	A000AB	conversionSuccess var byte
_conversionSuccess		EQU	RAM_START + 08Bh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00025	A000AC	device_id var byte
_device_id       		EQU	RAM_START + 08Ch
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00051	A000AD	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 08Dh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00052	A000AE	j var byte
_j               		EQU	RAM_START + 08Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00019	A000AF	k VAR byte
_k               		EQU	RAM_START + 08Fh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00068	A000B0	l1counter var byte
_l1counter       		EQU	RAM_START + 090h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00069	A000B1	l1onAlarm var byte
_l1onAlarm       		EQU	RAM_START + 091h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00012	A000B2	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 092h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00054	A000B3	relay_alarm_counter var byte
_relay_alarm_counter		EQU	RAM_START + 093h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00066	A000B4	seconds  var     byte    ' Define second variable
_seconds         		EQU	RAM_START + 094h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00058	A000B5	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 095h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00021	A000B6	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 096h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00059	A000B7	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 097h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00022	A000B8	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 098h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00060	A000B9	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 099h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00023	A000BA	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 09Ah
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00061	A000BB	temp4_byte var byte
_temp4_byte      		EQU	RAM_START + 09Bh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00024	A000BC	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 09Ch
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00057	A000BD	temp_byte var byte
_temp_byte       		EQU	RAM_START + 09Dh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00056	A000BE	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 09Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00020	A000BF	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 09Fh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00067	A000C0	ticks   var     byte    ' Define pieces of seconds variable
_ticks           		EQU	RAM_START + 0A0h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00013	A000C1	val var byte 'temp value
_val             		EQU	RAM_START + 0A1h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00018	A000C2	w var byte
_w               		EQU	RAM_START + 0A2h
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00023	PORTL   VAR     PORTA
_PORTL           		EQU	 PORTA
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00024	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00025	TRISL   VAR     TRISA
_TRISL           		EQU	 TRISA
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00026	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC
#define _SSPEN           	_SSPCON??5
#define _CKP             	_SSPCON??4
#define _SMP             	_SSPSTAT??7
#define _CKE             	_SSPSTAT??6
#define _SSPIF           	_PIR1??3
#define _Ce              	_PORTA??2
#define _CSN             	_PORTC??0
#define _Irq             	_PORTC??2
#define _alarm           	_PORTC??1
#define _RES             	_PORTB??5
#define _RELAY           	_PORTA??4
#define _SSPCON??5       	 SSPCON, 005h
#define _SSPCON??4       	 SSPCON, 004h
#define _SSPSTAT??7      	 SSPSTAT, 007h
#define _SSPSTAT??6      	 SSPSTAT, 006h
#define _PIR1??3         	 PIR1, 003h
#define _PORTA??2        	 PORTA, 002h
#define _PORTC??0        	 PORTC, 000h
#define _PORTC??2        	 PORTC, 002h
#define _SSPCON??0       	 SSPCON, 000h
#define _PORTC??1        	 PORTC, 001h
#define _PORTB??5        	 PORTB, 005h
#define _PORTA??4        	 PORTA, 004h
#define _val??0          	_val, 000h
#define _INTCON??2       	 INTCON, 002h
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
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00020	EEPROM  0, [40,"R","O","B","I","K",0,0,0,0,0,0,0,0,0,0]
	DE	028h
	DE	052h
	DE	04Fh
	DE	042h
	DE	049h
	DE	04Bh
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h
	DE	000h

	INCLUDE	"REMOTE~1.MAC"
	INCLUDE	"PBPPIC14.LIB"


; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00012	BANK0   $0020, $007F
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00013	BANK1   $00A0, $00EF
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00014	BANK2   $0120, $016F
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00015	EEPROM  $2100, $21FF
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00016	LIBRARY "PBPPIC14"
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00017	DEFINE  CODE_SIZE 4
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00018	DEFINE	CCP1_REG PORTC
; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00019	DEFINE	CCP1_BIT 5

; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00021	        include "PIC14EXT.BAS"

; D:\DOCUME~1\PICDEV~1\PBP\PBP260\16F690.BAS	00028	        include "PBPPIC14.RAM"

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00005	@ DEVICE PIC16F690,MCLR_OFF

	ASM?
 DEVICE PIC16F690,MCLR_OFF

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00006	@ DEVICE PIC16F690,CPD_OFF

	ASM?
 DEVICE PIC16F690,CPD_OFF

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00007	@ DEVICE PIC16F690,BOD_ON

	ASM?
 DEVICE PIC16F690,BOD_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00008	@ DEVICE PIC16F690,PWRT_ON

	ASM?
 DEVICE PIC16F690,PWRT_ON

	ENDASM?

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00020	EEPROM  0, [40,"R","O","B","I","K",0,0,0,0,0,0,0,0,0,0]

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00022	 INCLUDE "RFM70.pbp"
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00010	payloadLength con 22
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00011	payloadLengthD con 24
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00028	Idle_int con $00 'Idle no interrupt pending
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00029	Max_rt con $10 'Max # of Tx retrans interrupt
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00030	Tx_inter con $30 'Tx interrupted
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00031	Rx_ds con $40 'Rx data received
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00033	Read_reg con $00 'def read command to register
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00034	Write_reg CON $20 'def write command to register
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00035	Rd_rx_pload con $61 'def Rx payload register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00036	Wr_tx_pload con $A0 'def Tx payload register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00037	Flush_tx con $E1 'def flush Tx register command
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00038	Flush_rx con $E2 'def flush Rx register command
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00039	Reuse_tx_pl con $E3 'def reuse Tx payload register command
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00040	Nop_comm con $FF 'def No operation
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00042	Config_nrf con $00 'Config register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00043	En_aa con $01 'enable auto acknowledgment register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00044	En_rxaddr con $02 'enable RX addresses register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00045	Setup_aw con $03 'setup address width register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00046	Setup_retr con $04 'setup auto retrans register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00047	Rf_ch con $05 'RF channel register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00048	Rf_setup con $06 'RF setup register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00049	Stat_us con $07 'Status register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00050	Observe_tx con $08 'Observe TX register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00051	Cd con $09 'Carrier detect register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00052	Rx_addr_p0 con $0A 'RX address pipe0 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00053	Rx_addr_p1 con $0B 'RX address pipe1 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00054	Rx_addr_p2 con $0C 'RX address pipe2 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00055	Rx_addr_p3 con $0D 'RX address pipe3 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00056	Rx_addr_p4 con $0E 'RX address pipe4 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00057	Rx_addr_p5 con $0F 'RX address pipe5 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00058	Tx_addr con $10 'TX address register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00059	Rx_pw_p0 con $11 'RX payload width pipe0 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00060	Rx_pw_p1 con $12 'RX payload width pipe1 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00061	Rx_pw_p2 con $13 'RX payload width pipe2 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00062	Rx_pw_p3 con $14 'RX payload width pipe3 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00063	Rx_pw_p4 con $15 'RX payload width pipe4 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00064	Rx_pw_p5 con $16 'RX payload width pipe5 register address
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00065	Fifo_status con $17 'FIFO status register register address

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00067	goto endRFM70
	GOTO?L	_endRFM70

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00068	initModule:

	LABEL?L	_initModule	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00069	pause 500
	PAUSE?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00071	SSPEN = 1 'enable SPI pins
	MOVE?CT	001h, _SSPEN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00072	SSPCON.0=1 'SPI rate=OSC/16
	MOVE?CT	001h, _SSPCON??0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00073	CKP = 0 'clock idle low
	MOVE?CT	000h, _CKP

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00074	CKE = 1 'transmit on active to idle
	MOVE?CT	001h, _CKE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00075	SSPIF = 0 'clear buffer full status
	MOVE?CT	000h, _SSPIF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00076	SMP = 0 'sample in middle of data
	MOVE?CT	000h, _SMP

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00078	Ce=1 'init spi pins
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00079	pause 10 'wait 10 ms hardware is stable
	PAUSE?C	00Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00080	Ce=0 'set CE pin low disable Rx
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00081	CSN=0 'set CSN pin low
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00082	Pack_count=0 'number of packets sent
	MOVE?CW	000h, _Pack_count

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00083	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00085	commonRXTX:

	LABEL?L	_commonRXTX	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00086	data_out[0]=Write_reg+Rx_addr_p0 'Rx address for pipe0
	MOVE?CB	02Ah, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00087	READ 1, data_out[1]
	READADDRESS?C	001h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00088	READ 2, data_out[2]
	READADDRESS?C	002h
	READ?B	_data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00089	READ 3, data_out[3]
	READADDRESS?C	003h
	READ?B	_data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00090	READ 4, data_out[4]
	READADDRESS?C	004h
	READ?B	_data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00091	READ 5, data_out[5]
	READADDRESS?C	005h
	READ?B	_data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00092	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00093	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00094	data_out[0]=Write_reg+En_aa 'enable auto ACK pipe0
	MOVE?CB	021h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00095	data_out[1]=$01 '1 enable, 0 disable
	MOVE?CB	001h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00096	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00097	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00098	data_out[0]=Write_reg+En_rxaddr 'enable Rx address pipe0
	MOVE?CB	022h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00099	data_out[1]=$01
	MOVE?CB	001h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00100	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00101	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00102	data_out[0]=Write_reg+Rf_ch 'Set RF channel
	MOVE?CB	025h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00103	READ 0, data_out[1] 'number of channel used
	READADDRESS?C	000h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00104	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00105	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00106	data_out[0]=Write_reg+Rx_pw_p0 'Set Rx pload width pipe0
	MOVE?CB	031h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00107	data_out[1]=payloadLength 'number of bytes used in data sent
	MOVE?CB	_payloadLength, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00108	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00109	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00110	data_out[0]=Write_reg+Rf_setup 'Set RF: 'Set RF:5dbm, 1Mbps
	MOVE?CB	026h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00111	data_out[1]=%00110111
	MOVE?CB	037h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00112	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00113	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00115	temp_byte_rfm = 1
	MOVE?CB	001h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00116	gosub setBank
	GOSUB?L	_setBank

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	000h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	040h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	001h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	0E2h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00118	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	001h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	0C0h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00120	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0D0h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0FCh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	08Ch, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00122	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	003h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	099h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	000h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	039h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	041h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00124	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00125	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	004h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00125	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	0B9h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00125	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	09Eh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00125	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	086h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00125	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	00Bh, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00126	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00127	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	005h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00127	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	024h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00127	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	006h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00127	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	07Fh, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00127	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	0A6h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00128	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00129	for k = 6 TO 11
	MOVE?CB	006h, _k
	LABEL?L	L00003	
	CMPGT?BCL	_k, 00Bh, L00004

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00130	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?BB	_k, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00130	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00130	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00130	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00130	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00131	    gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00132	next k
	NEXT?BCL	_k, 001h, L00003
	LABEL?L	L00004	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00133	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	00Ch, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00133	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00133	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	012h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00133	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	073h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00133	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00134	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00135	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	00Dh, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00135	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	036h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00135	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	0B4h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00135	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	080h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00135	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00136	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00137	data_out[0]=Write_reg+$0E
	MOVE?CB	02Eh, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00138	data_out[1]=$41
	MOVE?CB	041h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00139	data_out[2]=$20
	MOVE?CB	020h, _data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00140	data_out[3]=$08
	MOVE?CB	008h, _data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00141	data_out[4]=$04
	MOVE?CB	004h, _data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00142	data_out[5]=$81
	MOVE?CB	081h, _data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00143	data_out[6]=$20
	MOVE?CB	020h, _data_out + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00144	data_out[7]=$CF
	MOVE?CB	0CFh, _data_out + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00145	data_out[8]=$F7
	MOVE?CB	0F7h, _data_out + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00146	data_out[9]=$FE
	MOVE?CB	0FEh, _data_out + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00147	data_out[10]=$FF
	MOVE?CB	0FFh, _data_out + 0000Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00148	data_out[11]=$FF
	MOVE?CB	0FFh, _data_out + 0000Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00149	num_byte=11
	MOVE?CB	00Bh, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00150	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00151	temp_byte_rfm = 0
	MOVE?CB	000h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00152	gosub setBank
	GOSUB?L	_setBank

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00153	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00155	setBank:

	LABEL?L	_setBank	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00156	data_out[0]=Read_reg+$07
	MOVE?CB	007h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00157	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00158	gosub spi_read
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00159	if (temp_byte_rfm != (data_in[0] & $80)) then
	AND?BCW	_data_in, 080h, T1
	CMPEQ?BWL	_temp_byte_rfm, T1, L00005

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00161	    data_out[0]=$50
	MOVE?CB	050h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00162	    data_out[1]=$53    
	MOVE?CB	053h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00163	    num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00164	    gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00165	endif
	LABEL?L	L00005	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00166	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00168	conf4bytes:

	LABEL?L	_conf4bytes	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00169	data_out[0]=Write_reg+temp_byte_rfm
	ADD?CBB	_Write_reg, _temp_byte_rfm, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00170	data_out[1]=temp1_byte_rfm
	MOVE?BB	_temp1_byte_rfm, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00171	data_out[2]=temp2_byte_rfm
	MOVE?BB	_temp2_byte_rfm, _data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00172	data_out[3]=temp3_byte_rfm
	MOVE?BB	_temp3_byte_rfm, _data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00173	data_out[4]=temp4_byte_rfm
	MOVE?BB	_temp4_byte_rfm, _data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00174	num_byte=4
	MOVE?CB	004h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00175	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00176	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00178	sendData:

	LABEL?L	_sendData	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00179	pause 30
	PAUSE?C	01Eh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00180	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00181	data_out[0]=Flush_tx 'flush TX_fifo buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00182	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00183	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00184	data_out[0]=Write_reg+Stat_us 'reset IRQ bits
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00185	data_out[1]=%00110000
	MOVE?CB	030h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00186	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00187	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00188	gosub setup_tx 'setup Tx
	GOSUB?L	_setup_tx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00189	data_out[0]=Wr_tx_pload 'put 10 bytes data in Tx pload buffer
	MOVE?CB	_Wr_tx_pload, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00190	data_out[1]=device_id
	MOVE?BB	_device_id, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00191	for w = 2 to payloadLength+1
	MOVE?CB	002h, _w
	LABEL?L	L00007	
	CMPGT?BCL	_w, 017h, L00008

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00192	    data_out[w]=temp_data[w-2]
	SUB?BCW	_w, 002h, T1
	AOUT?BWB	_temp_data, T1, T1
	AIN?BBB	T1, _data_out, _w

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00193	    if data_out[w] == 10 then contSendX1
	AOUT?BBB	_data_out, _w, T1
	CMPEQ?BCL	T1, 00Ah, _contSendX1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00194	next w
	NEXT?BCL	_w, 001h, L00007
	LABEL?L	L00008	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00195	:contSendX1

	LABEL?L	_contSendX1	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00196	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00197	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00198	pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00199	Ce=1 'CE=1 (toggle) transmit FIFO buffer
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00200	Pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00201	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00202	Pause 1
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00203	trans_irq:

	LABEL?L	_trans_irq	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00204	If Irq !=0 then trans_irq 'wait until IRQ, active low
	CMPNE?TCL	_Irq, 000h, _trans_irq

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00205	data_out[0]=Stat_us 'read status register
	MOVE?CB	_Stat_us, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00206	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00207	gosub spi_read
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00208	val=data_in[0]&%01110000 'mask the IRQ bits STATUS byte
	AND?BCB	_data_in, 070h, _val

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00209	if (val = Max_rt) then gosub max_retry 'maximum TX retries
	CMPNE?BCL	_val, _Max_rt, L00009
	GOSUB?L	_max_retry
	LABEL?L	L00009	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00210	if (val = Tx_inter) then gosub tx_int 'Tx interrupted
	CMPNE?BCL	_val, _Tx_inter, L00011
	GOSUB?L	_tx_int
	LABEL?L	L00011	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00211	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00212	data_out[1]=%00100000 'clear TX_DS IRQ bit
	MOVE?CB	020h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00213	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00214	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00215	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00216	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00219	debounce:

	LABEL?L	_debounce	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00220	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00221	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00222	Ce=1
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00223	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00224	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00225	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00226	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00228	spi_write:

	LABEL?L	_spi_write	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00229	CSN=0
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00230	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00013	
	CMPGT?BBL	_w, _num_byte, L00014

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00231	SSPBUF=data_out[w] 'send array variable
	AOUT?BBB	_data_out, _w, SSPBUF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00232	GoSub buffer_ok 'wait until buffer ready
	GOSUB?L	_buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00233	Next w 'next location
	NEXT?BCL	_w, 001h, L00013
	LABEL?L	L00014	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00234	CSN=1
	MOVE?CT	001h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00235	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00237	spi_read:

	LABEL?L	_spi_read	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00238	CSN=0
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00239	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00015	
	CMPGT?BBL	_w, _num_byte, L00016

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00240	    SSPBUF = data_out[0] 'write to SSPBUF to start clock
	MOVE?BB	_data_out, SSPBUF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00241	    GoSub buffer_ok 'wait for receipt
	GOSUB?L	_buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00242	data_in[w] = SSPBUF 'store received character in array
	AIN?BBB	SSPBUF, _data_in, _w

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00243	Next w 'get next byte
	NEXT?BCL	_w, 001h, L00015
	LABEL?L	L00016	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00244	CSN=1
	MOVE?CT	001h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00245	Return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00246	buffer_ok:

	LABEL?L	_buffer_ok	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00247	IF SSPIF = 0 Then buffer_ok 'wait for SPI interupt flag
	CMPEQ?TCL	_SSPIF, 000h, _buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00248	SSPIF = 0 'reset flag
	MOVE?CT	000h, _SSPIF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00249	Return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00251	max_retry:

	LABEL?L	_max_retry	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00252	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00253	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00254	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00255	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00256	data_out[1]=%00010000 'clear MAX_RT IRQ bit
	MOVE?CB	010h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00257	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00258	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00259	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00261	tx_int:

	LABEL?L	_tx_int	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00262	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00263	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00264	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00265	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00266	data_out[1]=%00110000 'clear TX_DS & MAX_RT IRQ bit
	MOVE?CB	030h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00267	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00268	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00269	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00271	setup_rx:

	LABEL?L	_setup_rx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00272	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00273	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00274	data_out[1]=$0F
	MOVE?CB	00Fh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00275	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00276	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00277	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00278	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00280	setup_sleep:

	LABEL?L	_setup_sleep	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00281	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=0, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00282	data_out[1]=%00001101
	MOVE?CB	00Dh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00283	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00284	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00285	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00287	setup_tx:

	LABEL?L	_setup_tx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00288	data_out[0]=Write_reg+Tx_addr 'Tx address
	MOVE?CB	030h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00289	READ 1, data_out[1]
	READADDRESS?C	001h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00290	READ 2, data_out[2]
	READADDRESS?C	002h
	READ?B	_data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00291	READ 3, data_out[3]
	READADDRESS?C	003h
	READ?B	_data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00292	READ 4, data_out[4]
	READADDRESS?C	004h
	READ?B	_data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00293	READ 5, data_out[5]
	READADDRESS?C	005h
	READ?B	_data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00294	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00295	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00296	data_out[0]= Write_reg+Setup_retr 'Set retransmit @ ACK
	MOVE?CB	024h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00297	data_out[1]= %00110101 '3x re-transmit (default)
	MOVE?CB	035h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00298	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00299	Gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00300	data_out[0]=Write_reg+Config_nrf 'Config:PRX=0,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00301	data_out[1]=$0E
	MOVE?CB	00Eh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00302	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00303	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00304	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00305	:endRFM70

	LABEL?L	_endRFM70	
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00024	 DEFINE OSC 8

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00026	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00027	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00028	 ANSELH = 0
	MOVE?CB	000h, ANSELH

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00029	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00030	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00033	INTCON = %10100000
	MOVE?CB	0A0h, INTCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00034	PIE1 = %00000000
	MOVE?CB	000h, PIE1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00035	OPTION_REG = %00000111
	MOVE?CB	007h, OPTION_REG

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00037	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00038	ENABLE
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00041	TRISA = %00000000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	000h, TRISA

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00042	TRISB = %00110000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	030h, TRISB

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00043	TRISC = %00000110 'Set IRQ input, 
	ICALL?L	L00001
	MOVE?CB	006h, TRISC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00044	WPUA = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUA

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00045	WPUB = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUB

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00072	clear
	ICALL?L	L00001
	CLEAR?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00073	startLabel:

	LABEL?L	_startLabel	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00074	read 7, device_id
	ICALL?L	L00001
	READADDRESS?C	007h
	READ?B	_device_id

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00075	read 9, l1onAlarm
	ICALL?L	L00001
	READADDRESS?C	009h
	READ?B	_l1onAlarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00076	input alarm
	ICALL?L	L00001
	INPUT?T	_alarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00077	input RES
	ICALL?L	L00001
	INPUT?T	_RES

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00078	output relay
	ICALL?L	L00001
	OUTPUT?T	_RELAY

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00079	read 6, temp_byte
	ICALL?L	L00001
	READADDRESS?C	006h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00080	if (temp_byte == 0) then 
	ICALL?L	L00001
	CMPNE?BCL	_temp_byte, 000h, L00017

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00081	    gosub highRelay
	ICALL?L	L00001
	GOSUB?L	_highRelay

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00082	else
	ICALL?L	L00001
	GOTO?L	L00018
	LABEL?L	L00017	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00083	    gosub lowrelay
	ICALL?L	L00001
	GOSUB?L	_lowrelay

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00084	endif
	ICALL?L	L00001
	LABEL?L	L00018	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00085	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00086	commonSettings:

	LABEL?L	_commonSettings	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00087	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00090	Main_rx:

	LABEL?L	_Main_rx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00091	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00092	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00093	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00094	irqLoop:

	LABEL?L	_irqLoop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00096	if RES == 0 then
	ICALL?L	L00001
	CMPNE?TCL	_RES, 000h, L00019

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00097	    write 0, 40
	ICALL?L	L00001
	WRITEADDRESS?C	000h
	WRITE?C	028h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00098	    write 1, "R"
	ICALL?L	L00001
	WRITEADDRESS?C	001h
	WRITE?C	052h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00099	    write 2, "O"
	ICALL?L	L00001
	WRITEADDRESS?C	002h
	WRITE?C	04Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00100	    write 3, "B"
	ICALL?L	L00001
	WRITEADDRESS?C	003h
	WRITE?C	042h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00101	    write 4, "I"
	ICALL?L	L00001
	WRITEADDRESS?C	004h
	WRITE?C	049h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00102	    write 5, "K"
	ICALL?L	L00001
	WRITEADDRESS?C	005h
	WRITE?C	04Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00103	    write 6, 0
	ICALL?L	L00001
	WRITEADDRESS?C	006h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00104	    write 7, 0
	ICALL?L	L00001
	WRITEADDRESS?C	007h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00105	    write 8, 0
	ICALL?L	L00001
	WRITEADDRESS?C	008h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00106	    write 9, 0
	ICALL?L	L00001
	WRITEADDRESS?C	009h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00107	    write 10, 0
	ICALL?L	L00001
	WRITEADDRESS?C	00Ah
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00108	    write 11, 0
	ICALL?L	L00001
	WRITEADDRESS?C	00Bh
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00109	    pause 2000
	ICALL?L	L00001
	PAUSE?C	007D0h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00110	    goto startLabel
	ICALL?L	L00001
	GOTO?L	_startLabel

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00111	endif
	ICALL?L	L00001
	LABEL?L	L00019	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00112	if (temp_data[0] != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_data, 000h, L00021

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00113	    if (configure == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_configure, 001h, L00023

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00114	        gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00115	        configure = 0
	ICALL?L	L00001
	MOVE?CB	000h, _configure

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00116	    endif
	ICALL?L	L00001
	LABEL?L	L00023	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00117	    gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00118	    temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00119	    GOTO main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00120	endif
	ICALL?L	L00001
	LABEL?L	L00021	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00122	if (ALSTATUS == 5) then
	ICALL?L	L00001
	CMPNE?BCL	_ALSTATUS, 005h, L00025

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00123	    ALSTATUS = 2
	ICALL?L	L00001
	MOVE?CB	002h, _ALSTATUS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00124	    temp_data[0] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00125	    temp_data[1] = "L"
	ICALL?L	L00001
	MOVE?CB	04Ch, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00126	    temp_data[2] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00127	    temp_data[3] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00128	    temp_data[4] = "M"
	ICALL?L	L00001
	MOVE?CB	04Dh, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00129	    temp_data[5] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00130	    temp_data[6] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00131	endif
	ICALL?L	L00001
	LABEL?L	L00025	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00132	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00133	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00134	lop:

	LABEL?L	_lop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00135	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	ICALL?L	L00001
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00136	num_byte=payloadLength
	ICALL?L	L00001
	MOVE?CB	_payloadLength, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00137	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00138	read 7, temp_byte
	ICALL?L	L00001
	READADDRESS?C	007h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00139	temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00140	if (data_in[1] == temp_byte) then
	ICALL?L	L00001
	CMPNE?BBL	_data_in + 00001h, _temp_byte, L00027

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00141	    if (data_in[2] == "c") then    
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 063h, L00029

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00142	        if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00031

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00144	            write 0, data_in[9] 'channel
	ICALL?L	L00001
	WRITEADDRESS?C	000h
	WRITE?B	_data_in + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00145	            write 1, data_in[4] 'password 0
	ICALL?L	L00001
	WRITEADDRESS?C	001h
	WRITE?B	_data_in + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00146	            write 2, data_in[5] 'password 1
	ICALL?L	L00001
	WRITEADDRESS?C	002h
	WRITE?B	_data_in + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00147	            write 3, data_in[6] 'password 2
	ICALL?L	L00001
	WRITEADDRESS?C	003h
	WRITE?B	_data_in + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00148	            write 4, data_in[7] 'password 3
	ICALL?L	L00001
	WRITEADDRESS?C	004h
	WRITE?B	_data_in + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00149	            write 5, data_in[8] 'password 4
	ICALL?L	L00001
	WRITEADDRESS?C	005h
	WRITE?B	_data_in + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00150	            write 7, data_in[10]'device id
	ICALL?L	L00001
	WRITEADDRESS?C	007h
	WRITE?B	_data_in + 0000Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00151	            pause 10
	ICALL?L	L00001
	PAUSE?C	00Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00152	            device_id = data_in[10]
	ICALL?L	L00001
	MOVE?BB	_data_in + 0000Ah, _device_id

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00153	            configure = 1
	ICALL?L	L00001
	MOVE?CB	001h, _configure

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00154	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00155	        endif
	ICALL?L	L00001
	LABEL?L	L00031	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00156	    endif
	ICALL?L	L00001
	LABEL?L	L00029	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00157	    if (data_in[2] == "l") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 06Ch, L00033

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00158	        if (data_in[3] == "1") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 031h, L00035

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00159	            if (data_in[4] == "c") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00004h, 063h, L00037

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00160	                if (data_in[5] == "o") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00005h, 06Fh, L00039

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00161	                    write 6, 0
	ICALL?L	L00001
	WRITEADDRESS?C	006h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00162	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00163	                endif
	ICALL?L	L00001
	LABEL?L	L00039	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00164	                if (data_in[5] == "f") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00005h, 066h, L00041

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00165	                    write 6, 1
	ICALL?L	L00001
	WRITEADDRESS?C	006h
	WRITE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00166	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00167	                endif
	ICALL?L	L00001
	LABEL?L	L00041	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00168	                if (data_in[5] == "d") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00005h, 064h, L00043

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00169	                    write 9, 1
	ICALL?L	L00001
	WRITEADDRESS?C	009h
	WRITE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00170	                    l1onAlarm = 1
	ICALL?L	L00001
	MOVE?CB	001h, _l1onAlarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00171	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00172	                endif
	ICALL?L	L00001
	LABEL?L	L00043	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00173	                if (data_in[5] == "c") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00005h, 063h, L00045

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00174	                    write 9, 0
	ICALL?L	L00001
	WRITEADDRESS?C	009h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00175	                    l1onAlarm = 0
	ICALL?L	L00001
	MOVE?CB	000h, _l1onAlarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00176	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00177	                endif                
	ICALL?L	L00001
	LABEL?L	L00045	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00178	                if (data_in[5] == "t") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00005h, 074h, L00047

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00179	                    if (data_in[6] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00006h, 03Dh, L00049

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00180	                        i = 7
	ICALL?L	L00001
	MOVE?CB	007h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00181	                        gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00182	                        if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00051

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00183	                            write 8, temp_byte
	ICALL?L	L00001
	WRITEADDRESS?C	008h
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00184	                            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00185	                        else
	ICALL?L	L00001
	GOTO?L	L00052
	LABEL?L	L00051	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00186	                            gosub sendDataError
	ICALL?L	L00001
	GOSUB?L	_sendDataError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00187	                        endif
	ICALL?L	L00001
	LABEL?L	L00052	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00188	                    endif
	ICALL?L	L00001
	LABEL?L	L00049	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00189	                endif                
	ICALL?L	L00001
	LABEL?L	L00047	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00190	            endif
	ICALL?L	L00001
	LABEL?L	L00037	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00191	            if (data_in[4] == "o") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00004h, 06Fh, L00053

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00192	                if (data_in[5] == "f") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00005h, 066h, L00055

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00193	                    seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00194	                    read 8, l1counter
	ICALL?L	L00001
	READADDRESS?C	008h
	READ?B	_l1counter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00195	                    gosub highRelay
	ICALL?L	L00001
	GOSUB?L	_highRelay

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00196	                else
	ICALL?L	L00001
	GOTO?L	L00056
	LABEL?L	L00055	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00197	                    gosub highRelay
	ICALL?L	L00001
	GOSUB?L	_highRelay

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00198	                    l1counter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _l1counter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00199	                endif
	ICALL?L	L00001
	LABEL?L	L00056	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00200	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00201	            endif
	ICALL?L	L00001
	LABEL?L	L00053	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00202	            if (data_in[4] == "f") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00004h, 066h, L00057

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00203	                gosub LOWrelay
	ICALL?L	L00001
	GOSUB?L	_lowrelay

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00204	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00205	            endif
	ICALL?L	L00001
	LABEL?L	L00057	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00206	        endif
	ICALL?L	L00001
	LABEL?L	L00035	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00207	    endif
	ICALL?L	L00001
	LABEL?L	L00033	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00208	    if (data_in[2] == "a") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 061h, L00059

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00209	        if (data_in[3] == "l") then 
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 06Ch, L00061

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00210	            if (data_in[4] == "a") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00004h, 061h, L00063

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00211	                read 11, ALLeaveCounter
	ICALL?L	L00001
	READADDRESS?C	00Bh
	READ?B	_ALLeaveCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00212	                ALEnterCounter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ALEnterCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00213	                if (ALLeaveCounter == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_ALLeaveCounter, 000h, L00065

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00214	                    alstatus = 1
	ICALL?L	L00001
	MOVE?CB	001h, _ALSTATUS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00215	                else
	ICALL?L	L00001
	GOTO?L	L00066
	LABEL?L	L00065	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00216	                    alstatus = 3
	ICALL?L	L00001
	MOVE?CB	003h, _ALSTATUS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00217	                endif
	ICALL?L	L00001
	LABEL?L	L00066	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00218	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00219	            endif
	ICALL?L	L00001
	LABEL?L	L00063	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00220	            if (data_in[4] == "d") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00004h, 064h, L00067

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00221	                alstatus = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ALSTATUS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00222	                ALLeaveCounter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ALLeaveCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00223	                ALEnterCounter = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ALEnterCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00224	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00225	            endif
	ICALL?L	L00001
	LABEL?L	L00067	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00226	            if (data_in[4] == "c") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00004h, 063h, L00069

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00227	                if (data_in[6] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00006h, 03Dh, L00071

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00228	                    i = 7
	ICALL?L	L00001
	MOVE?CB	007h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00229	                    gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00230	                    if (conversionSuccess == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00073

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00231	                        if (data_in[5] == "e") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00005h, 065h, L00075

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00232	                            write 10, temp_byte
	ICALL?L	L00001
	WRITEADDRESS?C	00Ah
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00233	                            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00234	                        endif
	ICALL?L	L00001
	LABEL?L	L00075	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00235	                        if (data_in[5] == "l") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00005h, 06Ch, L00077

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00236	                            write 11, temp_byte
	ICALL?L	L00001
	WRITEADDRESS?C	00Bh
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00237	                            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00238	                        endif
	ICALL?L	L00001
	LABEL?L	L00077	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00239	                    endif
	ICALL?L	L00001
	LABEL?L	L00073	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00240	                endif
	ICALL?L	L00001
	LABEL?L	L00071	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00241	            endif
	ICALL?L	L00001
	LABEL?L	L00069	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00242	        endif
	ICALL?L	L00001
	LABEL?L	L00061	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00243	    endif
	ICALL?L	L00001
	LABEL?L	L00059	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00244	    if (data_in[2] == "s") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 073h, L00079

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00245	        if (data_in[3] == "a") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 061h, L00081

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00246	            temp_data[0] = "1"
	ICALL?L	L00001
	MOVE?CB	031h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00247	            temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00248	            temp_data[2] = "a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00249	            temp_data[3] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00250	            temp_data[4] = ALSTATUS + $30
	ICALL?L	L00001
	ADD?BCB	_ALSTATUS, 030h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00251	            temp_data[5] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00252	            temp_data[6] = alarm + $30
	ICALL?L	L00001
	ADD?TCB	_alarm, 030h, _temp_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00253	            temp_data[7] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00254	            read 10, temp_byte 
	ICALL?L	L00001
	READADDRESS?C	00Ah
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00255	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00256	            temp_data[8] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00257	            temp_data[9] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00258	            temp_data[10] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 0000Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00259	            temp_data[11] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 0000Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00260	            read 11, temp_byte 
	ICALL?L	L00001
	READADDRESS?C	00Bh
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00261	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00262	            temp_data[12] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 0000Ch

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00263	            temp_data[13] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 0000Dh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00264	            temp_data[14] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 0000Eh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00265	            temp_data[15] = 13            
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 0000Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00266	            temp_data[16] = 10            
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00010h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00267	        endif
	ICALL?L	L00001
	LABEL?L	L00081	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00268	        if (data_in[3] == "c") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 063h, L00083

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00269	            temp_data[0] = "1"
	ICALL?L	L00001
	MOVE?CB	031h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00270	            temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00271	            temp_data[2] = "c"
	ICALL?L	L00001
	MOVE?CB	063h, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00272	            temp_data[3] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00273	            temp_data[4] = RELAY + $30
	ICALL?L	L00001
	ADD?TCB	_RELAY, 030h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00274	            temp_data[5] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00275	            read 6, temp_data[6]
	ICALL?L	L00001
	READADDRESS?C	006h
	READ?B	_temp_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00276	            temp_data[6] = temp_data[6] + $30        
	ICALL?L	L00001
	ADD?BCB	_temp_data + 00006h, 030h, _temp_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00277	            temp_data[7] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00278	            read 9, temp_data[8]
	ICALL?L	L00001
	READADDRESS?C	009h
	READ?B	_temp_data + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00279	            temp_data[8] = temp_data[8] + $30        
	ICALL?L	L00001
	ADD?BCB	_temp_data + 00008h, 030h, _temp_data + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00280	            temp_data[9] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00281	            read 8, temp_byte
	ICALL?L	L00001
	READADDRESS?C	008h
	READ?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00282	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00283	            temp_data[10] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 0000Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00284	            temp_data[11] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 0000Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00285	            temp_data[12] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 0000Ch

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00286	            temp_data[13] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 0000Dh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00287	            temp_byte = l1counter
	ICALL?L	L00001
	MOVE?BB	_l1counter, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00288	            gosub convertNoToStr
	ICALL?L	L00001
	GOSUB?L	_convertNoToStr

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00289	            temp_data[14] = temp3_byte
	ICALL?L	L00001
	MOVE?BB	_temp3_byte, _temp_data + 0000Eh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00290	            temp_data[15] = temp2_byte
	ICALL?L	L00001
	MOVE?BB	_temp2_byte, _temp_data + 0000Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00291	            temp_data[16] = temp1_byte
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_data + 00010h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00292	            temp_data[17] = 13    
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00011h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00293	            temp_data[18] = 10    
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00012h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00294	        endif
	ICALL?L	L00001
	LABEL?L	L00083	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00295	    endif
	ICALL?L	L00001
	LABEL?L	L00079	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00296	    if (data_in[2] == "p") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 070h, L00085

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00297	            if (data_in[3] == "n") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 06Eh, L00087

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00298	                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00299	            endif
	ICALL?L	L00001
	LABEL?L	L00087	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00300	    endif
	ICALL?L	L00001
	LABEL?L	L00085	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00301	    if (temp_data[0] == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp_data, 000h, L00089

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00302	        gosub sendDataError
	ICALL?L	L00001
	GOSUB?L	_sendDataError

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00303	    endif
	ICALL?L	L00001
	LABEL?L	L00089	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00304	endif
	ICALL?L	L00001
	LABEL?L	L00027	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00306	data_out[0]=Fifo_status 'Read FIFO status
	ICALL?L	L00001
	MOVE?CB	_Fifo_status, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00307	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00308	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00309	val= data_in[1] 'FIFO status register
	ICALL?L	L00001
	MOVE?BB	_data_in + 00001h, _val

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00310	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	ICALL?L	L00001
	CMPEQ?TCL	_val??0, 000h, _lop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00311	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	ICALL?L	L00001
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00312	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	ICALL?L	L00001
	MOVE?CB	040h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00313	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00314	gosub spi_write
	ICALL?L	L00001
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00315	pause 2 'wait 2ms Rx<->Tx
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00316	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00317	end
	ICALL?L	L00001
	END?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00319	disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00320	intManagement:

	LABEL?L	_intManagement	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00321	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON??2, 001h, L00091

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00322	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00323	           If ticks < 31 Then tiexit
	CMPLT?BCL	_ticks, 01Fh, _tiexit

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00324	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00325	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00326	           if (ALEnterCounter > 0) then
	CMPLE?BCL	_ALEnterCounter, 000h, L00093

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00327	                ALEnterCounter = ALEnterCounter - 1
	SUB?BCB	_ALEnterCounter, 001h, _ALEnterCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00328	                if (ALEnterCounter == 0) && (alstatus == 4) then
	CMPEQ?BCB	_ALEnterCounter, 000h, T1
	CMPEQ?BCB	_ALSTATUS, 004h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00095

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00329	                      alstatus = 5                      
	MOVE?CB	005h, _ALSTATUS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00330	                endif
	LABEL?L	L00095	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00331	           endif
	LABEL?L	L00093	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00332	           if (ALLeaveCounter > 0) then
	CMPLE?BCL	_ALLeaveCounter, 000h, L00097

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00333	               ALLeaveCounter = ALLeaveCounter - 1
	SUB?BCB	_ALLeaveCounter, 001h, _ALLeaveCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00334	               if (ALLeaveCounter == 0) && (alstatus == 3) then
	CMPEQ?BCB	_ALLeaveCounter, 000h, T1
	CMPEQ?BCB	_ALSTATUS, 003h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00099

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00335	                    alstatus = 1
	MOVE?CB	001h, _ALSTATUS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00336	               endif 
	LABEL?L	L00099	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00337	           endif
	LABEL?L	L00097	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00338	           if (alarm == 1) THEN
	CMPNE?TCL	_alarm, 001h, L00101

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00339	               if (alarmCounter > 0) then
	CMPLE?BCL	_alarmCounter, 000h, L00103

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00340	                    if (ALSTATUS == 1) then
	CMPNE?BCL	_ALSTATUS, 001h, L00105

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00342	                        READ 10, ALEnterCounter
	READADDRESS?C	00Ah
	READ?B	_ALEnterCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00343	                        if (ALEnterCounter == 0) then
	CMPNE?BCL	_ALEnterCounter, 000h, L00107

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00344	                            ALSTATUS = 5
	MOVE?CB	005h, _ALSTATUS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00345	                        else
	GOTO?L	L00108
	LABEL?L	L00107	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00346	                            ALSTATUS = 4
	MOVE?CB	004h, _ALSTATUS

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00347	                        endif
	LABEL?L	L00108	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00348	                    endif
	LABEL?L	L00105	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00349	                    if (l1onAlarm = 1) then
	CMPNE?BCL	_l1onAlarm, 001h, L00109

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00350	                        seconds = 0
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00351	                        read 8, l1counter
	READADDRESS?C	008h
	READ?B	_l1counter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00352	                        gosub highRelay
	GOSUB?L	_highRelay

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00353	                    endif                    
	LABEL?L	L00109	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00354	                    alarmCounter = 0
	MOVE?CB	000h, _alarmCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00355	               else
	GOTO?L	L00104
	LABEL?L	L00103	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00356	                    alarmCounter = alarmCounter + 1
	ADD?BCB	_alarmCounter, 001h, _alarmCounter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00357	               endif
	LABEL?L	L00104	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00358	           endif
	LABEL?L	L00101	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00359	           if (relay_alarm_counter > 0) then
	CMPLE?BCL	_relay_alarm_counter, 000h, L00111

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00360	               relay_alarm_counter = relay_alarm_counter - 1
	SUB?BCB	_relay_alarm_counter, 001h, _relay_alarm_counter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00361	               if (relay_alarm_counter == 0) then
	CMPNE?BCL	_relay_alarm_counter, 000h, L00113

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00362	                    input alarm
	INPUT?T	_alarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00363	               endif 
	LABEL?L	L00113	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00364	           endif
	LABEL?L	L00111	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00365	           if seconds <= 58 then tiexit
	CMPLE?BCL	_seconds, 03Ah, _tiexit

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00366	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00367	           if (l1counter > 0) then
	CMPLE?BCL	_l1counter, 000h, L00115

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00368	               l1counter = l1counter - 1
	SUB?BCB	_l1counter, 001h, _l1counter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00369	               if (l1counter == 0) then
	CMPNE?BCL	_l1counter, 000h, L00117

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00370	                    gosub lowrelay
	GOSUB?L	_lowrelay

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00371	               endif
	LABEL?L	L00117	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00372	           endif           
	LABEL?L	L00115	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00373	           tiexit: 

	LABEL?L	_tiexit	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00374	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON??2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00375	        endif
	LABEL?L	L00091	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00376	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON??7

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00377	resume
	RESUME?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00378	enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00380	sendDataOK:

	LABEL?L	_sendDataOK	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00381	    temp_data[0] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00382	    temp_data[1] = "K"
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00383	    temp_data[2] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00384	    temp_data[3] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00385	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00387	sendDataError:

	LABEL?L	_sendDataError	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00388	        temp_data[0] = "E"
	ICALL?L	L00001
	MOVE?CB	045h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00389	        temp_data[1] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00390	        temp_data[2] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00391	        temp_data[3] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00392	        temp_data[4] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00393	        temp_data[5] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00394	        temp_data[6] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00395	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00397	convertInputData:

	LABEL?L	_convertInputData	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00398	    conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00399	    TEMP_BYTE="a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00400	    for k=0 to 2    
	ICALL?L	L00001
	MOVE?CB	000h, _k
	LABEL?L	L00119	
	CMPGT?BCL	_k, 002h, L00120

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00401	        TEMP1_BYTE = "a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp1_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00402	        TEMP2_BYTE = data_in[i]
	ICALL?L	L00001
	AOUT?BBB	_data_in, _i, _temp2_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00403	        if (TEMP2_BYTE == "|") then return
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 07Ch, L00121
	RETURN?	
	LABEL?L	L00121	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00404	        GOSUB lookupChar
	ICALL?L	L00001
	GOSUB?L	_lookupChar

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00405	        if (TEMP1_BYTE == "a") then return 
	ICALL?L	L00001
	CMPNE?BCL	_temp1_byte, 061h, L00123
	RETURN?	
	LABEL?L	L00123	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00406	        if (k==0) then 
	ICALL?L	L00001
	CMPNE?BCL	_k, 000h, L00125

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00407	            TEMP_BYTE = TEMP1_BYTE 
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00408	            conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00409	        else 
	ICALL?L	L00001
	GOTO?L	L00126
	LABEL?L	L00125	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00410	            TEMP_BYTE = TEMP_BYTE*10 + TEMP1_BYTE 
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 00Ah, T1
	ADD?WBB	T1, _temp1_byte, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00411	            conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00412	        endif
	ICALL?L	L00001
	LABEL?L	L00126	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00413	        i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00414	    next k
	ICALL?L	L00001
	NEXT?BCL	_k, 001h, L00119
	LABEL?L	L00120	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00415	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00417	lookupChar:

	LABEL?L	_lookupChar	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00418	    LOOKDOWN temp2_byte,["0123456789"], temp1_byte
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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00419	RETURN
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00421	convertNoToStr:

	LABEL?L	_convertNoToStr	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00422	        temp3_byte = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCB	T1, 030h, _temp3_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00423	        temp2_byte = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCB	T1, 030h, _temp2_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00424	        temp1_byte = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCB	T1, 030h, _temp1_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00425	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00427	highRelay:

	LABEL?L	_highRelay	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00428	if (relay == 0) then
	ICALL?L	L00001
	CMPNE?TCL	_RELAY, 000h, L00127

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00429	    relay_alarm_counter = 4
	ICALL?L	L00001
	MOVE?CB	004h, _relay_alarm_counter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00430	    output alarm
	ICALL?L	L00001
	OUTPUT?T	_alarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00431	    low alarm
	ICALL?L	L00001
	LOW?T	_alarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00432	    high relay
	ICALL?L	L00001
	HIGH?T	_RELAY

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00433	endif
	ICALL?L	L00001
	LABEL?L	L00127	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00434	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00436	lowRelay:

	LABEL?L	_lowrelay	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00437	if (relay == 1) then
	ICALL?L	L00001
	CMPNE?TCL	_RELAY, 001h, L00129

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00438	    relay_alarm_counter = 4
	ICALL?L	L00001
	MOVE?CB	004h, _relay_alarm_counter

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00439	    output alarm
	ICALL?L	L00001
	OUTPUT?T	_alarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00440	    low alarm
	ICALL?L	L00001
	LOW?T	_alarm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00441	    low relay
	ICALL?L	L00001
	LOW?T	_RELAY

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00442	endif
	ICALL?L	L00001
	LABEL?L	L00129	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\REMOTE~1.PBP	00443	return
	ICALL?L	L00001
	RETURN?	

	END
