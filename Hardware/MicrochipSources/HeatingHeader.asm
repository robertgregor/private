
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
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00024	 DEFINE OSC 8
#define		OSC		 8
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00026	 DEFINE ADC_BITS 10 ' ADCIN resolution (Bits)
#define		ADC_BITS		 10 
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00027	 DEFINE ADC_CLOCK 3 ' ADC clock source (Fosc/32)
#define		ADC_CLOCK		 3 
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00028	 DEFINE ADC_SAMPLEUS 50 ' ADC sampling time (uSec)
#define		ADC_SAMPLEUS		 50 

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
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00017	A00068	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 048h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00091	A0007E	Float       VAR WORD        
_Float           		EQU	RAM_START + 05Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00065	A000A0	motorAnalogValue var WORD
_motorAnalogValue		EQU	RAM_START + 080h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00067	A000A2	motorAnalogValueSeconds var WORD
_motorAnalogValueSeconds		EQU	RAM_START + 082h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00066	A000A4	motorAnalogValueTmp var WORD
_motorAnalogValueTmp		EQU	RAM_START + 084h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00068	A000A6	motorAnalogValueTmpTicks var WORD
_motorAnalogValueTmpTicks		EQU	RAM_START + 086h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00062	A000A8	motorCurrentTicks var word
_motorCurrentTicks		EQU	RAM_START + 088h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00063	A000AA	motorExpectedTicks var word
_motorExpectedTicks		EQU	RAM_START + 08Ah
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00061	A000AC	motorFullRangeTicks var word
_motorFullRangeTicks		EQU	RAM_START + 08Ch
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00064	A000AE	motorTicksSecond var word
_motorTicksSecond		EQU	RAM_START + 08Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00014	A000B0	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 090h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00095	A000B2	sleep_period var word
_sleep_period    		EQU	RAM_START + 092h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00001	A000B4	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 094h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00001	A000B6	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T2              		EQU	RAM_START + 096h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00083	A000B8	temp_word var word
_temp_word       		EQU	RAM_START + 098h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00084	A000BA	temp_word_int var word
_temp_word_int   		EQU	RAM_START + 09Ah
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00090	A000BC	TempC       VAR WORD
_TempC           		EQU	RAM_START + 09Ch
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00092	A000BE	temperature var word
_temperature     		EQU	RAM_START + 09Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00094	A000C0	VDD VAR WORD
_VDD             		EQU	RAM_START + 0A0h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00069	A000C2	ANALOG_PERCENTAGE var byte
_ANALOG_PERCENTAGE		EQU	RAM_START + 0A2h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00076	A000C3	ci var byte
_ci              		EQU	RAM_START + 0A3h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00077	A000C4	configure var byte
_configure       		EQU	RAM_START + 0A4h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00088	A000C5	conversionSuccess VAR BYTE
_conversionSuccess		EQU	RAM_START + 0A5h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00025	A000C6	device_id var byte
_device_id       		EQU	RAM_START + 0A6h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00089	A000C7	Dummy       VAR BYTE
_Dummy           		EQU	RAM_START + 0A7h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00074	A000C8	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 0A8h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00075	A000C9	j var byte
_j               		EQU	RAM_START + 0A9h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00019	A000CA	k VAR byte
_k               		EQU	RAM_START + 0AAh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00087	A000CB	l1counter var byte
_l1counter       		EQU	RAM_START + 0ABh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00070	A000CC	mode var byte
_mode            		EQU	RAM_START + 0ACh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00060	A000CD	motorRunning VAR byte
_motorRunning    		EQU	RAM_START + 0ADh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00059	A000CE	moveSensorPrevious var byte
_moveSensorPrevious		EQU	RAM_START + 0AEh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00012	A000CF	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 0AFh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00001	A000D0	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
PB01            		EQU	RAM_START + 0B0h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00071	A000D1	RESET_BUTTON_FLAG var byte
_RESET_BUTTON_FLAG		EQU	RAM_START + 0B1h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00085	A000D2	seconds  var     byte   ' Define second variable
_seconds         		EQU	RAM_START + 0B2h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00080	A000D3	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 0B3h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00021	A000D4	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 0B4h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00081	A000D5	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 0B5h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00022	A000D6	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 0B6h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00082	A000D7	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 0B7h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00023	A000D8	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 0B8h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00024	A000D9	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 0B9h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00079	A000DA	temp_byte var byte
_temp_byte       		EQU	RAM_START + 0BAh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00078	A000DB	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 0BBh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00020	A000DC	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 0BCh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00096	A000DD	temperatureExp var byte
_temperatureExp  		EQU	RAM_START + 0BDh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00086	A000DE	ticks   var     byte    ' Define pieces of seconds variable
_ticks           		EQU	RAM_START + 0BEh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00013	A000DF	val var byte 'temp value
_val             		EQU	RAM_START + 0BFh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00018	A000E0	w var byte
_w               		EQU	RAM_START + 0C0h
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00023	PORTL   VAR     PORTA
_PORTL           		EQU	 PORTA
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00024	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00025	TRISL   VAR     TRISA
_TRISL           		EQU	 TRISA
; C:\PICDEV~1\PBP\PBP260\16F690.BAS	00026	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC
_motorFullRangeTicks??HIGHBYTE		EQU	_motorFullRangeTicks + 001h
_motorFullRangeTicks??LOWBYTE		EQU	_motorFullRangeTicks
_temperature??LOWBYTE		EQU	_temperature
_temperature??HIGHBYTE		EQU	_temperature + 001h
_TempC??LOWBYTE  		EQU	_TempC
#define _SSPEN           	_SSPCON??5
#define _CKP             	_SSPCON??4
#define _SMP             	_SSPSTAT??7
#define _CKE             	_SSPSTAT??6
#define _SSPIF           	_PIR1??3
#define _Ce              	_PORTA??2
#define _CSN             	_PORTC??0
#define _Irq             	_PORTC??2
#define _HEATING_SENSOR  	_PORTA??4
#define _HEATING_SENSOR_power	_PORTC??1
#define _MOTOR_1         	_PORTC??4
#define _MOTOR_2         	_PORTC??5
#define _MOVE_SENSOR_POWER	_PORTC??3
#define _MOVE_SENSOR     	_PORTA??5
#define _ANALOG_INPUT_MOTOR	_PORTB??5
#define _busy            	 PB01, 000h
#define _SSPCON??5       	 SSPCON, 005h
#define _SSPCON??4       	 SSPCON, 004h
#define _SSPSTAT??7      	 SSPSTAT, 007h
#define _SSPSTAT??6      	 SSPSTAT, 006h
#define _PIR1??3         	 PIR1, 003h
#define _PORTA??2        	 PORTA, 002h
#define _PORTC??0        	 PORTC, 000h
#define _PORTC??2        	 PORTC, 002h
#define _SSPCON??0       	 SSPCON, 000h
#define _ADCON0??7       	 ADCON0, 007h
#define _IOCB??5         	 IOCB, 005h
#define _PORTA??4        	 PORTA, 004h
#define _PORTC??1        	 PORTC, 001h
#define _PORTC??4        	 PORTC, 004h
#define _PORTC??5        	 PORTC, 005h
#define _PORTC??3        	 PORTC, 003h
#define _PORTA??5        	 PORTA, 005h
#define _PORTB??5        	 PORTB, 005h
#define _temperature??11 	_temperature + 001h, 003h
#define _val??0          	_val, 000h
#define _INTCON??2       	 INTCON, 002h
#define _INTCON??0       	 INTCON, 000h
#define _INTCON??7       	 INTCON, 007h
#define _VRCON??4        	 VRCON, 004h

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
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00020	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,44,95]
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
	DE	02Ch
	DE	05Fh

	INCLUDE	"HEATIN~1.MAC"
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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00005	@ DEVICE PIC16F690,MCLR_ON

	ASM?
 DEVICE PIC16F690,MCLR_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00006	@ DEVICE PIC16F690,CPD_ON

	ASM?
 DEVICE PIC16F690,CPD_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00007	@ DEVICE PIC16F690,BOD_OFF

	ASM?
 DEVICE PIC16F690,BOD_OFF

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00008	@ DEVICE PIC16F690,PWRT_OFF

	ASM?
 DEVICE PIC16F690,PWRT_OFF

	ENDASM?

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00020	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,44,95]

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00022	INCLUDE "RFM73.pbp"
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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00067	goto endRFM73
	GOTO?L	_endRFM73

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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00087	gosub setRxAddressPipe
	GOSUB?L	_setRxAddressPipe

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00088	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00089	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00090	data_out[0]=Write_reg+En_aa 'enable auto ACK pipe0
	MOVE?CB	021h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00091	data_out[1]=$01 '1 enable, 0 disable
	MOVE?CB	001h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00092	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00093	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00094	data_out[0]=Write_reg+En_rxaddr 'enable Rx address pipe0
	MOVE?CB	022h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00095	data_out[1]=$01
	MOVE?CB	001h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00096	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00097	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00098	data_out[0]=Write_reg+Rf_ch 'Set RF channel
	MOVE?CB	025h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00099	READ 0, data_out[1] 'number of channel used
	READADDRESS?C	000h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00100	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00101	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00102	data_out[0]=Write_reg+Rx_pw_p0 'Set Rx pload width pipe0
	MOVE?CB	031h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00103	data_out[1]=payloadLength 'number of bytes used in data sent
	MOVE?CB	_payloadLength, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00104	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00105	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00106	data_out[0]=Write_reg+Rf_setup 'Set RF: 'Set RF:5dbm, 1Mbps
	MOVE?CB	026h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00108	 data_out[1]=%00000111 '1mbit
	MOVE?CB	007h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00109	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00110	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00112	temp_byte_rfm = 1
	MOVE?CB	001h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00113	gosub setBank
	GOSUB?L	_setBank

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	000h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	040h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	001h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00114	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	0E2h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00115	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	001h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	0C0h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00116	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00117	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0D0h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0FCh, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	08Ch, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00118	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00119	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	003h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	099h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	000h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	039h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00120	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	041h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00121	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	004h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	0D9h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	096h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	082h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00122	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	01Bh, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00123	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	005h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	024h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	002h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	07Fh, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00124	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	0A6h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00125	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	00Ch, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	012h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	073h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00126	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00127	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	00Dh, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	046h, _temp1_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	0B4h, _temp2_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	080h, _temp3_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00128	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00129	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00130	data_out[0]=Write_reg+$0E
	MOVE?CB	02Eh, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00131	data_out[1]=$41
	MOVE?CB	041h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00132	data_out[2]=$20
	MOVE?CB	020h, _data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00133	data_out[3]=$08
	MOVE?CB	008h, _data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00134	data_out[4]=$04
	MOVE?CB	004h, _data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00135	data_out[5]=$81
	MOVE?CB	081h, _data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00136	data_out[6]=$20
	MOVE?CB	020h, _data_out + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00137	data_out[7]=$CF
	MOVE?CB	0CFh, _data_out + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00138	data_out[8]=$F7
	MOVE?CB	0F7h, _data_out + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00139	data_out[9]=$FE
	MOVE?CB	0FEh, _data_out + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00140	data_out[10]=$FF
	MOVE?CB	0FFh, _data_out + 0000Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00141	data_out[11]=$FF
	MOVE?CB	0FFh, _data_out + 0000Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00142	num_byte=11
	MOVE?CB	00Bh, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00143	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00144	temp_byte_rfm = 0
	MOVE?CB	000h, _temp_byte_rfm

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00145	gosub setBank
	GOSUB?L	_setBank

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00146	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00148	setBank:

	LABEL?L	_setBank	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00149	data_out[0]=Read_reg+$07
	MOVE?CB	007h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00150	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00151	gosub spi_read
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00152	if (temp_byte_rfm != (data_in[0] & $80)) then
	AND?BCW	_data_in, 080h, T1
	CMPEQ?BWL	_temp_byte_rfm, T1, L00002

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00154	    data_out[0]=$50
	MOVE?CB	050h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00155	    data_out[1]=$53    
	MOVE?CB	053h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00156	    num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00157	    gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00158	endif
	LABEL?L	L00002	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00159	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00161	conf4bytes:

	LABEL?L	_conf4bytes	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00162	data_out[0]=Write_reg+temp_byte_rfm
	ADD?CBB	_Write_reg, _temp_byte_rfm, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00163	data_out[1]=temp1_byte_rfm
	MOVE?BB	_temp1_byte_rfm, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00164	data_out[2]=temp2_byte_rfm
	MOVE?BB	_temp2_byte_rfm, _data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00165	data_out[3]=temp3_byte_rfm
	MOVE?BB	_temp3_byte_rfm, _data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00166	data_out[4]=temp4_byte_rfm
	MOVE?BB	_temp4_byte_rfm, _data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00167	num_byte=4
	MOVE?CB	004h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00168	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00169	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00171	sendData:

	LABEL?L	_sendData	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00172	pause 30
	PAUSE?C	01Eh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00173	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00174	data_out[0]=Flush_tx 'flush TX_fifo buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00175	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00176	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00177	data_out[0]=Write_reg+Stat_us 'reset IRQ bits
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00178	data_out[1]=%00110000
	MOVE?CB	030h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00179	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00180	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00181	gosub setup_tx 'setup Tx
	GOSUB?L	_setup_tx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00182	data_out[0]=Wr_tx_pload 'put 10 bytes data in Tx pload buffer
	MOVE?CB	_Wr_tx_pload, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00183	data_out[1]=device_id
	MOVE?BB	_device_id, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00184	for w = 2 to payloadLength+1
	MOVE?CB	002h, _w
	LABEL?L	L00004	
	CMPGT?BCL	_w, 017h, L00005

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00185	    data_out[w]=temp_data[w-2]
	SUB?BCW	_w, 002h, T1
	AOUT?BWB	_temp_data, T1, T1
	AIN?BBB	T1, _data_out, _w

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00186	    if data_out[w] == 10 then contSendX1
	AOUT?BBB	_data_out, _w, T1
	CMPEQ?BCL	T1, 00Ah, _contSendX1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00187	next w
	NEXT?BCL	_w, 001h, L00004
	LABEL?L	L00005	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00188	:contSendX1

	LABEL?L	_contSendX1	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00189	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00190	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00191	pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00192	Ce=1 'CE=1 (toggle) transmit FIFO buffer
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00193	Pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00194	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00195	Pause 1
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00196	trans_irq:

	LABEL?L	_trans_irq	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00197	If Irq !=0 then trans_irq 'wait until IRQ, active low
	CMPNE?TCL	_Irq, 000h, _trans_irq

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00198	data_out[0]=Stat_us 'read status register
	MOVE?CB	_Stat_us, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00199	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00200	gosub spi_read
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00201	val=data_in[0]&%01110000 'mask the IRQ bits STATUS byte
	AND?BCB	_data_in, 070h, _val

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00202	if (val = Max_rt) then gosub max_retry 'maximum TX retries
	CMPNE?BCL	_val, _Max_rt, L00006
	GOSUB?L	_max_retry
	LABEL?L	L00006	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00203	if (val = Tx_inter) then gosub tx_int 'Tx interrupted
	CMPNE?BCL	_val, _Tx_inter, L00008
	GOSUB?L	_tx_int
	LABEL?L	L00008	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00204	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00205	data_out[1]=%00100000 'clear TX_DS IRQ bit
	MOVE?CB	020h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00206	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00207	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00208	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00209	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00212	debounce:

	LABEL?L	_debounce	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00213	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00214	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00215	Ce=1
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00216	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00217	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00218	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00219	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00221	spi_write:

	LABEL?L	_spi_write	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00222	CSN=0
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00223	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00010	
	CMPGT?BBL	_w, _num_byte, L00011

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00224	SSPBUF=data_out[w] 'send array variable
	AOUT?BBB	_data_out, _w, SSPBUF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00225	GoSub buffer_ok 'wait until buffer ready
	GOSUB?L	_buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00226	Next w 'next location
	NEXT?BCL	_w, 001h, L00010
	LABEL?L	L00011	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00227	CSN=1
	MOVE?CT	001h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00228	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00230	spi_read:

	LABEL?L	_spi_read	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00231	CSN=0
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00232	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00012	
	CMPGT?BBL	_w, _num_byte, L00013

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00233	    SSPBUF = data_out[0] 'write to SSPBUF to start clock
	MOVE?BB	_data_out, SSPBUF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00234	    GoSub buffer_ok 'wait for receipt
	GOSUB?L	_buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00235	data_in[w] = SSPBUF 'store received character in array
	AIN?BBB	SSPBUF, _data_in, _w

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00236	Next w 'get next byte
	NEXT?BCL	_w, 001h, L00012
	LABEL?L	L00013	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00237	CSN=1
	MOVE?CT	001h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00238	Return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00239	buffer_ok:

	LABEL?L	_buffer_ok	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00240	IF SSPIF = 0 Then buffer_ok 'wait for SPI interupt flag
	CMPEQ?TCL	_SSPIF, 000h, _buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00241	SSPIF = 0 'reset flag
	MOVE?CT	000h, _SSPIF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00242	Return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00244	max_retry:

	LABEL?L	_max_retry	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00245	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00246	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00247	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00248	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00249	data_out[1]=%00010000 'clear MAX_RT IRQ bit
	MOVE?CB	010h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00250	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00251	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00252	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00254	tx_int:

	LABEL?L	_tx_int	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00255	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00256	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00257	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00258	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00259	data_out[1]=%00110000 'clear TX_DS & MAX_RT IRQ bit
	MOVE?CB	030h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00260	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00261	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00262	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00264	setup_rx:

	LABEL?L	_setup_rx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00265	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00266	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00267	data_out[1]=$0F
	MOVE?CB	00Fh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00268	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00269	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00271	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00273	setup_sleep:

	LABEL?L	_setup_sleep	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00274	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=0, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00275	data_out[1]=%00001101
	MOVE?CB	00Dh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00276	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00277	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00278	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00280	setup_tx:

	LABEL?L	_setup_tx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00281	data_out[0]=Write_reg+Tx_addr 'Tx address
	MOVE?CB	030h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00282	gosub setTxAddressPipe
	GOSUB?L	_setTxAddressPipe

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00283	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00284	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00285	data_out[0]= Write_reg+Setup_retr 'Set retransmit @ ACK
	MOVE?CB	024h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00286	data_out[1]= %00110101 '15x re-transmit (default)
	MOVE?CB	035h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00287	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00288	Gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00289	data_out[0]=Write_reg+Config_nrf 'Config:PRX=0,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00290	data_out[1]=$0E
	MOVE?CB	00Eh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00291	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00292	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00293	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\RFM73.PBP	00294	:endRFM73

	LABEL?L	_endRFM73	
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00024	 DEFINE OSC 8
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00026	 DEFINE ADC_BITS 10 ' ADCIN resolution (Bits)
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00027	 DEFINE ADC_CLOCK 3 ' ADC clock source (Fosc/32)
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00028	 DEFINE ADC_SAMPLEUS 50 ' ADC sampling time (uSec)

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00029	 ADCON0.7 = 1
	MOVE?CT	001h, _ADCON0??7

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00031	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00032	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00033	 ANSELH = %00001000
	MOVE?CB	008h, ANSELH

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00034	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00035	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00038	 INTCON = %10101000
	MOVE?CB	0A8h, INTCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00039	 PIE1 = %00000000
	MOVE?CB	000h, PIE1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00040	 OPTION_REG = %00000100
	MOVE?CB	004h, OPTION_REG

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00042	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00043	ENABLE
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00045	TRISA = %00110000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	030h, TRISA

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00046	TRISB = %00110000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	030h, TRISB

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00047	TRISC = %00000100 'Set IRQ input,
	ICALL?L	L00001
	MOVE?CB	004h, TRISC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00048	WPUA = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUA

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00049	WPUB = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUB

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00050	IOCB.5 = 1 'PORTB.5 is reset button, enable interrupt 
	ICALL?L	L00001
	MOVE?CT	001h, _IOCB??5

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00098	startProgLabel:

	LABEL?L	_startProgLabel	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00099	clear
	ICALL?L	L00001
	CLEAR?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00100	input MOVE_SENSOR
	ICALL?L	L00001
	INPUT?T	_MOVE_SENSOR

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00101	read 10, device_id
	ICALL?L	L00001
	READADDRESS?C	00Ah
	READ?B	_device_id

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00102	READ 12, motorFullRangeTicks.highbyte
	ICALL?L	L00001
	READADDRESS?C	00Ch
	READ?B	_motorFullRangeTicks??HIGHBYTE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00103	read 13, motorFullRangeTicks.lowbyte
	ICALL?L	L00001
	READADDRESS?C	00Dh
	READ?B	_motorFullRangeTicks??LOWBYTE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00104	read 11, sleep_period
	ICALL?L	L00001
	READADDRESS?C	00Bh
	READ?W	_sleep_period

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00105	read 14, temperatureExp
	ICALL?L	L00001
	READADDRESS?C	00Eh
	READ?B	_temperatureExp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00106	read 15, ANALOG_PERCENTAGE
	ICALL?L	L00001
	READADDRESS?C	00Fh
	READ?B	_ANALOG_PERCENTAGE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00107	gosub motorStopInt
	ICALL?L	L00001
	GOSUB?L	_motorStopInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00108	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00109	if (device_id != 0) then mode = 4
	ICALL?L	L00001
	CMPEQ?BCL	_device_id, 000h, L00014
	MOVE?CB	004h, _mode
	LABEL?L	L00014	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00110	commonSettings:

	LABEL?L	_commonSettings	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00111	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00114	Main_rx:

	LABEL?L	_Main_rx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00115	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00116	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00117	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00118	irqLoop:

	LABEL?L	_irqLoop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00119	if RESET_BUTTON_FLAG == 1 then
	ICALL?L	L00001
	CMPNE?BCL	_RESET_BUTTON_FLAG, 001h, L00016

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00120	    RESET_BUTTON_FLAG = 0
	ICALL?L	L00001
	MOVE?CB	000h, _RESET_BUTTON_FLAG

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00121	    DISABLE
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00122	    write 0, 40
	WRITEADDRESS?C	000h
	WRITE?C	028h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00123	    write 1, "R"
	WRITEADDRESS?C	001h
	WRITE?C	052h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00124	    write 2, "E"
	WRITEADDRESS?C	002h
	WRITE?C	045h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00125	    write 3, "M"
	WRITEADDRESS?C	003h
	WRITE?C	04Dh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00126	    write 4, "O"
	WRITEADDRESS?C	004h
	WRITE?C	04Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00127	    write 5, "T"
	WRITEADDRESS?C	005h
	WRITE?C	054h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00128	    write 6, "E"
	WRITEADDRESS?C	006h
	WRITE?C	045h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00129	    write 7, "H"
	WRITEADDRESS?C	007h
	WRITE?C	048h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00130	    write 8, "O"
	WRITEADDRESS?C	008h
	WRITE?C	04Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00131	    write 9, "M"
	WRITEADDRESS?C	009h
	WRITE?C	04Dh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00132	    write 10, 0
	WRITEADDRESS?C	00Ah
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00133	    write 11, 1
	WRITEADDRESS?C	00Bh
	WRITE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00134	    write 12, 0
	WRITEADDRESS?C	00Ch
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00135	    write 13, 0
	WRITEADDRESS?C	00Dh
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00136	    write 14, 44
	WRITEADDRESS?C	00Eh
	WRITE?C	02Ch

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00137	    write 15, 90
	WRITEADDRESS?C	00Fh
	WRITE?C	05Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00138	    ENABLE
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00139	    pause 1000
	ICALL?L	L00001
	PAUSE?C	003E8h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00140	    goto startProgLabel
	ICALL?L	L00001
	GOTO?L	_startProgLabel

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00141	endif
	ICALL?L	L00001
	LABEL?L	L00016	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00142	if (mode == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 001h, L00018

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00143	    if (sleep_period != 0) then
	ICALL?L	L00001
	CMPEQ?WCL	_sleep_period, 000h, L00020

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00144	       mode = 2
	ICALL?L	L00001
	MOVE?CB	002h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00145	       seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00146	       ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00148	      gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00149	    endif
	ICALL?L	L00001
	LABEL?L	L00020	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00150	endif
	ICALL?L	L00001
	LABEL?L	L00018	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00151	if (mode == 3) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 003h, L00022

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00152	      if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00024

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00153	          gosub sendCurrentPosition
	ICALL?L	L00001
	GOSUB?L	_sendCurrentPosition

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00154	          gosub setModeBasedOnSleepPeriod
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00155	      endif
	ICALL?L	L00001
	LABEL?L	L00024	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00156	endif
	ICALL?L	L00001
	LABEL?L	L00022	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00158	if (temp_data[0] != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_data, 000h, L00026

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00159	    if (configure == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_configure, 001h, L00028

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00160	        gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00161	        mode = 4
	ICALL?L	L00001
	MOVE?CB	004h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00162	        configure = 0
	ICALL?L	L00001
	MOVE?CB	000h, _configure

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00163	    endif
	ICALL?L	L00001
	LABEL?L	L00028	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00164	    gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00165	    temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00166	    GOTO main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00167	endif
	ICALL?L	L00001
	LABEL?L	L00026	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00168	if (mode == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 002h, L00030

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00169	    if (seconds > 2) then
	ICALL?L	L00001
	CMPLE?BCL	_seconds, 002h, L00032

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00171	      if (temperatureExp != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temperatureExp, 000h, L00034

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00172	         if (temperature.11 != 1) then                          
	ICALL?L	L00001
	CMPEQ?TCL	_temperature??11, 001h, L00036

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00173	             if (temperatureExp > temp3_byte) then
	ICALL?L	L00001
	CMPLE?BBL	_temperatureExp, _temp3_byte, L00038

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00174	                temp2_byte = temperatureExp - temp3_byte
	ICALL?L	L00001
	SUB?BBB	_temperatureExp, _temp3_byte, _temp2_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00175	                if (temp3_byte < 7) then
	ICALL?L	L00001
	CMPGE?BCL	_temp3_byte, 007h, L00040

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00176	                    temp_byte = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00177	                elseif (temp2_byte == 3) then
	ICALL?L	L00001
	GOTO?L	L00041
	LABEL?L	L00040	
	CMPNE?BCL	_temp2_byte, 003h, L00042

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00178	                    temp_byte = 50
	ICALL?L	L00001
	MOVE?CB	032h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00179	                elseif (temp2_byte == 2) then
	ICALL?L	L00001
	GOTO?L	L00041
	LABEL?L	L00042	
	CMPNE?BCL	_temp2_byte, 002h, L00044

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00180	                    temp_byte = 60
	ICALL?L	L00001
	MOVE?CB	03Ch, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00181	                elseif (temp2_byte == 1) then
	ICALL?L	L00001
	GOTO?L	L00041
	LABEL?L	L00044	
	CMPNE?BCL	_temp2_byte, 001h, L00046

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00182	                    temp_byte = 75
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00183	                else
	ICALL?L	L00001
	GOTO?L	L00041
	LABEL?L	L00046	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00184	                    temp_byte = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00185	                endif
	ICALL?L	L00001
	LABEL?L	L00041	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00186	             else
	ICALL?L	L00001
	GOTO?L	L00039
	LABEL?L	L00038	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00187	                temp_byte = 100
	ICALL?L	L00001
	MOVE?CB	064h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00188	             endif
	ICALL?L	L00001
	LABEL?L	L00039	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00189	         else
	ICALL?L	L00001
	GOTO?L	L00037
	LABEL?L	L00036	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00191	            temp_byte = 0          
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00192	         endif
	ICALL?L	L00001
	LABEL?L	L00037	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00193	         gosub setup_sleep
	ICALL?L	L00001
	GOSUB?L	_setup_sleep

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00194	         gosub setValveToPosition
	ICALL?L	L00001
	GOSUB?L	_setValveToPosition

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00195	         dummy = 0
	ICALL?L	L00001
	MOVE?CB	000h, _Dummy

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00196	         waitMotorStop:

	LABEL?L	_waitMotorStop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00197	         if (motorRunning != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_motorRunning, 000h, L00048

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00198	                dummy = 1
	ICALL?L	L00001
	MOVE?CB	001h, _Dummy

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00199	                goto waitMotorStop
	ICALL?L	L00001
	GOTO?L	_waitMotorStop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00200	         endif
	ICALL?L	L00001
	LABEL?L	L00048	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00201	         gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00202	         if (dummy == 1) then 
	ICALL?L	L00001
	CMPNE?BCL	_Dummy, 001h, L00050

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00203	             gosub sendCurrentPosition
	ICALL?L	L00001
	GOSUB?L	_sendCurrentPosition

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00204	             gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00205	             temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00206	         endif
	ICALL?L	L00001
	LABEL?L	L00050	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00207	      endif      
	ICALL?L	L00001
	LABEL?L	L00034	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00208	      INTCON = 0
	ICALL?L	L00001
	MOVE?CB	000h, INTCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00209	      OSCCON = %00010000
	ICALL?L	L00001
	MOVE?CB	010h, OSCCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00210	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00211	      gosub setup_sleep
	ICALL?L	L00001
	GOSUB?L	_setup_sleep

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00212	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00213	      sleep sleep_period * 10
	ICALL?L	L00001
	MUL?WCW	_sleep_period, 00Ah, T1
	SLEEP?W	T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00214	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00215	      seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00216	      ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00217	      OSCCON = %01110000
	ICALL?L	L00001
	MOVE?CB	070h, OSCCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00218	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00219	      INTCON = %10101000
	ICALL?L	L00001
	MOVE?CB	0A8h, INTCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00220	      OPTION_REG = %00000100
	ICALL?L	L00001
	MOVE?CB	004h, OPTION_REG

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00221	      mode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00222	      goto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00223	   endif
	ICALL?L	L00001
	LABEL?L	L00032	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00224	endif
	ICALL?L	L00001
	LABEL?L	L00030	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00225	if (mode == 4) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 004h, L00052

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00226	    temp_data[0] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00227	    temp_data[1] = "s"
	ICALL?L	L00001
	MOVE?CB	073h, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00228	    temp_data[2] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00229	    temp_data[3] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00230	    motorAnalogValue = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValue

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00231	    motorAnalogValueSeconds = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueSeconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00232	    motorAnalogValueTmpTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00233	    motorAnalogValueTmp = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00234	    mode = 5    
	ICALL?L	L00001
	MOVE?CB	005h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00235	    gosub MotorOpenHead
	ICALL?L	L00001
	GOSUB?L	_MotorOpenHead

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00236	endif
	ICALL?L	L00001
	LABEL?L	L00052	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00237	if (mode == 5) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 005h, L00054

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00238	    if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00056

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00239	        motorAnalogValue = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValue

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00240	        motorAnalogValueSeconds = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueSeconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00241	        motorAnalogValueTmpTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00242	        motorAnalogValueTmp = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00243	        mode = 6
	ICALL?L	L00001
	MOVE?CB	006h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00244	        motorCurrentTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00245	        gosub MotorCloseHead
	ICALL?L	L00001
	GOSUB?L	_MotorCloseHead

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00246	    endif
	ICALL?L	L00001
	LABEL?L	L00056	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00247	endif
	ICALL?L	L00001
	LABEL?L	L00054	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00248	if (mode == 6) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 006h, L00058

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00249	    if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00060

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00250	        motorFullRangeTicks = motorCurrentTicks
	ICALL?L	L00001
	MOVE?WW	_motorCurrentTicks, _motorFullRangeTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00251	        write 12, motorFullRangeTicks.highbyte
	ICALL?L	L00001
	WRITEADDRESS?C	00Ch
	WRITE?B	_motorFullRangeTicks??HIGHBYTE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00252	        write 13, motorFullRangeTicks.lowbyte
	ICALL?L	L00001
	WRITEADDRESS?C	00Dh
	WRITE?B	_motorFullRangeTicks??LOWBYTE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00253	        TEMP_data[0] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00254	        TEMP_data[1] = "e"
	ICALL?L	L00001
	MOVE?CB	065h, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00255	        gosub setModeBasedOnSleepPeriod    
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00256	    endif
	ICALL?L	L00001
	LABEL?L	L00060	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00257	endif
	ICALL?L	L00001
	LABEL?L	L00058	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00258	if (mode > 2) then irqLoop
	ICALL?L	L00001
	CMPGT?BCL	_mode, 002h, _irqLoop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00259	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00260	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00261	lop:

	LABEL?L	_lop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00262	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	ICALL?L	L00001
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00263	num_byte=payloadLength
	ICALL?L	L00001
	MOVE?CB	_payloadLength, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00264	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00265	temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00266	if (data_in[1] == device_id) then
	ICALL?L	L00001
	CMPNE?BBL	_data_in + 00001h, _device_id, L00062

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00267	    if (data_in[2] == "c") then    
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 063h, L00064

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00268	        if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00066

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00270	            for i = 0 to 10
	ICALL?L	L00001
	MOVE?CB	000h, _i
	LABEL?L	L00068	
	CMPGT?BCL	_i, 00Ah, L00069

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00271	                disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00272	                write i, data_in[i+4]
	WRITEADDRESS?B	_i
	ADD?BCW	_i, 004h, T1
	AOUT?BWB	_data_in, T1, T1
	WRITE?B	T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00273	                enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00274	            next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00068
	LABEL?L	L00069	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00275	            read 10, device_id            
	ICALL?L	L00001
	READADDRESS?C	00Ah
	READ?B	_device_id

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00276	            pause 250
	ICALL?L	L00001
	PAUSE?C	0FAh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00277	            configure = 1
	ICALL?L	L00001
	MOVE?CB	001h, _configure

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00278	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00279	        endif
	ICALL?L	L00001
	LABEL?L	L00066	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00280	    ELSEif (data_in[2] == "a") then
	ICALL?L	L00001
	GOTO?L	L00065
	LABEL?L	L00064	
	CMPNE?BCL	_data_in + 00002h, 061h, L00070

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00281	            mode = 4
	ICALL?L	L00001
	MOVE?CB	004h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00282	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00283	    elseif (data_in[2] == "p") then
	ICALL?L	L00001
	GOTO?L	L00065
	LABEL?L	L00070	
	CMPNE?BCL	_data_in + 00002h, 070h, L00072

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00284	        if (data_in[3] == "n") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 06Eh, L00074

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00285	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00286	        endif
	ICALL?L	L00001
	LABEL?L	L00074	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00287	    ELSEif (data_in[2] == "s") then    
	ICALL?L	L00001
	GOTO?L	L00065
	LABEL?L	L00072	
	CMPNE?BCL	_data_in + 00002h, 073h, L00076

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00288	            gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00289	    else
	ICALL?L	L00001
	GOTO?L	L00065
	LABEL?L	L00076	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00290	        if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00078

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00291	            i = 4
	ICALL?L	L00001
	MOVE?CB	004h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00292	            gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00293	        endif
	ICALL?L	L00001
	LABEL?L	L00078	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00294	        if (data_in[2] == "l") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 06Ch, L00080

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00295	            if (temp_byte < 101) then 
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 065h, L00082

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00296	                  gosub setValveToPosition
	ICALL?L	L00001
	GOSUB?L	_setValveToPosition

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00297	                  gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00298	            endif
	ICALL?L	L00001
	LABEL?L	L00082	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00299	        elseif (data_in[2] == "m") then
	ICALL?L	L00001
	GOTO?L	L00081
	LABEL?L	L00080	
	CMPNE?BCL	_data_in + 00002h, 06Dh, L00084

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00300	             disable   
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00301	             write 11, temp_byte
	WRITEADDRESS?C	00Bh
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00302	             enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00303	             sleep_period = temp_byte
	ICALL?L	L00001
	MOVE?BW	_temp_byte, _sleep_period

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00304	             gosub setModeBasedOnSleepPeriod
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00305	             gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00306	        elseif (data_in[2] == "t") then 
	ICALL?L	L00001
	GOTO?L	L00081
	LABEL?L	L00084	
	CMPNE?BCL	_data_in + 00002h, 074h, L00086

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00307	             disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00308	             write 14, temp_byte
	WRITEADDRESS?C	00Eh
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00309	             enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00310	             temperatureExp = temp_byte
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _temperatureExp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00311	             gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00312	        elseif (data_in[2] == "n") then 
	ICALL?L	L00001
	GOTO?L	L00081
	LABEL?L	L00086	
	CMPNE?BCL	_data_in + 00002h, 06Eh, L00088

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00313	             disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00314	             write 15, temp_byte
	WRITEADDRESS?C	00Fh
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00315	             enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00316	             ANALOG_PERCENTAGE = temp_byte
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _ANALOG_PERCENTAGE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00317	             gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00318	        endif
	ICALL?L	L00001
	LABEL?L	L00081	
	LABEL?L	L00088	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00319	    endif
	ICALL?L	L00001
	LABEL?L	L00065	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00320	    if (temp_data[0] == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp_data, 000h, L00090

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00321	        temp_data[0] = "E"
	ICALL?L	L00001
	MOVE?CB	045h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00322	        temp_data[1] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00323	        temp_data[2] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00324	        temp_data[3] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00325	        temp_data[4] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00326	        temp_data[5] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00327	    endif
	ICALL?L	L00001
	LABEL?L	L00090	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00328	endif
	ICALL?L	L00001
	LABEL?L	L00062	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00330	data_out[0]=Fifo_status 'Read FIFO status
	ICALL?L	L00001
	MOVE?CB	_Fifo_status, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00331	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00332	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00333	val= data_in[1] 'FIFO status register
	ICALL?L	L00001
	MOVE?BB	_data_in + 00001h, _val

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00334	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	ICALL?L	L00001
	CMPEQ?TCL	_val??0, 000h, _lop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00335	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	ICALL?L	L00001
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00336	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	ICALL?L	L00001
	MOVE?CB	040h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00337	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00338	gosub spi_write
	ICALL?L	L00001
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00339	pause 2 'wait 2ms Rx<->Tx
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00340	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00341	end
	ICALL?L	L00001
	END?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00343	disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00344	intManagement:

	LABEL?L	_intManagement	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00345	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON??2, 001h, L00092

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00346	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00347	           if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00094

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00348	                if (MOVE_SENSOR != moveSensorPrevious) then
	CMPEQ?TBL	_MOVE_SENSOR, _moveSensorPrevious, L00096

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00349	                    if (motorRunning == 1) then 
	CMPNE?BCL	_motorRunning, 001h, L00098

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00350	                        motorCurrentTicks = motorCurrentTicks + 1
	ADD?WCW	_motorCurrentTicks, 001h, _motorCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00351	                    else
	GOTO?L	L00099
	LABEL?L	L00098	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00352	                        motorCurrentTicks = motorCurrentTicks - 1
	SUB?WCW	_motorCurrentTicks, 001h, _motorCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00353	                    endif
	LABEL?L	L00099	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00354	                    moveSensorPrevious = MOVE_SENSOR
	MOVE?TB	_MOVE_SENSOR, _moveSensorPrevious

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00355	                endif
	LABEL?L	L00096	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00356	                if (motorCurrentTicks == motorExpectedTicks) then
	CMPNE?WWL	_motorCurrentTicks, _motorExpectedTicks, L00100

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00357	                    if (mode == 3) then
	CMPNE?BCL	_mode, 003h, L00102

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00358	                        gosub motorStopInt
	GOSUB?L	_motorStopInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00359	                    endif
	LABEL?L	L00102	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00360	                endif
	LABEL?L	L00100	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00361	                if ((ticks // 40) == 0) then
	MOD?BCW	_ticks, 028h, T1
	CMPNE?WCL	T1, 000h, L00104

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00362	                    if (mode > 3) then
	CMPLE?BCL	_mode, 003h, L00106

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00364	                            ADCIN 11, temp_word_int
	ADCIN?CW	00Bh, _temp_word_int

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00365	                            motorAnalogValueTmp = motorAnalogValueTmp + temp_word_int
	ADD?WWW	_motorAnalogValueTmp, _temp_word_int, _motorAnalogValueTmp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00366	                            motorAnalogValueTmpTicks = motorAnalogValueTmpTicks + 1                            
	ADD?WCW	_motorAnalogValueTmpTicks, 001h, _motorAnalogValueTmpTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00367	                    endif
	LABEL?L	L00106	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00368	                endif
	LABEL?L	L00104	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00369	           endif
	LABEL?L	L00094	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00370	           If ticks < 241 Then tiexit
	CMPLT?BCL	_ticks, 0F1h, _tiexit

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00371	           if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00108

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00372	                if (motorCurrentTicks == motorTicksSecond) then
	CMPNE?WWL	_motorCurrentTicks, _motorTicksSecond, L00110

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00373	                    gosub motorStopInt
	GOSUB?L	_motorStopInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00374	                endif
	LABEL?L	L00110	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00375	                motorTicksSecond = motorCurrentTicks 
	MOVE?WW	_motorCurrentTicks, _motorTicksSecond

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00376	           endif
	LABEL?L	L00108	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00377	           if (mode > 3) then
	CMPLE?BCL	_mode, 003h, L00112

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00378	               if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00114

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00379	                  temp_word_int = (motorAnalogValueTmp / motorAnalogValueTmpTicks)*10
	DIV?WWW	_motorAnalogValueTmp, _motorAnalogValueTmpTicks, T1
	MUL?WCW	T1, 00Ah, _temp_word_int

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00380	                  if (seconds == 2) then                          
	CMPNE?BCL	_seconds, 002h, L00116

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00381	                        motorAnalogValue = temp_word_int / 100
	DIV?WCW	_temp_word_int, 064h, _motorAnalogValue

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00382	                  endif
	LABEL?L	L00116	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00383	                  motorAnalogValueTmp = 0
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00384	                  motorAnalogValueTmpTicks = 0
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00385	                  if (temp_word_int/motorAnalogValue) < ANALOG_PERCENTAGE then
	DIV?WWW	_temp_word_int, _motorAnalogValue, T1
	CMPGE?WBL	T1, _ANALOG_PERCENTAGE, L00118

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00386	                      gosub motorStopInt  
	GOSUB?L	_motorStopInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00387	                  endif
	LABEL?L	L00118	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00388	               endif
	LABEL?L	L00114	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00389	           endif
	LABEL?L	L00112	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00390	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00391	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00392	           if seconds <= 58 then tiexit
	CMPLE?BCL	_seconds, 03Ah, _tiexit

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00393	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00394	           tiexit: 

	LABEL?L	_tiexit	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00395	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON??2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00396	        endif
	LABEL?L	L00092	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00397	        if (INTCON.0 == 1) then
	CMPNE?TCL	_INTCON??0, 001h, L00120

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00398	           INTCON.0 = 0
	MOVE?CT	000h, _INTCON??0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00399	           RESET_BUTTON_FLAG = 1
	MOVE?CB	001h, _RESET_BUTTON_FLAG

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00400	        endif
	LABEL?L	L00120	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00401	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON??7

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00402	resume
	RESUME?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00404	motorStopInt:

	LABEL?L	_motorStopInt	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00405	        low MOTOR_1
	LOW?T	_MOTOR_1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00406	        low MOTOR_2
	LOW?T	_MOTOR_2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00407	        motorRunning = 0
	MOVE?CB	000h, _motorRunning

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00408	        LOW MOVE_SENSOR_power
	LOW?T	_MOVE_SENSOR_POWER

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00409	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00411	enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00413	sendDataOK:

	LABEL?L	_sendDataOK	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00414	    temp_data[0] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00415	    temp_data[1] = "K"
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00416	    temp_data[2] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00417	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00419	convertInputData:

	LABEL?L	_convertInputData	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00420	    temp_word = 0
	ICALL?L	L00001
	MOVE?CW	000h, _temp_word

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00421	    conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00422	    labelContReadDecimals:

	LABEL?L	_labelContReadDecimals	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00423	        if data_in[i] > 47 then
	ICALL?L	L00001
	AOUT?BBB	_data_in, _i, T1
	CMPLE?BCL	T1, 02Fh, L00122

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00424	            if data_in[i] < 58 then
	ICALL?L	L00001
	AOUT?BBB	_data_in, _i, T1
	CMPGE?BCL	T1, 03Ah, L00124

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00425	                conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00426	                TEMP_word = TEMP_word*10 + ((data_in[i]+2)-50)
	ICALL?L	L00001
	MUL?WCW	_temp_word, 00Ah, T1
	AOUT?BBB	_data_in, _i, T2
	ADD?BCW	T2, 002h, T2
	SUB?WCW	T2, 032h, T2
	ADD?WWW	T1, T2, _temp_word

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00427	                i=i+1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00428	                if (TEMP_word < 256) then goto labelContReadDecimals
	ICALL?L	L00001
	CMPGE?WCL	_temp_word, 00100h, L00126
	GOTO?L	_labelContReadDecimals
	LABEL?L	L00126	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00429	            endif
	ICALL?L	L00001
	LABEL?L	L00124	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00430	        endif
	ICALL?L	L00001
	LABEL?L	L00122	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00431	    if (TEMP_word > 255) then
	ICALL?L	L00001
	CMPLE?WCL	_temp_word, 0FFh, L00128

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00432	         conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00433	    else
	ICALL?L	L00001
	GOTO?L	L00129
	LABEL?L	L00128	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00434	        temp_byte = TEMP_word
	ICALL?L	L00001
	MOVE?WB	_temp_word, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00435	    endif
	ICALL?L	L00001
	LABEL?L	L00129	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00436	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00438	convertNoToStr:

	LABEL?L	_convertNoToStr	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00439	        temp3_byte = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCB	T1, 030h, _temp3_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00440	        temp2_byte = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCB	T1, 030h, _temp2_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00441	        temp1_byte = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCB	T1, 030h, _temp1_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00442	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00444	MotorOpenHead:

	LABEL?L	_MotorOpenHead	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00445	    motorRunning = 2
	ICALL?L	L00001
	MOVE?CB	002h, _motorRunning

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00446	    HIGH MOTOR_1
	ICALL?L	L00001
	HIGH?T	_MOTOR_1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00447	    LOW MOTOR_2
	ICALL?L	L00001
	LOW?T	_MOTOR_2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00448	    high MOVE_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_MOVE_SENSOR_POWER

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00449	    motorTicksSecond = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorTicksSecond

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00450	    ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00451	    seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00452	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00454	motorCloseHead:

	LABEL?L	_MotorCloseHead	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00455	    motorRunning = 1
	ICALL?L	L00001
	MOVE?CB	001h, _motorRunning

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00456	    HIGH MOTOR_2
	ICALL?L	L00001
	HIGH?T	_MOTOR_2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00457	    LOW MOTOR_1
	ICALL?L	L00001
	LOW?T	_MOTOR_1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00458	    high MOVE_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_MOVE_SENSOR_POWER

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00459	    motorTicksSecond = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorTicksSecond

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00460	    ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00461	    seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00462	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00464	setValveToPosition:

	LABEL?L	_setValveToPosition	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00465	      disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00466	          temp_word = (motorFullRangeTicks * temp_byte) 
	MUL?WBW	_motorFullRangeTicks, _temp_byte, _temp_word

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00467	          motorExpectedTicks = DIV32 100   
	DIV32?CW	064h, _motorExpectedTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00468	      enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00469	      mode = 3
	ICALL?L	L00001
	MOVE?CB	003h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00470	      if (motorExpectedTicks != motorCurrentTicks) THEN
	ICALL?L	L00001
	CMPEQ?WWL	_motorExpectedTicks, _motorCurrentTicks, L00130

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00471	          if (motorExpectedTicks > motorCurrentTicks) then
	ICALL?L	L00001
	CMPLE?WWL	_motorExpectedTicks, _motorCurrentTicks, L00132

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00472	              GOSUB MotorCloseHead            
	ICALL?L	L00001
	GOSUB?L	_MotorCloseHead

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00473	          else
	ICALL?L	L00001
	GOTO?L	L00133
	LABEL?L	L00132	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00474	              GOSUB MotorOpenHead            
	ICALL?L	L00001
	GOSUB?L	_MotorOpenHead

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00475	          endif
	ICALL?L	L00001
	LABEL?L	L00133	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00476	      endif
	ICALL?L	L00001
	LABEL?L	L00130	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00477	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00479	sendCurrentPosition:

	LABEL?L	_sendCurrentPosition	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00480	      temp_data[0] = "l"
	ICALL?L	L00001
	MOVE?CB	06Ch, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00481	      i=1
	ICALL?L	L00001
	MOVE?CB	001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00482	      gosub printCurrentTicks
	ICALL?L	L00001
	GOSUB?L	_printCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00483	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00485	printCurrentTicks:

	LABEL?L	_printCurrentTicks	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00486	        temp_data[i] = "|"
	ICALL?L	L00001
	AIN?CBB	07Ch, _temp_data, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00487	        temp_byte = (motorCurrentTicks * 10) / (motorFullRangeTicks / 10)
	ICALL?L	L00001
	MUL?WCW	_motorCurrentTicks, 00Ah, T1
	DIV?WCW	_motorFullRangeTicks, 00Ah, T2
	DIV?WWB	T1, T2, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00488	        i=i+1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00489	        gosub printByteToTempByte
	ICALL?L	L00001
	GOSUB?L	_printByteToTempByte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00490	        temp_data[i+3] = 13
	ICALL?L	L00001
	ADD?BCW	_i, 003h, T1
	AIN?CBW	00Dh, _temp_data, T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00491	        temp_data[i+4] = 10
	ICALL?L	L00001
	ADD?BCW	_i, 004h, T1
	AIN?CBW	00Ah, _temp_data, T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00492	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00494	printByteToTempByte:        

	LABEL?L	_printByteToTempByte	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00495	        temp_data[i] = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBB	T1, _temp_data, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00496	print2LastBytesToTempByte:

	LABEL?L	_print2LastBytesToTempByte	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00497	        temp_data[i+1] = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	ADD?BCW	_i, 001h, T2
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBW	T1, _temp_data, T2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00498	        temp_data[i+2] = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	ADD?BCW	_i, 002h, T2
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBW	T1, _temp_data, T2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00499	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00501	sendTemperature:

	LABEL?L	_sendTemperature	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00502	    high HEATING_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_HEATING_SENSOR_power

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00503	    pause 2
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00505	   OWOUT HEATING_SENSOR, 1, [$CC, $44] 'Skip ROM search & do temp conversion
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	001h
	OWOUT?C	0CCh
	OWOUT?C	044h
	OWEND?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00506	Wait_Up:

	LABEL?L	_Wait_Up	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00507	   OWIN HEATING_SENSOR, 4, [Busy]      'Read busy-bit
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	004h
	OWIN?T	_busy
	OWEND?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00508	   IF Busy = 0 THEN goto Wait_Up            'Still busy..?, Wait_Up..!
	ICALL?L	L00001
	CMPNE?TCL	_busy, 000h, L00134
	GOTO?L	_Wait_Up
	LABEL?L	L00134	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00509	   OWOUT HEATING_SENSOR, 1, [$CC, $BE] 'Skip ROM search & read scratchpad memory
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	001h
	OWOUT?C	0CCh
	OWOUT?C	0BEh
	OWEND?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00510	   OWIN HEATING_SENSOR, 2, [temperature.Lowbyte, temperature.Highbyte] 'Read two bytes / end comms
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	002h
	OWIN?B	_temperature??LOWBYTE
	OWIN?B	_temperature??HIGHBYTE
	OWEND?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00511	   low HEATING_SENSOR_power
	ICALL?L	L00001
	LOW?T	_HEATING_SENSOR_power

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00512	   temp_data[0] = "4"
	ICALL?L	L00001
	MOVE?CB	034h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00513	   temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00514	   if (temperature.11 == 1) then
	ICALL?L	L00001
	CMPNE?TCL	_temperature??11, 001h, L00136

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00515	        temp_data[2] = "-"
	ICALL?L	L00001
	MOVE?CB	02Dh, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00516	        disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00517	        Dummy = 625 * (~temperature+1)
	NOT?WW	_temperature, T1
	ADD?WCW	T1, 001h, T1
	MUL?CWB	00271h, T1, _Dummy

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00518	        TempC = DIV32 10
	DIV32?CW	00Ah, _TempC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00519	        enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00520	        temp_data[3] = (TempC DIG 4) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 004h, T1
	ADD?WCB	T1, 030h, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00521	        temp_data[4] = (TempC DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00522	   else
	ICALL?L	L00001
	GOTO?L	L00137
	LABEL?L	L00136	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00523	        disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00524	        Dummy = 625 * temperature
	MUL?CWB	00271h, _temperature, _Dummy

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00525	        TempC = DIV32 10
	DIV32?CW	00Ah, _TempC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00526	        enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00527	        TempC  = (temperature & $0FF0) >> 4 ' Mask middle 8-bits, shift into lower byte
	ICALL?L	L00001
	AND?WCW	_temperature, 00FF0h, T1
	SHIFTR?WCW	T1, 004h, _TempC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00528	        Float = ((temperature.Lowbyte & $0F) * 625) ' Lower 4-bits of result * 625
	ICALL?L	L00001
	AND?BCW	_temperature??LOWBYTE, 00Fh, T1
	MUL?WCW	T1, 00271h, _Float

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00529	        temp_data[2] = (TempC DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00530	        temp_data[3] = (TempC DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00531	        temp_data[4] = (Float DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_Float, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00532	        temp3_byte = TempC.lowbyte * 2
	ICALL?L	L00001
	MUL?BCB	_TempC??LOWBYTE, 002h, _temp3_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00533	        if ((temp_data[4] - $30) > 4) then temp3_byte = temp3_byte + 1
	ICALL?L	L00001
	SUB?BCW	_temp_data + 00004h, 030h, T1
	CMPLE?WCL	T1, 004h, L00138
	ADD?BCB	_temp3_byte, 001h, _temp3_byte
	LABEL?L	L00138	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00534	   endif
	ICALL?L	L00001
	LABEL?L	L00137	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00536	        VRCON.4 = 1 ; Turn 0.6V reference ON
	ICALL?L	L00001
	MOVE?CT	001h, _VRCON??4

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00537	        PAUSEUS 200 ; Allow VP6 to settle
	ICALL?L	L00001
	PAUSEUS?C	0C8h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00538	        ADCIN 13, temp_word ; get VP6 analog reading (10-bit)
	ICALL?L	L00001
	ADCIN?CW	00Dh, _temp_word

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00539	        VRCON.4 = 0 ; Turn 0.6V reference OFF
	ICALL?L	L00001
	MOVE?CT	000h, _VRCON??4

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00540	        VDD = 6138 / temp_word ; convert to voltage ve vdd je 25 = 2,5 V        
	ICALL?L	L00001
	DIV?CWW	017FAh, _temp_word, _VDD

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00541	        temp_data[5] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00542	        temp_data[6] = (VDD DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_VDD, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00543	        temp_data[7] = (VDD DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_VDD, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00544	        temp_data[8] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00545	        temp_byte = sleep_period / 10
	ICALL?L	L00001
	DIV?WCB	_sleep_period, 00Ah, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00546	        i=9
	ICALL?L	L00001
	MOVE?CB	009h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00547	        gosub printByteToTempByte
	ICALL?L	L00001
	GOSUB?L	_printByteToTempByte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00548	        temp_data[12] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 0000Ch

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00549	        i=12
	ICALL?L	L00001
	MOVE?CB	00Ch, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00550	        temp_byte = temperatureExp
	ICALL?L	L00001
	MOVE?BB	_temperatureExp, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00551	        gosub print2LastBytesToTempByte
	ICALL?L	L00001
	GOSUB?L	_print2LastBytesToTempByte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00552	        i=15
	ICALL?L	L00001
	MOVE?CB	00Fh, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00553	        gosub printCurrentTicks
	ICALL?L	L00001
	GOSUB?L	_printCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00554	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00556	setModeBasedOnSleepPeriod:

	LABEL?L	_setModeBasedOnSleepPeriod	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00557	    if (device_id == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_device_id, 000h, L00140

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00558	        mode = 0
	ICALL?L	L00001
	MOVE?CB	000h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00559	    else 
	ICALL?L	L00001
	GOTO?L	L00141
	LABEL?L	L00140	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00560	        if (sleep_period == 0) then 
	ICALL?L	L00001
	CMPNE?WCL	_sleep_period, 000h, L00142

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00561	            mode = 0
	ICALL?L	L00001
	MOVE?CB	000h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00562	        else     
	ICALL?L	L00001
	GOTO?L	L00143
	LABEL?L	L00142	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00563	            mode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00564	        endif
	ICALL?L	L00001
	LABEL?L	L00143	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00565	    endif
	ICALL?L	L00001
	LABEL?L	L00141	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00566	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00568	setRxAddressPipe:

	LABEL?L	_setRxAddressPipe	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00569	READ 6, data_out[1]
	ICALL?L	L00001
	READADDRESS?C	006h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00570	READ 7, data_out[2]
	ICALL?L	L00001
	READADDRESS?C	007h
	READ?B	_data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00571	READ 8, data_out[3]
	ICALL?L	L00001
	READADDRESS?C	008h
	READ?B	_data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00572	READ 9, data_out[4]
	ICALL?L	L00001
	READADDRESS?C	009h
	READ?B	_data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00573	data_out[5] = device_id
	ICALL?L	L00001
	MOVE?BB	_device_id, _data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00574	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00576	setTxAddressPipe:

	LABEL?L	_setTxAddressPipe	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00577	READ 1, data_out[1]
	ICALL?L	L00001
	READADDRESS?C	001h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00578	READ 2, data_out[2]
	ICALL?L	L00001
	READADDRESS?C	002h
	READ?B	_data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00579	READ 3, data_out[3]
	ICALL?L	L00001
	READADDRESS?C	003h
	READ?B	_data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00580	READ 4, data_out[4]
	ICALL?L	L00001
	READADDRESS?C	004h
	READ?B	_data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00581	READ 5, data_out[5]
	ICALL?L	L00001
	READADDRESS?C	005h
	READ?B	_data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\FINALO~1\HEATIN~1.PBP	00582	return
	ICALL?L	L00001
	RETURN?	

	END
