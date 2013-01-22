
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
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00024	 DEFINE OSC 8
#define		OSC		 8
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00029	 DEFINE ADC_BITS 10 ' ADCIN resolution (Bits)
#define		ADC_BITS		 10 
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00030	 DEFINE ADC_CLOCK 3 ' ADC clock source (Fosc/32)
#define		ADC_CLOCK		 3 
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00031	 DEFINE ADC_SAMPLEUS 50 ' ADC sampling time (uSec)
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
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00016	A00038	data_in var Byte[payloadLengthD] 'data received
_data_in         		EQU	RAM_START + 018h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00015	A00050	data_out VAR BYTE[payloadLengthD] 'data sent
_data_out        		EQU	RAM_START + 030h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00017	A00068	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 048h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00089	A0007E	Float       VAR WORD        
_Float           		EQU	RAM_START + 05Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00065	A000A0	motorAnalogValue var WORD
_motorAnalogValue		EQU	RAM_START + 080h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00067	A000A2	motorAnalogValueSeconds var WORD
_motorAnalogValueSeconds		EQU	RAM_START + 082h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00066	A000A4	motorAnalogValueTmp var WORD
_motorAnalogValueTmp		EQU	RAM_START + 084h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00068	A000A6	motorAnalogValueTmpTicks var WORD
_motorAnalogValueTmpTicks		EQU	RAM_START + 086h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00062	A000A8	motorCurrentTicks var word
_motorCurrentTicks		EQU	RAM_START + 088h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00063	A000AA	motorExpectedTicks var word
_motorExpectedTicks		EQU	RAM_START + 08Ah
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00061	A000AC	motorFullRangeTicks var word
_motorFullRangeTicks		EQU	RAM_START + 08Ch
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00064	A000AE	motorTicksSecond var word
_motorTicksSecond		EQU	RAM_START + 08Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00014	A000B0	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 090h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00093	A000B2	sleep_period var word
_sleep_period    		EQU	RAM_START + 092h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00001	A000B4	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 094h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00001	A000B6	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T2              		EQU	RAM_START + 096h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00081	A000B8	temp_word var word
_temp_word       		EQU	RAM_START + 098h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00082	A000BA	temp_word_int var word
_temp_word_int   		EQU	RAM_START + 09Ah
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00088	A000BC	TempC       VAR WORD
_TempC           		EQU	RAM_START + 09Ch
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00090	A000BE	temperature var word
_temperature     		EQU	RAM_START + 09Eh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00092	A000C0	VDD VAR WORD
_VDD             		EQU	RAM_START + 0A0h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00069	A000C2	ANALOG_PERCENTAGE var byte
_ANALOG_PERCENTAGE		EQU	RAM_START + 0A2h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00074	A000C3	ci var byte
_ci              		EQU	RAM_START + 0A3h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00075	A000C4	configure var byte
_configure       		EQU	RAM_START + 0A4h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00086	A000C5	conversionSuccess VAR BYTE
_conversionSuccess		EQU	RAM_START + 0A5h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00025	A000C6	device_id var byte
_device_id       		EQU	RAM_START + 0A6h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00087	A000C7	Dummy       VAR BYTE
_Dummy           		EQU	RAM_START + 0A7h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00072	A000C8	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 0A8h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00073	A000C9	j var byte
_j               		EQU	RAM_START + 0A9h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00019	A000CA	k VAR byte
_k               		EQU	RAM_START + 0AAh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00085	A000CB	l1counter var byte
_l1counter       		EQU	RAM_START + 0ABh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00070	A000CC	mode var byte
_mode            		EQU	RAM_START + 0ACh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00060	A000CD	motorRunning VAR byte
_motorRunning    		EQU	RAM_START + 0ADh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00059	A000CE	moveSensorPrevious var byte
_moveSensorPrevious		EQU	RAM_START + 0AEh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00012	A000CF	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 0AFh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00001	A000D0	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
PB01            		EQU	RAM_START + 0B0h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00083	A000D1	seconds  var     byte   ' Define second variable
_seconds         		EQU	RAM_START + 0B1h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00078	A000D2	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 0B2h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00021	A000D3	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 0B3h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00079	A000D4	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 0B4h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00022	A000D5	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 0B5h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00080	A000D6	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 0B6h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00023	A000D7	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 0B7h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00024	A000D8	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 0B8h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00077	A000D9	temp_byte var byte
_temp_byte       		EQU	RAM_START + 0B9h
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00076	A000DA	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 0BAh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00020	A000DB	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 0BBh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00094	A000DC	temperatureExp var byte
_temperatureExp  		EQU	RAM_START + 0BCh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00084	A000DD	ticks   var     byte    ' Define pieces of seconds variable
_ticks           		EQU	RAM_START + 0BDh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00013	A000DE	val var byte 'temp value
_val             		EQU	RAM_START + 0BEh
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00018	A000DF	w var byte
_w               		EQU	RAM_START + 0BFh
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
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00022	EEPROM  0, [40,"R","O","B","I","K",0,0,0,0,44,95,0,0,0,0]
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
	DE	02Ch
	DE	05Fh
	DE	000h
	DE	000h
	DE	000h
	DE	000h

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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00005	@ DEVICE PIC16F690,MCLR_OFF

	ASM?
 DEVICE PIC16F690,MCLR_OFF

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00006	@ DEVICE PIC16F690,CPD_ON

	ASM?
 DEVICE PIC16F690,CPD_ON

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00007	@ DEVICE PIC16F690,BOD_OFF

	ASM?
 DEVICE PIC16F690,BOD_OFF

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00008	@ DEVICE PIC16F690,PWRT_OFF

	ASM?
 DEVICE PIC16F690,PWRT_OFF

	ENDASM?


; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00020	INCLUDE "RFM70.pbp"
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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00179	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00180	pause 2
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00181	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00182	data_out[0]=Flush_tx 'flush TX_fifo buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00183	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00184	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00185	data_out[0]=Write_reg+Stat_us 'reset IRQ bits
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00186	data_out[1]=%00110000
	MOVE?CB	030h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00187	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00188	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00189	gosub setup_tx 'setup Tx
	GOSUB?L	_setup_tx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00190	data_out[0]=Wr_tx_pload 'put 10 bytes data in Tx pload buffer
	MOVE?CB	_Wr_tx_pload, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00191	data_out[1]=device_id
	MOVE?BB	_device_id, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00192	for w = 2 to payloadLength+1
	MOVE?CB	002h, _w
	LABEL?L	L00007	
	CMPGT?BCL	_w, 017h, L00008

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00193	    data_out[w]=temp_data[w-2]
	SUB?BCW	_w, 002h, T1
	AOUT?BWB	_temp_data, T1, T1
	AIN?BBB	T1, _data_out, _w

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00194	    if data_out[w] == 10 then contSendX1
	AOUT?BBB	_data_out, _w, T1
	CMPEQ?BCL	T1, 00Ah, _contSendX1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00195	next w
	NEXT?BCL	_w, 001h, L00007
	LABEL?L	L00008	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00196	:contSendX1

	LABEL?L	_contSendX1	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00197	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00198	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00199	pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00200	Ce=1 'CE=1 (toggle) transmit FIFO buffer
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00201	Pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00202	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00203	Pause 10
	PAUSE?C	00Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00204	trans_irq:

	LABEL?L	_trans_irq	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00205	If Irq !=0 then trans_irq 'wait until IRQ, active low
	CMPNE?TCL	_Irq, 000h, _trans_irq

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00206	data_out[0]=Stat_us 'read status register
	MOVE?CB	_Stat_us, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00207	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00208	gosub spi_read
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00209	val=data_in[0]&%01110000 'mask the IRQ bits STATUS byte
	AND?BCB	_data_in, 070h, _val

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00210	if (val = Max_rt) then gosub max_retry 'maximum TX retries
	CMPNE?BCL	_val, _Max_rt, L00009
	GOSUB?L	_max_retry
	LABEL?L	L00009	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00211	if (val = Tx_inter) then gosub tx_int 'Tx interrupted
	CMPNE?BCL	_val, _Tx_inter, L00011
	GOSUB?L	_tx_int
	LABEL?L	L00011	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00212	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00213	data_out[1]=%00100000 'clear TX_DS IRQ bit
	MOVE?CB	020h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00214	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00215	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00216	pause 2
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00217	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00218	pause 2
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00219	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00220	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00223	debounce:

	LABEL?L	_debounce	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00224	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00225	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00226	Ce=1
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00227	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00228	Ce=0
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00229	pauseus 500
	PAUSEUS?C	001F4h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00230	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00232	spi_write:

	LABEL?L	_spi_write	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00233	CSN=0
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00234	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00013	
	CMPGT?BBL	_w, _num_byte, L00014

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00235	SSPBUF=data_out[w] 'send array variable
	AOUT?BBB	_data_out, _w, SSPBUF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00236	GoSub buffer_ok 'wait until buffer ready
	GOSUB?L	_buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00237	Next w 'next location
	NEXT?BCL	_w, 001h, L00013
	LABEL?L	L00014	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00238	CSN=1
	MOVE?CT	001h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00239	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00241	spi_read:

	LABEL?L	_spi_read	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00242	CSN=0
	MOVE?CT	000h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00243	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00015	
	CMPGT?BBL	_w, _num_byte, L00016

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00244	    SSPBUF = data_out[0] 'write to SSPBUF to start clock
	MOVE?BB	_data_out, SSPBUF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00245	    GoSub buffer_ok 'wait for receipt
	GOSUB?L	_buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00246	data_in[w] = SSPBUF 'store received character in array
	AIN?BBB	SSPBUF, _data_in, _w

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00247	Next w 'get next byte
	NEXT?BCL	_w, 001h, L00015
	LABEL?L	L00016	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00248	CSN=1
	MOVE?CT	001h, _CSN

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00249	Return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00250	buffer_ok:

	LABEL?L	_buffer_ok	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00251	IF SSPIF = 0 Then buffer_ok 'wait for SPI interupt flag
	CMPEQ?TCL	_SSPIF, 000h, _buffer_ok

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00252	SSPIF = 0 'reset flag
	MOVE?CT	000h, _SSPIF

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00253	Return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00255	max_retry:

	LABEL?L	_max_retry	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00256	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00257	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00258	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00259	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00260	data_out[1]=%00010000 'clear MAX_RT IRQ bit
	MOVE?CB	010h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00261	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00262	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00263	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00265	tx_int:

	LABEL?L	_tx_int	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00266	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00267	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00268	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00269	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00270	data_out[1]=%00110000 'clear TX_DS & MAX_RT IRQ bit
	MOVE?CB	030h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00271	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00272	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00273	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00275	setup_rx:

	LABEL?L	_setup_rx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00276	pause 2
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00277	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00278	pause 2
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00279	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00280	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00281	data_out[1]=$0F
	MOVE?CB	00Fh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00282	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00283	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00284	pause 2
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00285	gosub debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00286	pause 2
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00287	GOSUB debounce
	GOSUB?L	_debounce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00288	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00290	setup_sleep:

	LABEL?L	_setup_sleep	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00291	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=0, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00292	data_out[1]=%00001101
	MOVE?CB	00Dh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00293	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00294	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00295	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00297	setup_tx:

	LABEL?L	_setup_tx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00298	data_out[0]=Write_reg+Tx_addr 'Tx address
	MOVE?CB	030h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00299	READ 1, data_out[1]
	READADDRESS?C	001h
	READ?B	_data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00300	READ 2, data_out[2]
	READADDRESS?C	002h
	READ?B	_data_out + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00301	READ 3, data_out[3]
	READADDRESS?C	003h
	READ?B	_data_out + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00302	READ 4, data_out[4]
	READADDRESS?C	004h
	READ?B	_data_out + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00303	READ 5, data_out[5]
	READADDRESS?C	005h
	READ?B	_data_out + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00304	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00305	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00306	data_out[0]= Write_reg+Setup_retr 'Set retransmit @ ACK
	MOVE?CB	024h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00307	data_out[1]= 10 '3x re-transmit (default)
	MOVE?CB	00Ah, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00308	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00309	Gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00310	data_out[0]=Write_reg+Config_nrf 'Config:PRX=0,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00311	data_out[1]=$0E
	MOVE?CB	00Eh, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00312	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00313	gosub spi_write
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00314	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00315	:endRFM70

	LABEL?L	_endRFM70	
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00022	EEPROM  0, [40,"R","O","B","I","K",0,0,0,0,44,95,0,0,0,0]
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00024	 DEFINE OSC 8
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00029	 DEFINE ADC_BITS 10 ' ADCIN resolution (Bits)
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00030	 DEFINE ADC_CLOCK 3 ' ADC clock source (Fosc/32)
; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00031	 DEFINE ADC_SAMPLEUS 50 ' ADC sampling time (uSec)

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00032	 ADCON0.7 = 1
	MOVE?CT	001h, _ADCON0??7

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00034	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00035	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00036	 ANSELH = %00001000
	MOVE?CB	008h, ANSELH

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00037	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00038	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00041	 INTCON = %10100000
	MOVE?CB	0A0h, INTCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00042	 PIE1 = %00000000
	MOVE?CB	000h, PIE1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00043	 OPTION_REG = %00000100
	MOVE?CB	004h, OPTION_REG

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00045	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00046	ENABLE
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00048	TRISA = %00110000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	030h, TRISA

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00049	TRISB = %00110000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	030h, TRISB

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00050	TRISC = %00000100 'Set IRQ input, 
	ICALL?L	L00001
	MOVE?CB	004h, TRISC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00096	clear
	ICALL?L	L00001
	CLEAR?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00097	input MOVE_SENSOR
	ICALL?L	L00001
	INPUT?T	_MOVE_SENSOR

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00098	read 6, device_id
	ICALL?L	L00001
	READADDRESS?C	006h
	READ?B	_device_id

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00099	READ 7, motorFullRangeTicks.highbyte
	ICALL?L	L00001
	READADDRESS?C	007h
	READ?B	_motorFullRangeTicks??HIGHBYTE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00100	read 8, motorFullRangeTicks.lowbyte
	ICALL?L	L00001
	READADDRESS?C	008h
	READ?B	_motorFullRangeTicks??LOWBYTE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00101	read 9, sleep_period
	ICALL?L	L00001
	READADDRESS?C	009h
	READ?W	_sleep_period

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00102	read 10, temperatureExp
	ICALL?L	L00001
	READADDRESS?C	00Ah
	READ?B	_temperatureExp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00103	read 11, ANALOG_PERCENTAGE
	ICALL?L	L00001
	READADDRESS?C	00Bh
	READ?B	_ANALOG_PERCENTAGE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00104	gosub motorStopInt
	ICALL?L	L00001
	GOSUB?L	_motorStopInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00105	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00106	if (device_id != 0) then mode = 4
	ICALL?L	L00001
	CMPEQ?BCL	_device_id, 000h, L00017
	MOVE?CB	004h, _mode
	LABEL?L	L00017	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00107	commonSettings:

	LABEL?L	_commonSettings	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00108	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00111	Main_rx:

	LABEL?L	_Main_rx	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00112	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00113	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00114	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00115	irqLoop:

	LABEL?L	_irqLoop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00116	if (mode == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 001h, L00019

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00117	    if (sleep_period != 0) then
	ICALL?L	L00001
	CMPEQ?WCL	_sleep_period, 000h, L00021

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00118	       mode = 2
	ICALL?L	L00001
	MOVE?CB	002h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00119	       seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00120	       ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00122	      gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00123	    endif
	ICALL?L	L00001
	LABEL?L	L00021	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00124	endif
	ICALL?L	L00001
	LABEL?L	L00019	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00125	if (mode == 3) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 003h, L00023

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00126	      if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00025

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00127	          gosub sendCurrentPosition
	ICALL?L	L00001
	GOSUB?L	_sendCurrentPosition

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00128	          gosub setModeBasedOnSleepPeriod
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00129	      endif
	ICALL?L	L00001
	LABEL?L	L00025	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00130	endif
	ICALL?L	L00001
	LABEL?L	L00023	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00132	if (temp_data[0] != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_data, 000h, L00027

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00133	    if (configure == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_configure, 001h, L00029

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00134	        gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00135	        mode = 4
	ICALL?L	L00001
	MOVE?CB	004h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00136	        configure = 0
	ICALL?L	L00001
	MOVE?CB	000h, _configure

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00137	    endif
	ICALL?L	L00001
	LABEL?L	L00029	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00138	    gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00139	    temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00140	    GOTO main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00141	endif
	ICALL?L	L00001
	LABEL?L	L00027	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00142	if (mode == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 002h, L00031

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00143	    if (seconds > 2) then
	ICALL?L	L00001
	CMPLE?BCL	_seconds, 002h, L00033

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00145	      if (temperatureExp != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temperatureExp, 000h, L00035

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00146	         if (temperature.11 != 1) then                          
	ICALL?L	L00001
	CMPEQ?TCL	_temperature??11, 001h, L00037

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00147	             if (temperatureExp > temp3_byte) then
	ICALL?L	L00001
	CMPLE?BBL	_temperatureExp, _temp3_byte, L00039

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00148	                temp2_byte = temperatureExp - temp3_byte
	ICALL?L	L00001
	SUB?BBB	_temperatureExp, _temp3_byte, _temp2_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00149	                if (temp3_byte < 7) then
	ICALL?L	L00001
	CMPGE?BCL	_temp3_byte, 007h, L00041

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00150	                    temp_byte = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00151	                elseif (temp2_byte == 3) then
	ICALL?L	L00001
	GOTO?L	L00042
	LABEL?L	L00041	
	CMPNE?BCL	_temp2_byte, 003h, L00043

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00152	                    temp_byte = 50
	ICALL?L	L00001
	MOVE?CB	032h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00153	                elseif (temp2_byte == 2) then
	ICALL?L	L00001
	GOTO?L	L00042
	LABEL?L	L00043	
	CMPNE?BCL	_temp2_byte, 002h, L00045

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00154	                    temp_byte = 60
	ICALL?L	L00001
	MOVE?CB	03Ch, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00155	                elseif (temp2_byte == 1) then
	ICALL?L	L00001
	GOTO?L	L00042
	LABEL?L	L00045	
	CMPNE?BCL	_temp2_byte, 001h, L00047

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00156	                    temp_byte = 75
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00157	                else
	ICALL?L	L00001
	GOTO?L	L00042
	LABEL?L	L00047	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00158	                    temp_byte = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00159	                endif
	ICALL?L	L00001
	LABEL?L	L00042	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00160	             else
	ICALL?L	L00001
	GOTO?L	L00040
	LABEL?L	L00039	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00161	                temp_byte = 100
	ICALL?L	L00001
	MOVE?CB	064h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00162	             endif
	ICALL?L	L00001
	LABEL?L	L00040	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00163	         else
	ICALL?L	L00001
	GOTO?L	L00038
	LABEL?L	L00037	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00165	            temp_byte = 0          
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00166	         endif
	ICALL?L	L00001
	LABEL?L	L00038	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00167	         gosub setup_sleep
	ICALL?L	L00001
	GOSUB?L	_setup_sleep

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00168	         gosub setValveToPosition
	ICALL?L	L00001
	GOSUB?L	_setValveToPosition

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00169	         dummy = 0
	ICALL?L	L00001
	MOVE?CB	000h, _Dummy

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00170	         waitMotorStop:

	LABEL?L	_waitMotorStop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00171	         if (motorRunning != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_motorRunning, 000h, L00049

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00172	                dummy = 1
	ICALL?L	L00001
	MOVE?CB	001h, _Dummy

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00173	                goto waitMotorStop
	ICALL?L	L00001
	GOTO?L	_waitMotorStop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00174	         endif
	ICALL?L	L00001
	LABEL?L	L00049	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00175	         gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00176	         if (dummy == 1) then 
	ICALL?L	L00001
	CMPNE?BCL	_Dummy, 001h, L00051

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00177	             gosub sendCurrentPosition
	ICALL?L	L00001
	GOSUB?L	_sendCurrentPosition

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00178	             gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00179	             temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00180	         endif
	ICALL?L	L00001
	LABEL?L	L00051	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00181	      endif      
	ICALL?L	L00001
	LABEL?L	L00035	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00182	      disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00183	      INTCON = 0
	MOVE?CB	000h, INTCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00184	      OSCCON = %00010000
	MOVE?CB	010h, OSCCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00185	      pause 1
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00186	      gosub setup_sleep
	GOSUB?L	_setup_sleep

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00187	      pause 1
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00188	      sleep sleep_period * 10
	MUL?WCW	_sleep_period, 00Ah, T1
	SLEEP?W	T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00189	      pause 1
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00190	      seconds = 0
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00191	      ticks = 0
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00192	      OSCCON = %01110000
	MOVE?CB	070h, OSCCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00193	      pause 1
	PAUSE?C	001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00194	      INTCON = %10100000
	MOVE?CB	0A0h, INTCON

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00195	      OPTION_REG = %00000100
	MOVE?CB	004h, OPTION_REG

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00196	      enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00197	      mode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00198	      goto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00199	   endif
	ICALL?L	L00001
	LABEL?L	L00033	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00200	endif
	ICALL?L	L00001
	LABEL?L	L00031	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00201	if (mode == 4) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 004h, L00053

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00202	    temp_data[0] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00203	    temp_data[1] = "s"
	ICALL?L	L00001
	MOVE?CB	073h, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00204	    temp_data[2] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00205	    temp_data[3] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00206	    motorAnalogValue = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValue

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00207	    motorAnalogValueSeconds = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueSeconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00208	    motorAnalogValueTmpTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00209	    motorAnalogValueTmp = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00210	    mode = 5    
	ICALL?L	L00001
	MOVE?CB	005h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00211	    gosub MotorOpenHead
	ICALL?L	L00001
	GOSUB?L	_MotorOpenHead

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00212	endif
	ICALL?L	L00001
	LABEL?L	L00053	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00213	if (mode == 5) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 005h, L00055

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00214	    if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00057

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00215	        motorAnalogValue = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValue

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00216	        motorAnalogValueSeconds = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueSeconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00217	        motorAnalogValueTmpTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00218	        motorAnalogValueTmp = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00219	        mode = 6
	ICALL?L	L00001
	MOVE?CB	006h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00220	        motorCurrentTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00221	        gosub MotorCloseHead
	ICALL?L	L00001
	GOSUB?L	_MotorCloseHead

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00222	    endif
	ICALL?L	L00001
	LABEL?L	L00057	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00223	endif
	ICALL?L	L00001
	LABEL?L	L00055	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00224	if (mode == 6) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 006h, L00059

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00225	    if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00061

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00226	        motorFullRangeTicks = motorCurrentTicks
	ICALL?L	L00001
	MOVE?WW	_motorCurrentTicks, _motorFullRangeTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00227	        write 7, motorFullRangeTicks.highbyte
	ICALL?L	L00001
	WRITEADDRESS?C	007h
	WRITE?B	_motorFullRangeTicks??HIGHBYTE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00228	        write 8, motorFullRangeTicks.lowbyte
	ICALL?L	L00001
	WRITEADDRESS?C	008h
	WRITE?B	_motorFullRangeTicks??LOWBYTE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00229	        TEMP_data[0] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00230	        TEMP_data[1] = "e"
	ICALL?L	L00001
	MOVE?CB	065h, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00231	        gosub setModeBasedOnSleepPeriod    
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00232	    endif
	ICALL?L	L00001
	LABEL?L	L00061	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00233	endif
	ICALL?L	L00001
	LABEL?L	L00059	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00234	if (mode > 2) then irqLoop
	ICALL?L	L00001
	CMPGT?BCL	_mode, 002h, _irqLoop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00235	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00236	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00237	lop:

	LABEL?L	_lop	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00238	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	ICALL?L	L00001
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00239	num_byte=payloadLength
	ICALL?L	L00001
	MOVE?CB	_payloadLength, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00240	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00241	temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00242	if (data_in[1] == device_id) then
	ICALL?L	L00001
	CMPNE?BBL	_data_in + 00001h, _device_id, L00063

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00243	    if (data_in[2] == "c") then    
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 063h, L00065

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00244	        if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00067

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00246	            write 0, data_in[9] 'channel
	ICALL?L	L00001
	WRITEADDRESS?C	000h
	WRITE?B	_data_in + 00009h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00247	            write 1, data_in[4] 'password 0
	ICALL?L	L00001
	WRITEADDRESS?C	001h
	WRITE?B	_data_in + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00248	            write 2, data_in[5] 'password 1
	ICALL?L	L00001
	WRITEADDRESS?C	002h
	WRITE?B	_data_in + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00249	            write 3, data_in[6] 'password 2
	ICALL?L	L00001
	WRITEADDRESS?C	003h
	WRITE?B	_data_in + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00250	            write 4, data_in[7] 'password 3
	ICALL?L	L00001
	WRITEADDRESS?C	004h
	WRITE?B	_data_in + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00251	            write 5, data_in[8] 'password 4
	ICALL?L	L00001
	WRITEADDRESS?C	005h
	WRITE?B	_data_in + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00252	            write 6, data_in[10]'device id
	ICALL?L	L00001
	WRITEADDRESS?C	006h
	WRITE?B	_data_in + 0000Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00253	            device_id = data_in[10]
	ICALL?L	L00001
	MOVE?BB	_data_in + 0000Ah, _device_id

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00254	            pause 10
	ICALL?L	L00001
	PAUSE?C	00Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00255	            configure = 1
	ICALL?L	L00001
	MOVE?CB	001h, _configure

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00256	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00257	        endif
	ICALL?L	L00001
	LABEL?L	L00067	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00258	    ELSEif (data_in[2] == "a") then
	ICALL?L	L00001
	GOTO?L	L00066
	LABEL?L	L00065	
	CMPNE?BCL	_data_in + 00002h, 061h, L00069

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00259	            mode = 4
	ICALL?L	L00001
	MOVE?CB	004h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00260	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00261	    elseif (data_in[2] == "p") then
	ICALL?L	L00001
	GOTO?L	L00066
	LABEL?L	L00069	
	CMPNE?BCL	_data_in + 00002h, 070h, L00071

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00262	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00263	    ELSEif (data_in[2] == "s") then    
	ICALL?L	L00001
	GOTO?L	L00066
	LABEL?L	L00071	
	CMPNE?BCL	_data_in + 00002h, 073h, L00073

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00264	            gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00265	    else
	ICALL?L	L00001
	GOTO?L	L00066
	LABEL?L	L00073	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00266	        if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00075

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00267	            i = 4
	ICALL?L	L00001
	MOVE?CB	004h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00268	            gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00269	        endif
	ICALL?L	L00001
	LABEL?L	L00075	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00270	        if (data_in[2] == "l") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 06Ch, L00077

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00271	            if (temp_byte < 101) then 
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 065h, L00079

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00272	                  gosub setValveToPosition
	ICALL?L	L00001
	GOSUB?L	_setValveToPosition

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00273	                  gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00274	            endif
	ICALL?L	L00001
	LABEL?L	L00079	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00275	        elseif (data_in[2] == "m") then   
	ICALL?L	L00001
	GOTO?L	L00078
	LABEL?L	L00077	
	CMPNE?BCL	_data_in + 00002h, 06Dh, L00081

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00276	             write 9, temp_byte
	ICALL?L	L00001
	WRITEADDRESS?C	009h
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00277	             sleep_period = temp_byte
	ICALL?L	L00001
	MOVE?BW	_temp_byte, _sleep_period

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00278	             gosub setModeBasedOnSleepPeriod
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00279	             gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00280	        elseif (data_in[2] == "t") then 
	ICALL?L	L00001
	GOTO?L	L00078
	LABEL?L	L00081	
	CMPNE?BCL	_data_in + 00002h, 074h, L00083

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00281	             write 10, temp_byte
	ICALL?L	L00001
	WRITEADDRESS?C	00Ah
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00282	             temperatureExp = temp_byte
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _temperatureExp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00283	             gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00284	        elseif (data_in[2] == "n") then 
	ICALL?L	L00001
	GOTO?L	L00078
	LABEL?L	L00083	
	CMPNE?BCL	_data_in + 00002h, 06Eh, L00085

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00285	             write 11, temp_byte
	ICALL?L	L00001
	WRITEADDRESS?C	00Bh
	WRITE?B	_temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00286	             ANALOG_PERCENTAGE = temp_byte
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _ANALOG_PERCENTAGE

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00287	             gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00288	        endif
	ICALL?L	L00001
	LABEL?L	L00078	
	LABEL?L	L00085	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00289	    endif
	ICALL?L	L00001
	LABEL?L	L00066	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00290	    if (temp_data[0] == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp_data, 000h, L00087

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00291	        temp_data[0] = "E"
	ICALL?L	L00001
	MOVE?CB	045h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00292	        temp_data[1] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00293	        temp_data[2] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00294	        temp_data[3] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00295	        temp_data[4] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00296	        temp_data[5] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00297	    endif
	ICALL?L	L00001
	LABEL?L	L00087	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00298	endif
	ICALL?L	L00001
	LABEL?L	L00063	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00300	data_out[0]=Fifo_status 'Read FIFO status
	ICALL?L	L00001
	MOVE?CB	_Fifo_status, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00301	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00302	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00303	val= data_in[1] 'FIFO status register
	ICALL?L	L00001
	MOVE?BB	_data_in + 00001h, _val

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00304	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	ICALL?L	L00001
	CMPEQ?TCL	_val??0, 000h, _lop

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00305	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	ICALL?L	L00001
	MOVE?CB	027h, _data_out

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00306	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	ICALL?L	L00001
	MOVE?CB	040h, _data_out + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00307	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00308	gosub spi_write
	ICALL?L	L00001
	GOSUB?L	_spi_write

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00309	pause 2 'wait 2ms Rx<->Tx
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00310	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00311	end
	ICALL?L	L00001
	END?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00313	disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00314	intManagement:

	LABEL?L	_intManagement	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00315	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON??2, 001h, L00089

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00316	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00317	           if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00091

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00318	                if (MOVE_SENSOR != moveSensorPrevious) then
	CMPEQ?TBL	_MOVE_SENSOR, _moveSensorPrevious, L00093

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00319	                    if (motorRunning == 1) then 
	CMPNE?BCL	_motorRunning, 001h, L00095

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00320	                        motorCurrentTicks = motorCurrentTicks + 1
	ADD?WCW	_motorCurrentTicks, 001h, _motorCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00321	                    else
	GOTO?L	L00096
	LABEL?L	L00095	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00322	                        motorCurrentTicks = motorCurrentTicks - 1
	SUB?WCW	_motorCurrentTicks, 001h, _motorCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00323	                    endif
	LABEL?L	L00096	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00324	                    moveSensorPrevious = MOVE_SENSOR
	MOVE?TB	_MOVE_SENSOR, _moveSensorPrevious

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00325	                endif
	LABEL?L	L00093	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00326	                if (motorCurrentTicks == motorExpectedTicks) then
	CMPNE?WWL	_motorCurrentTicks, _motorExpectedTicks, L00097

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00327	                    if (mode == 3) then
	CMPNE?BCL	_mode, 003h, L00099

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00328	                        gosub motorStopInt
	GOSUB?L	_motorStopInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00329	                    endif
	LABEL?L	L00099	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00330	                endif
	LABEL?L	L00097	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00331	                if ((ticks // 40) == 0) then
	MOD?BCW	_ticks, 028h, T1
	CMPNE?WCL	T1, 000h, L00101

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00332	                    if (mode > 3) then
	CMPLE?BCL	_mode, 003h, L00103

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00334	                            ADCIN 11, temp_word_int
	ADCIN?CW	00Bh, _temp_word_int

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00335	                            motorAnalogValueTmp = motorAnalogValueTmp + temp_word_int
	ADD?WWW	_motorAnalogValueTmp, _temp_word_int, _motorAnalogValueTmp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00336	                            motorAnalogValueTmpTicks = motorAnalogValueTmpTicks + 1                            
	ADD?WCW	_motorAnalogValueTmpTicks, 001h, _motorAnalogValueTmpTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00337	                    endif
	LABEL?L	L00103	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00338	                endif
	LABEL?L	L00101	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00339	           endif
	LABEL?L	L00091	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00340	           If ticks < 241 Then tiexit
	CMPLT?BCL	_ticks, 0F1h, _tiexit

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00341	           if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00105

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00342	                if (motorCurrentTicks == motorTicksSecond) then
	CMPNE?WWL	_motorCurrentTicks, _motorTicksSecond, L00107

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00343	                    gosub motorStopInt
	GOSUB?L	_motorStopInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00344	                endif
	LABEL?L	L00107	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00345	                motorTicksSecond = motorCurrentTicks 
	MOVE?WW	_motorCurrentTicks, _motorTicksSecond

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00346	           endif
	LABEL?L	L00105	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00347	           if (mode > 3) then
	CMPLE?BCL	_mode, 003h, L00109

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00348	               if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00111

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00349	                  temp_word_int = (motorAnalogValueTmp / motorAnalogValueTmpTicks)*10
	DIV?WWW	_motorAnalogValueTmp, _motorAnalogValueTmpTicks, T1
	MUL?WCW	T1, 00Ah, _temp_word_int

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00350	                  if (seconds == 2) then                          
	CMPNE?BCL	_seconds, 002h, L00113

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00351	                        motorAnalogValue = temp_word_int / 100
	DIV?WCW	_temp_word_int, 064h, _motorAnalogValue

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00352	                  endif
	LABEL?L	L00113	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00353	                  motorAnalogValueTmp = 0
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00354	                  motorAnalogValueTmpTicks = 0
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00355	                  if (temp_word_int/motorAnalogValue) < ANALOG_PERCENTAGE then
	DIV?WWW	_temp_word_int, _motorAnalogValue, T1
	CMPGE?WBL	T1, _ANALOG_PERCENTAGE, L00115

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00356	                      gosub motorStopInt  
	GOSUB?L	_motorStopInt

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00357	                  endif
	LABEL?L	L00115	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00358	               endif
	LABEL?L	L00111	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00359	           endif
	LABEL?L	L00109	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00360	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00361	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00362	           if seconds <= 58 then tiexit
	CMPLE?BCL	_seconds, 03Ah, _tiexit

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00363	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00364	           tiexit: 

	LABEL?L	_tiexit	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00365	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON??2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00366	        endif
	LABEL?L	L00089	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00367	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON??7

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00368	resume
	RESUME?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00370	motorStopInt:

	LABEL?L	_motorStopInt	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00371	        low MOTOR_1
	LOW?T	_MOTOR_1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00372	        low MOTOR_2
	LOW?T	_MOTOR_2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00373	        motorRunning = 0
	MOVE?CB	000h, _motorRunning

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00374	        LOW MOVE_SENSOR_power
	LOW?T	_MOVE_SENSOR_POWER

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00375	return
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00377	enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00379	sendDataOK:

	LABEL?L	_sendDataOK	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00380	    temp_data[0] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00381	    temp_data[1] = "K"
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00382	    temp_data[2] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00383	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00385	convertInputData:

	LABEL?L	_convertInputData	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00386	    conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00387	    TEMP_BYTE="a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00388	    for ci=0 to 2    
	ICALL?L	L00001
	MOVE?CB	000h, _ci
	LABEL?L	L00117	
	CMPGT?BCL	_ci, 002h, L00118

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00389	        TEMP1_BYTE = "a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp1_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00390	        TEMP2_BYTE = data_in[i]
	ICALL?L	L00001
	AOUT?BBB	_data_in, _i, _temp2_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00391	        if (TEMP2_BYTE == "|") then return
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 07Ch, L00119
	RETURN?	
	LABEL?L	L00119	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00392	        GOSUB lookupChar
	ICALL?L	L00001
	GOSUB?L	_lookupChar

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00393	        if (TEMP1_BYTE == "a") then return 
	ICALL?L	L00001
	CMPNE?BCL	_temp1_byte, 061h, L00121
	RETURN?	
	LABEL?L	L00121	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00394	        if (ci==0) then 
	ICALL?L	L00001
	CMPNE?BCL	_ci, 000h, L00123

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00395	            TEMP_BYTE = TEMP1_BYTE
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00396	            conversionSuccess = 1 
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00397	        else 
	ICALL?L	L00001
	GOTO?L	L00124
	LABEL?L	L00123	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00398	            TEMP_BYTE = TEMP_BYTE*10 + TEMP1_BYTE
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 00Ah, T1
	ADD?WBB	T1, _temp1_byte, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00399	            conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00400	        endif
	ICALL?L	L00001
	LABEL?L	L00124	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00401	        i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00402	    next ci
	ICALL?L	L00001
	NEXT?BCL	_ci, 001h, L00117
	LABEL?L	L00118	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00403	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00405	lookupChar:

	LABEL?L	_lookupChar	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00406	    LOOKDOWN temp2_byte,["0123456789"], temp1_byte
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

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00407	RETURN
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00409	convertNoToStr:

	LABEL?L	_convertNoToStr	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00410	        temp3_byte = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCB	T1, 030h, _temp3_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00411	        temp2_byte = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCB	T1, 030h, _temp2_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00412	        temp1_byte = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCB	T1, 030h, _temp1_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00413	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00415	MotorOpenHead:

	LABEL?L	_MotorOpenHead	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00416	    motorRunning = 2
	ICALL?L	L00001
	MOVE?CB	002h, _motorRunning

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00417	    HIGH MOTOR_1
	ICALL?L	L00001
	HIGH?T	_MOTOR_1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00418	    LOW MOTOR_2
	ICALL?L	L00001
	LOW?T	_MOTOR_2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00419	    high MOVE_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_MOVE_SENSOR_POWER

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00420	    motorTicksSecond = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorTicksSecond

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00421	    ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00422	    seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00423	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00425	motorCloseHead:

	LABEL?L	_MotorCloseHead	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00426	    motorRunning = 1
	ICALL?L	L00001
	MOVE?CB	001h, _motorRunning

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00427	    HIGH MOTOR_2
	ICALL?L	L00001
	HIGH?T	_MOTOR_2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00428	    LOW MOTOR_1
	ICALL?L	L00001
	LOW?T	_MOTOR_1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00429	    high MOVE_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_MOVE_SENSOR_POWER

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00430	    motorTicksSecond = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorTicksSecond

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00431	    ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00432	    seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00433	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00435	setValveToPosition:

	LABEL?L	_setValveToPosition	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00436	      disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00437	          temp_word = (motorFullRangeTicks * temp_byte) 
	MUL?WBW	_motorFullRangeTicks, _temp_byte, _temp_word

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00438	          motorExpectedTicks = DIV32 100   
	DIV32?CW	064h, _motorExpectedTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00439	      enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00440	      mode = 3
	ICALL?L	L00001
	MOVE?CB	003h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00441	      if (motorExpectedTicks != motorCurrentTicks) THEN
	ICALL?L	L00001
	CMPEQ?WWL	_motorExpectedTicks, _motorCurrentTicks, L00125

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00442	          if (motorExpectedTicks > motorCurrentTicks) then
	ICALL?L	L00001
	CMPLE?WWL	_motorExpectedTicks, _motorCurrentTicks, L00127

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00443	              GOSUB MotorCloseHead            
	ICALL?L	L00001
	GOSUB?L	_MotorCloseHead

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00444	          else
	ICALL?L	L00001
	GOTO?L	L00128
	LABEL?L	L00127	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00445	              GOSUB MotorOpenHead            
	ICALL?L	L00001
	GOSUB?L	_MotorOpenHead

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00446	          endif
	ICALL?L	L00001
	LABEL?L	L00128	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00447	      endif
	ICALL?L	L00001
	LABEL?L	L00125	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00448	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00450	sendCurrentPosition:

	LABEL?L	_sendCurrentPosition	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00451	      temp_data[0] = "l"
	ICALL?L	L00001
	MOVE?CB	06Ch, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00452	      i=1
	ICALL?L	L00001
	MOVE?CB	001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00453	      gosub printCurrentTicks
	ICALL?L	L00001
	GOSUB?L	_printCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00454	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00456	printCurrentTicks:

	LABEL?L	_printCurrentTicks	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00457	        temp_data[i] = "|"
	ICALL?L	L00001
	AIN?CBB	07Ch, _temp_data, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00458	        temp_byte = (motorCurrentTicks * 10) / (motorFullRangeTicks / 10)
	ICALL?L	L00001
	MUL?WCW	_motorCurrentTicks, 00Ah, T1
	DIV?WCW	_motorFullRangeTicks, 00Ah, T2
	DIV?WWB	T1, T2, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00459	        i=i+1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00460	        gosub printByteToTempByte
	ICALL?L	L00001
	GOSUB?L	_printByteToTempByte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00461	        temp_data[i+3] = 13
	ICALL?L	L00001
	ADD?BCW	_i, 003h, T1
	AIN?CBW	00Dh, _temp_data, T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00462	        temp_data[i+4] = 10
	ICALL?L	L00001
	ADD?BCW	_i, 004h, T1
	AIN?CBW	00Ah, _temp_data, T1

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00463	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00465	printByteToTempByte:        

	LABEL?L	_printByteToTempByte	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00466	        temp_data[i] = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBB	T1, _temp_data, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00467	print2LastBytesToTempByte:

	LABEL?L	_print2LastBytesToTempByte	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00468	        temp_data[i+1] = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	ADD?BCW	_i, 001h, T2
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBW	T1, _temp_data, T2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00469	        temp_data[i+2] = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	ADD?BCW	_i, 002h, T2
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBW	T1, _temp_data, T2

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00470	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00472	sendTemperature:

	LABEL?L	_sendTemperature	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00473	    high HEATING_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_HEATING_SENSOR_power

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00474	    pause 2
	ICALL?L	L00001
	PAUSE?C	002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00476	   OWOUT HEATING_SENSOR, 1, [$CC, $44] 'Skip ROM search & do temp conversion
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	001h
	OWOUT?C	0CCh
	OWOUT?C	044h
	OWEND?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00477	Wait_Up:

	LABEL?L	_Wait_Up	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00478	   OWIN HEATING_SENSOR, 4, [Busy]      'Read busy-bit
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	004h
	OWIN?T	_busy
	OWEND?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00479	   IF Busy = 0 THEN goto Wait_Up            'Still busy..?, Wait_Up..!
	ICALL?L	L00001
	CMPNE?TCL	_busy, 000h, L00129
	GOTO?L	_Wait_Up
	LABEL?L	L00129	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00480	   OWOUT HEATING_SENSOR, 1, [$CC, $BE] 'Skip ROM search & read scratchpad memory
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	001h
	OWOUT?C	0CCh
	OWOUT?C	0BEh
	OWEND?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00481	   OWIN HEATING_SENSOR, 2, [temperature.Lowbyte, temperature.Highbyte] 'Read two bytes / end comms
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	002h
	OWIN?B	_temperature??LOWBYTE
	OWIN?B	_temperature??HIGHBYTE
	OWEND?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00482	   low HEATING_SENSOR_power
	ICALL?L	L00001
	LOW?T	_HEATING_SENSOR_power

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00483	   temp_data[0] = "4"
	ICALL?L	L00001
	MOVE?CB	034h, _temp_data

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00484	   temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00485	   if (temperature.11 == 1) then
	ICALL?L	L00001
	CMPNE?TCL	_temperature??11, 001h, L00131

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00486	        temp_data[2] = "-"
	ICALL?L	L00001
	MOVE?CB	02Dh, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00487	        disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00488	        Dummy = 625 * (~temperature+1)
	NOT?WW	_temperature, T1
	ADD?WCW	T1, 001h, T1
	MUL?CWB	00271h, T1, _Dummy

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00489	        TempC = DIV32 10
	DIV32?CW	00Ah, _TempC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00490	        enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00491	        temp_data[3] = (TempC DIG 4) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 004h, T1
	ADD?WCB	T1, 030h, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00492	        temp_data[4] = (TempC DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00493	   else
	ICALL?L	L00001
	GOTO?L	L00132
	LABEL?L	L00131	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00494	        disable
	DISABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00495	        Dummy = 625 * temperature
	MUL?CWB	00271h, _temperature, _Dummy

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00496	        TempC = DIV32 10
	DIV32?CW	00Ah, _TempC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00497	        enable
	ENABLE?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00498	        TempC  = (temperature & $0FF0) >> 4 ' Mask middle 8-bits, shift into lower byte
	ICALL?L	L00001
	AND?WCW	_temperature, 00FF0h, T1
	SHIFTR?WCW	T1, 004h, _TempC

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00499	        Float = ((temperature.Lowbyte & $0F) * 625) ' Lower 4-bits of result * 625
	ICALL?L	L00001
	AND?BCW	_temperature??LOWBYTE, 00Fh, T1
	MUL?WCW	T1, 00271h, _Float

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00500	        temp_data[2] = (TempC DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00002h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00501	        temp_data[3] = (TempC DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 00003h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00502	        temp_data[4] = (Float DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_Float, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 00004h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00503	        temp3_byte = TempC.lowbyte * 2
	ICALL?L	L00001
	MUL?BCB	_TempC??LOWBYTE, 002h, _temp3_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00504	        if ((temp_data[4] - $30) > 4) then temp3_byte = temp3_byte + 1
	ICALL?L	L00001
	SUB?BCW	_temp_data + 00004h, 030h, T1
	CMPLE?WCL	T1, 004h, L00133
	ADD?BCB	_temp3_byte, 001h, _temp3_byte
	LABEL?L	L00133	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00505	   endif
	ICALL?L	L00001
	LABEL?L	L00132	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00507	        VRCON.4 = 1 ; Turn 0.6V reference ON
	ICALL?L	L00001
	MOVE?CT	001h, _VRCON??4

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00508	        PAUSEUS 200 ; Allow VP6 to settle
	ICALL?L	L00001
	PAUSEUS?C	0C8h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00509	        ADCIN 13, temp_word ; get VP6 analog reading (10-bit)
	ICALL?L	L00001
	ADCIN?CW	00Dh, _temp_word

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00510	        VRCON.4 = 0 ; Turn 0.6V reference OFF
	ICALL?L	L00001
	MOVE?CT	000h, _VRCON??4

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00511	        VDD = 6138 / temp_word ; convert to voltage ve vdd je 25 = 2,5 V        
	ICALL?L	L00001
	DIV?CWW	017FAh, _temp_word, _VDD

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00512	        temp_data[5] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00513	        temp_data[6] = (VDD DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_VDD, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00006h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00514	        temp_data[7] = (VDD DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_VDD, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 00007h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00515	        temp_data[8] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00008h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00516	        temp_byte = sleep_period / 10
	ICALL?L	L00001
	DIV?WCB	_sleep_period, 00Ah, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00517	        i=9
	ICALL?L	L00001
	MOVE?CB	009h, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00518	        gosub printByteToTempByte
	ICALL?L	L00001
	GOSUB?L	_printByteToTempByte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00519	        temp_data[12] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 0000Ch

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00520	        i=12
	ICALL?L	L00001
	MOVE?CB	00Ch, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00521	        temp_byte = temperatureExp
	ICALL?L	L00001
	MOVE?BB	_temperatureExp, _temp_byte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00522	        gosub print2LastBytesToTempByte
	ICALL?L	L00001
	GOSUB?L	_print2LastBytesToTempByte

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00523	        i=15
	ICALL?L	L00001
	MOVE?CB	00Fh, _i

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00524	        gosub printCurrentTicks
	ICALL?L	L00001
	GOSUB?L	_printCurrentTicks

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00525	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00527	setModeBasedOnSleepPeriod:

	LABEL?L	_setModeBasedOnSleepPeriod	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00528	    if (device_id == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_device_id, 000h, L00135

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00529	        mode = 0
	ICALL?L	L00001
	MOVE?CB	000h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00530	    else 
	ICALL?L	L00001
	GOTO?L	L00136
	LABEL?L	L00135	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00531	        if (sleep_period == 0) then 
	ICALL?L	L00001
	CMPNE?WCL	_sleep_period, 000h, L00137

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00532	            mode = 0
	ICALL?L	L00001
	MOVE?CB	000h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00533	        else     
	ICALL?L	L00001
	GOTO?L	L00138
	LABEL?L	L00137	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00534	            mode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _mode

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00535	        endif
	ICALL?L	L00001
	LABEL?L	L00138	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00536	    endif
	ICALL?L	L00001
	LABEL?L	L00136	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00537	return
	ICALL?L	L00001
	RETURN?	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00539	resetValues:

	LABEL?L	_resetValues	

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00540	    write 0, 40
	ICALL?L	L00001
	WRITEADDRESS?C	000h
	WRITE?C	028h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00541	    write 1, "R"
	ICALL?L	L00001
	WRITEADDRESS?C	001h
	WRITE?C	052h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00542	    write 2, "O"
	ICALL?L	L00001
	WRITEADDRESS?C	002h
	WRITE?C	04Fh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00543	    write 3, "B"
	ICALL?L	L00001
	WRITEADDRESS?C	003h
	WRITE?C	042h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00544	    write 4, "I"
	ICALL?L	L00001
	WRITEADDRESS?C	004h
	WRITE?C	049h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00545	    write 5, "K"
	ICALL?L	L00001
	WRITEADDRESS?C	005h
	WRITE?C	04Bh

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00546	    write 6, 0
	ICALL?L	L00001
	WRITEADDRESS?C	006h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00547	    write 7, 0
	ICALL?L	L00001
	WRITEADDRESS?C	007h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00548	    write 8, 0
	ICALL?L	L00001
	WRITEADDRESS?C	008h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00549	    write 9, 0
	ICALL?L	L00001
	WRITEADDRESS?C	009h
	WRITE?C	000h

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00550	    write 10, 44
	ICALL?L	L00001
	WRITEADDRESS?C	00Ah
	WRITE?C	02Ch

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00551	    write 11, 90
	ICALL?L	L00001
	WRITEADDRESS?C	00Bh
	WRITE?C	05Ah

; C:\REMOTE~1\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00552	return
	ICALL?L	L00001
	RETURN?	

	END
