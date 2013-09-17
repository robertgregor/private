
; PicBasic Pro Compiler 2.46, (c) 1998, 2005 microEngineering Labs, Inc. All Rights Reserved.  
PM_USED			EQU	1

	INCLUDE	"16F690.INC"


; Define statements.
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4
#define		CODE_SIZE		 4
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00024	 DEFINE OSC 8
#define		OSC		 8
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00026	 DEFINE ADC_BITS 10 ' ADCIN resolution (Bits)
#define		ADC_BITS		 10 
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00027	 DEFINE ADC_CLOCK 3 ' ADC clock source (Fosc/32)
#define		ADC_CLOCK		 3 
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00028	 DEFINE ADC_SAMPLEUS 50 ' ADC sampling time (uSec)
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
T1              		EQU	RAM_START + 012h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00091	Float       VAR WORD        
_Float           		EQU	RAM_START + 04Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00065	motorAnalogValue var WORD
_motorAnalogValue		EQU	RAM_START + 04Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00067	motorAnalogValueSeconds var WORD
_motorAnalogValueSeconds		EQU	RAM_START + 050h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00066	motorAnalogValueTmp var WORD
_motorAnalogValueTmp		EQU	RAM_START + 052h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00068	motorAnalogValueTmpTicks var WORD
_motorAnalogValueTmpTicks		EQU	RAM_START + 054h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00062	motorCurrentTicks var word
_motorCurrentTicks		EQU	RAM_START + 056h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00063	motorExpectedTicks var word
_motorExpectedTicks		EQU	RAM_START + 058h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00061	motorFullRangeTicks var word
_motorFullRangeTicks		EQU	RAM_START + 05Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00064	motorTicksSecond var word
_motorTicksSecond		EQU	RAM_START + 05Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00014	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 05Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00017	data_received var Byte[payloadLengthD] 'data received
_data_received   		EQU	RAM_START + 080h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00018	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 098h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00095	sleep_period var word
_sleep_period    		EQU	RAM_START + 0AEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00083	temp_word var word
_temp_word       		EQU	RAM_START + 0B0h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00084	temp_word_int var word
_temp_word_int   		EQU	RAM_START + 0B2h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00090	TempC       VAR WORD
_TempC           		EQU	RAM_START + 0B4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00092	temperature var word
_temperature     		EQU	RAM_START + 0B6h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00094	VDD VAR WORD
_VDD             		EQU	RAM_START + 0B8h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00069	ANALOG_PERCENTAGE var byte
_ANALOG_PERCENTAGE		EQU	RAM_START + 0BAh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00076	ci var byte
_ci              		EQU	RAM_START + 0BBh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00077	configure var byte
_configure       		EQU	RAM_START + 0BCh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00088	conversionSuccess VAR BYTE
_conversionSuccess		EQU	RAM_START + 0BDh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00026	device_id var byte
_device_id       		EQU	RAM_START + 0BEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00089	Dummy       VAR BYTE
_Dummy           		EQU	RAM_START + 0BFh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00074	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 0C0h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00075	j var byte
_j               		EQU	RAM_START + 0C1h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00020	k VAR byte
_k               		EQU	RAM_START + 0C2h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00087	l1counter var byte
_l1counter       		EQU	RAM_START + 0C3h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00070	mode var byte
_mode            		EQU	RAM_START + 0C4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00060	motorRunning VAR byte
_motorRunning    		EQU	RAM_START + 0C5h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00059	moveSensorPrevious var byte
_moveSensorPrevious		EQU	RAM_START + 0C6h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00012	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 0C7h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
PB01            		EQU	RAM_START + 0C8h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00071	RESET_BUTTON_FLAG var byte
_RESET_BUTTON_FLAG		EQU	RAM_START + 0C9h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00027	sameFlag VAR BYTE
_sameFlag        		EQU	RAM_START + 0CAh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00085	seconds  var     byte   ' Define second variable
_seconds         		EQU	RAM_START + 0CBh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00080	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 0CCh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00022	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 0CDh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00081	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 0CEh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00023	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 0CFh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00082	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 00100h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00024	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 00101h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00025	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 00102h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00079	temp_byte var byte
_temp_byte       		EQU	RAM_START + 00103h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00078	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 00104h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00021	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 00105h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00096	temperatureExp var byte
_temperatureExp  		EQU	RAM_START + 00106h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00086	ticks   var     byte    ' Define pieces of seconds variable
_ticks           		EQU	RAM_START + 00107h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00013	val var byte 'temp value
_val             		EQU	RAM_START + 00108h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00019	w var byte
_w               		EQU	RAM_START + 00109h
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00021	PORTL   VAR     PORTA
_PORTL           		EQU	 PORTA
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00022	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00023	TRISL   VAR     TRISA
_TRISL           		EQU	 TRISA
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00024	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC
_motorFullRangeTicks_HIGHBYTE		EQU	_motorFullRangeTicks + 001h
_motorFullRangeTicks_LOWBYTE		EQU	_motorFullRangeTicks
_temperature_LOWBYTE		EQU	_temperature
_temperature_HIGHBYTE		EQU	_temperature + 001h
_TempC_LOWBYTE   		EQU	_TempC
#define _SSPEN           	_SSPCON_5
#define _CKP             	_SSPCON_4
#define _SMP             	_SSPSTAT_7
#define _CKE             	_SSPSTAT_6
#define _SSPIF           	_PIR1_3
#define _Ce              	_PORTA_2
#define _CSN             	_PORTC_0
#define _Irq             	_PORTC_2
#define _HEATING_SENSOR  	_PORTA_4
#define _HEATING_SENSOR_power	_PORTC_1
#define _MOTOR_1         	_PORTC_4
#define _MOTOR_2         	_PORTC_5
#define _MOVE_SENSOR_POWER	_PORTC_3
#define _MOVE_SENSOR     	_PORTA_5
#define _ANALOG_INPUT_MOTOR	_PORTB_5
#define _busy            	 PB01, 000h
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
#define _ADCON0_7        	 ADCON0, 007h
#define _PORTA_4         	 PORTA, 004h
#define _PORTC_1         	 PORTC, 001h
#define _PORTC_4         	 PORTC, 004h
#define _PORTC_5         	 PORTC, 005h
#define _PORTC_3         	 PORTC, 003h
#define _PORTA_5         	 PORTA, 005h
#define _PORTB_5         	 PORTB, 005h
#define _temperature_11  	_temperature + 001h, 003h
#define _INTCON_2        	 INTCON, 002h
#define _INTCON_0        	 INTCON, 000h
#define _INTCON_7        	 INTCON, 007h
#define _VRCON_4         	 VRCON, 004h

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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00020	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,44,95]
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


; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00012	BANK0   $0020, $007F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00013	BANK1   $00A0, $00EF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00014	BANK2   $0120, $016F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00015	EEPROM  $2100, $21FF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00016	LIBRARY "PBPPIC14"
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00019	        include "PIC14EXT.BAS"

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00026	        include "PBPPIC14.RAM"

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00005	@ DEVICE PIC16F690,MCLR_ON

	ASM?
 DEVICE PIC16F690,MCLR_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00006	@ DEVICE PIC16F690,CPD_OFF

	ASM?
 DEVICE PIC16F690,CPD_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00007	@ DEVICE PIC16F690,BOD_ON

	ASM?
 DEVICE PIC16F690,BOD_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00008	@ DEVICE PIC16F690,PWRT_ON

	ASM?
 DEVICE PIC16F690,PWRT_ON

	ENDASM?

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00020	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,44,95]

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00022	INCLUDE "RFM73.pbp"
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00010	payloadLength con 22
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00011	payloadLengthD con 24
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00030	Idle_int con $00 'Idle no interrupt pending
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00031	Max_rt con $10 'Max # of Tx retrans interrupt
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00032	Tx_inter con $30 'Tx interrupted
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00033	Rx_ds con $40 'Rx data received
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00035	Read_reg con $00 'def read command to register
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00036	Write_reg CON $20 'def write command to register
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00037	Rd_rx_pload con $61 'def Rx payload register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00038	Wr_tx_pload con $A0 'def Tx payload register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00039	Flush_tx con $E1 'def flush Tx register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00040	Flush_rx con $E2 'def flush Rx register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00041	Reuse_tx_pl con $E3 'def reuse Tx payload register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00042	Nop_comm con $FF 'def No operation
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00044	Config_nrf con $00 'Config register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00045	En_aa con $01 'enable auto acknowledgment register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00046	En_rxaddr con $02 'enable RX addresses register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00047	Setup_aw con $03 'setup address width register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00048	Setup_retr con $04 'setup auto retrans register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00049	Rf_ch con $05 'RF channel register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00050	Rf_setup con $06 'RF setup register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00051	Stat_us con $07 'Status register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00052	Observe_tx con $08 'Observe TX register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00053	Cd con $09 'Carrier detect register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00054	Rx_addr_p0 con $0A 'RX address pipe0 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00055	Rx_addr_p1 con $0B 'RX address pipe1 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00056	Rx_addr_p2 con $0C 'RX address pipe2 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00057	Rx_addr_p3 con $0D 'RX address pipe3 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00058	Rx_addr_p4 con $0E 'RX address pipe4 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00059	Rx_addr_p5 con $0F 'RX address pipe5 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00060	Tx_addr con $10 'TX address register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00061	Rx_pw_p0 con $11 'RX payload width pipe0 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00062	Rx_pw_p1 con $12 'RX payload width pipe1 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00063	Rx_pw_p2 con $13 'RX payload width pipe2 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00064	Rx_pw_p3 con $14 'RX payload width pipe3 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00065	Rx_pw_p4 con $15 'RX payload width pipe4 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00066	Rx_pw_p5 con $16 'RX payload width pipe5 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00067	Fifo_status con $17 'FIFO status register register address

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00069	goto endRFM73
	GOTO?L	_endRFM73

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00070	initModule:

	LABEL?L	_initModule	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00071	pause 200
	PAUSE?C	0C8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00073	SSPEN = 1 'enable SPI pins
	MOVE?CT	001h, _SSPEN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00074	SSPCON.0=1 'SPI rate=OSC/16
	MOVE?CT	001h, _SSPCON_0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00075	CKP = 0 'clock idle low
	MOVE?CT	000h, _CKP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00076	CKE = 1 'transmit on active to idle
	MOVE?CT	001h, _CKE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00077	SSPIF = 0 'clear buffer full status
	MOVE?CT	000h, _SSPIF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00078	SMP = 0 'sample in middle of data
	MOVE?CT	000h, _SMP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00080	Ce=1 'init spi pins
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00081	pause 10 'wait 10 ms hardware is stable
	PAUSE?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00082	Ce=0 'set CE pin low disable Rx
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00083	CSN=0 'set CSN pin low
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00084	Pack_count=0 'number of packets sent
	MOVE?CW	000h, _Pack_count

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00085	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00087	commonRXTX:

	LABEL?L	_commonRXTX	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00088	data_out[0]=Write_reg+Rx_addr_p0 'Rx address for pipe0
	MOVE?CB	02Ah, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00089	gosub setRxAddressPipe
	GOSUB?L	_setRxAddressPipe

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00090	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00091	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00092	data_out[0]=Write_reg+En_aa 'enable auto ACK pipe0
	MOVE?CB	021h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00093	data_out[1]=%00000001 '1 enable, 0 disable
	MOVE?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00095	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00096	data_out[0]=Write_reg+En_rxaddr 'enable Rx address pipe0
	MOVE?CB	022h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00097	data_out[1]=$01
	MOVE?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00098	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00099	data_out[0]=Write_reg+Rf_ch 'Set RF channel
	MOVE?CB	025h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00100	READ 0, data_out[1] 'number of channel used
	READ?CB	000h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00101	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00102	data_out[0]=Write_reg+Rx_pw_p0 'Set Rx pload width pipe0
	MOVE?CB	031h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00103	data_out[1]=payloadLength 'number of bytes used in data sent
	MOVE?CB	_payloadLength, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00104	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00105	data_out[0]=Write_reg+Rf_setup 'Set RF: 'Set RF:5dbm
	MOVE?CB	026h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00106	data_out[1]=%00100111 '250kbit
	MOVE?CB	027h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00108	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00110	temp_byte_rfm = 1
	MOVE?CB	001h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00111	gosub setBank
	GOSUB?L	_setBank

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00112	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	000h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00112	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	040h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00112	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00112	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	001h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00112	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	0E2h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00113	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	001h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	0C0h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00114	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00115	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0D0h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0FCh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	08Ch, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00116	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00117	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	003h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	099h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	000h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	039h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00118	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	041h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00119	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	004h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	0D9h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	096h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	082h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00120	temp_byte_rfm = 4 : temp1_byte_rfm = $D9 : temp2_byte_rfm = $96 : temp3_byte_rfm = $82 : temp4_byte_rfm = $1B
	MOVE?CB	01Bh, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00121	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	005h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	028h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	002h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	07Fh, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00122	temp_byte_rfm = 5 : temp1_byte_rfm = $28 : temp2_byte_rfm = $02 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	0A6h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00123	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	00Ch, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	012h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	073h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00124	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00125	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	00Dh, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	046h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	0B4h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	080h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00126	temp_byte_rfm = 13 : temp1_byte_rfm = $46 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00127	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00128	data_out[0]=Write_reg+$0E
	MOVE?CB	02Eh, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00129	data_out[1]=$41
	MOVE?CB	041h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00130	data_out[2]=$20
	MOVE?CB	020h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00131	data_out[3]=$08
	MOVE?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00132	data_out[4]=$04
	MOVE?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00133	data_out[5]=$81
	MOVE?CB	081h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00134	data_out[6]=$20
	MOVE?CB	020h, _data_out + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00135	data_out[7]=$CF
	MOVE?CB	0CFh, _data_out + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00136	data_out[8]=$F7
	MOVE?CB	0F7h, _data_out + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00137	data_out[9]=$FE
	MOVE?CB	0FEh, _data_out + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00138	data_out[10]=$FF
	MOVE?CB	0FFh, _data_out + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00139	data_out[11]=$FF
	MOVE?CB	0FFh, _data_out + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00140	num_byte=11
	MOVE?CB	00Bh, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00141	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00142	temp_byte_rfm = 0
	MOVE?CB	000h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00143	gosub setBank
	GOSUB?L	_setBank

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00144	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00146	setBank:

	LABEL?L	_setBank	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00147	data_out[0]=Read_reg+$07
	MOVE?CB	007h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00148	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00149	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00150	if (temp_byte_rfm != (data_in[0] & $80)) then
	AND?BCW	_data_in, 080h, T1
	CMPEQ?BWL	_temp_byte_rfm, T1, L00002

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00152	    data_out[0]=$50
	MOVE?CB	050h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00153	    data_out[1]=$53    
	MOVE?CB	053h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00154	    gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00155	endif
	LABEL?L	L00002	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00156	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00158	conf4bytes:

	LABEL?L	_conf4bytes	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00159	data_out[0]=Write_reg+temp_byte_rfm
	ADD?CBB	_Write_reg, _temp_byte_rfm, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00160	data_out[1]=temp1_byte_rfm
	MOVE?BB	_temp1_byte_rfm, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00161	data_out[2]=temp2_byte_rfm
	MOVE?BB	_temp2_byte_rfm, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00162	data_out[3]=temp3_byte_rfm
	MOVE?BB	_temp3_byte_rfm, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00163	data_out[4]=temp4_byte_rfm
	MOVE?BB	_temp4_byte_rfm, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00164	num_byte=4
	MOVE?CB	004h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00165	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00166	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00168	sendData:

	LABEL?L	_sendData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00169	pause 30
	PAUSE?C	01Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00170	GOSUB debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00171	data_out[0]=Flush_tx 'flush TX_fifo buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00172	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00173	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00174	data_out[0]=Write_reg+Stat_us 'reset IRQ bits
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00175	data_out[1]=%00110000
	MOVE?CB	030h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00176	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00177	gosub setup_tx 'setup Tx
	GOSUB?L	_setup_tx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00178	data_out[0]=Wr_tx_pload 'put 10 bytes data in Tx pload buffer
	MOVE?CB	_Wr_tx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00179	data_out[1]=device_id
	MOVE?BB	_device_id, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00180	for w = 2 to payloadLength+1
	MOVE?CB	002h, _w
	LABEL?L	L00004	
	CMPGT?BCL	_w, 017h, L00005

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00181	    data_out[w]=temp_data[w-2]
	SUB?BCW	_w, 002h, T1
	AOUT?BWB	_temp_data, T1, T1
	AIN?BBB	T1, _data_out, _w

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00182	    if data_out[w] == 10 then contSendX1
	AOUT?BBB	_data_out, _w, T1
	CMPEQ?BCL	T1, 00Ah, _contSendX1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00183	next w
	NEXT?BCL	_w, 001h, L00004
	LABEL?L	L00005	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00184	:contSendX1

	LABEL?L	_contSendX1	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00185	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00186	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00187	pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00188	Ce=1 'CE=1 (toggle) transmit FIFO buffer
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00189	Pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00190	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00191	Pause 1
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00192	trans_irq:

	LABEL?L	_trans_irq	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00193	If Irq !=0 then trans_irq 'wait until IRQ, active low
	CMPNE?TCL	_Irq, 000h, _trans_irq

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00194	data_out[0]=Stat_us 'read status register
	MOVE?CB	_Stat_us, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00195	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00196	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00197	val=data_in[0]&%01110000 'mask the IRQ bits STATUS byte
	AND?BCB	_data_in, 070h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00198	if (val = Max_rt) then gosub max_retry 'maximum TX retries
	CMPNE?BCL	_val, _Max_rt, L00006
	GOSUB?L	_max_retry
	LABEL?L	L00006	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00199	if (val = Tx_inter) then gosub tx_int 'Tx interrupted
	CMPNE?BCL	_val, _Tx_inter, L00008
	GOSUB?L	_tx_int
	LABEL?L	L00008	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00200	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00201	data_out[1]=%00100000 'clear TX_DS IRQ bit
	MOVE?CB	020h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00202	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00203	gosub debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00204	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00207	debounce:

	LABEL?L	_debounce	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00208	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00209	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00210	Ce=1
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00211	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00212	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00213	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00214	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00216	spi_write1:

	LABEL?L	_spi_write1	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00217	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00218	spi_write:

	LABEL?L	_spi_write	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00219	CSN=0
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00220	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00010	
	CMPGT?BBL	_w, _num_byte, L00011

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00221	SSPBUF=data_out[w] 'send array variable
	AOUT?BBB	_data_out, _w, SSPBUF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00222	GoSub buffer_ok 'wait until buffer ready
	GOSUB?L	_buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00223	Next w 'next location
	NEXT?BCL	_w, 001h, L00010
	LABEL?L	L00011	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00224	CSN=1
	MOVE?CT	001h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00225	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00227	spi_read:

	LABEL?L	_spi_read	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00228	CSN=0
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00229	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00012	
	CMPGT?BBL	_w, _num_byte, L00013

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00230	    SSPBUF = data_out[0] 'write to SSPBUF to start clock
	MOVE?BB	_data_out, SSPBUF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00231	    GoSub buffer_ok 'wait for receipt
	GOSUB?L	_buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00232	data_in[w] = SSPBUF 'store received character in array
	AIN?BBB	SSPBUF, _data_in, _w

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00233	Next w 'get next byte
	NEXT?BCL	_w, 001h, L00012
	LABEL?L	L00013	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00234	CSN=1
	MOVE?CT	001h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00235	Return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00236	buffer_ok:

	LABEL?L	_buffer_ok	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00237	IF SSPIF = 0 Then buffer_ok 'wait for SPI interupt flag
	CMPEQ?TCL	_SSPIF, 000h, _buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00238	SSPIF = 0 'reset flag
	MOVE?CT	000h, _SSPIF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00239	Return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00241	max_retry:

	LABEL?L	_max_retry	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00242	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00243	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00244	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00245	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00246	data_out[1]=%00010000 'clear MAX_RT IRQ bit
	MOVE?CB	010h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00247	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00248	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00250	tx_int:

	LABEL?L	_tx_int	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00251	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00252	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00253	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00254	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00255	data_out[1]=%00110000 'clear TX_DS & MAX_RT IRQ bit
	MOVE?CB	030h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00256	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00257	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00259	setup_rx:

	LABEL?L	_setup_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00260	gosub debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00261	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00262	data_out[1]=$0F
	MOVE?CB	00Fh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00263	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00264	gosub debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00265	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00267	setup_sleep:

	LABEL?L	_setup_sleep	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00268	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=0, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00269	data_out[1]=%00001101
	MOVE?CB	00Dh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00270	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00271	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00273	setup_tx:

	LABEL?L	_setup_tx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00274	data_out[0]=Write_reg+Tx_addr 'Tx address
	MOVE?CB	030h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00275	gosub setTxAddressPipe
	GOSUB?L	_setTxAddressPipe

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00276	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00277	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00278	data_out[0]= Write_reg+Setup_retr 'Set retransmit @ ACK
	MOVE?CB	024h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00279	data_out[1]= %11111111 '15x re-transmit (default)
	MOVE?CB	0FFh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00280	Gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00281	data_out[0]=Write_reg+Config_nrf 'Config:PRX=0,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00282	data_out[1]=$0E
	MOVE?CB	00Eh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00283	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00284	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00286	ackData:

	LABEL?L	_ackData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00287	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00289	sameFlag = 1
	MOVE?CB	001h, _sameFlag

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00290	for i=0 to payloadLengthD - 1
	MOVE?CB	000h, _i
	LABEL?L	L00014	
	CMPGT?BCL	_i, 017h, L00015

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00291	    if (data_received[i] != data_in[i]) then sameFlag = 0
	AOUT?BBB	_data_received, _i, T1
	AOUT?BBB	_data_in, _i, T2
	CMPEQ?BBL	T1, T2, L00016
	MOVE?CB	000h, _sameFlag
	LABEL?L	L00016	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00292	    data_received[i] = data_in[i]
	AOUT?BBB	_data_in, _i, T1
	AIN?BBB	T1, _data_received, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00293	    if (data_received[i] == 10) then cntAckData
	AOUT?BBB	_data_received, _i, T1
	CMPEQ?BCL	T1, 00Ah, _cntAckData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00294	next i
	NEXT?BCL	_i, 001h, L00014
	LABEL?L	L00015	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00295	:cntAckData

	LABEL?L	_cntAckData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00296	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00297	data_out[0]=Fifo_status 'Read FIFO status
	MOVE?CB	_Fifo_status, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00298	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00299	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00300	val= data_in[1] 'FIFO status register
	MOVE?BB	_data_in + 00001h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00301	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	CMPEQ?TCL	_val_0, 000h, _lop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00302	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00303	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	MOVE?CB	040h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00304	gosub spi_write1
	GOSUB?L	_spi_write1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00305	pause 2 'wait 2ms Rx<->Tx
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00306	if (sameFlag == 1) then Main_rx
	CMPEQ?BCL	_sameFlag, 001h, _Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00307	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM73.PBP	00309	:endRFM73

	LABEL?L	_endRFM73	
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00024	 DEFINE OSC 8
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00026	 DEFINE ADC_BITS 10 ' ADCIN resolution (Bits)
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00027	 DEFINE ADC_CLOCK 3 ' ADC clock source (Fosc/32)
; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00028	 DEFINE ADC_SAMPLEUS 50 ' ADC sampling time (uSec)

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00029	 ADCON0.7 = 1
	MOVE?CT	001h, _ADCON0_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00031	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00032	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00033	 ANSELH = %00001000
	MOVE?CB	008h, ANSELH

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00034	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00035	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00038	 INTCON = %10101000
	MOVE?CB	0A8h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00039	 PIE1 = %00000000
	MOVE?CB	000h, PIE1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00040	 OPTION_REG = %00000100
	MOVE?CB	004h, OPTION_REG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00042	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00043	ENABLE
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00045	TRISA = %00110000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	030h, TRISA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00046	TRISB = %00110000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	030h, TRISB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00047	TRISC = %00000100 'Set IRQ input,
	ICALL?L	L00001
	MOVE?CB	004h, TRISC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00048	WPUA = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00049	WPUB = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00098	startProgLabel:

	LABEL?L	_startProgLabel	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00099	clear
	ICALL?L	L00001
	CLEAR?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00100	input MOVE_SENSOR
	ICALL?L	L00001
	INPUT?T	_MOVE_SENSOR

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00101	read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00102	READ 12, motorFullRangeTicks.highbyte
	ICALL?L	L00001
	READ?CB	00Ch, _motorFullRangeTicks_HIGHBYTE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00103	read 13, motorFullRangeTicks.lowbyte
	ICALL?L	L00001
	READ?CB	00Dh, _motorFullRangeTicks_LOWBYTE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00104	read 11, sleep_period
	ICALL?L	L00001
	READ?CW	00Bh, _sleep_period

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00105	read 14, temperatureExp
	ICALL?L	L00001
	READ?CB	00Eh, _temperatureExp

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00106	read 15, ANALOG_PERCENTAGE
	ICALL?L	L00001
	READ?CB	00Fh, _ANALOG_PERCENTAGE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00107	gosub motorStopInt
	ICALL?L	L00001
	GOSUB?L	_motorStopInt

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00108	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00109	if (device_id != 0) then mode = 4
	ICALL?L	L00001
	CMPEQ?BCL	_device_id, 000h, L00018
	MOVE?CB	004h, _mode
	LABEL?L	L00018	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00110	commonSettings:

	LABEL?L	_commonSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00111	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00114	Main_rx:

	LABEL?L	_Main_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00115	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00116	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00117	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00118	irqLoop:

	LABEL?L	_irqLoop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00119	if RESET_BUTTON_FLAG == 1 then
	ICALL?L	L00001
	CMPNE?BCL	_RESET_BUTTON_FLAG, 001h, L00020

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00120	    RESET_BUTTON_FLAG = 0
	ICALL?L	L00001
	MOVE?CB	000h, _RESET_BUTTON_FLAG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00121	    DISABLE
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00122	    write 0, 40
	WRITE?CC	000h, 028h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00123	    write 1, "R"
	WRITE?CC	001h, 052h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00124	    write 2, "E"
	WRITE?CC	002h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00125	    write 3, "M"
	WRITE?CC	003h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00126	    write 4, "O"
	WRITE?CC	004h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00127	    write 5, "T"
	WRITE?CC	005h, 054h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00128	    write 6, "E"
	WRITE?CC	006h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00129	    write 7, "H"
	WRITE?CC	007h, 048h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00130	    write 8, "O"
	WRITE?CC	008h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00131	    write 9, "M"
	WRITE?CC	009h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00132	    write 10, 0
	WRITE?CC	00Ah, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00133	    write 11, 1
	WRITE?CC	00Bh, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00134	    write 12, 0
	WRITE?CC	00Ch, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00135	    write 13, 0
	WRITE?CC	00Dh, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00136	    write 14, 44
	WRITE?CC	00Eh, 02Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00137	    write 15, 90
	WRITE?CC	00Fh, 05Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00138	    ENABLE
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00139	    pause 1000
	ICALL?L	L00001
	PAUSE?C	003E8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00140	    goto startProgLabel
	ICALL?L	L00001
	GOTO?L	_startProgLabel

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00141	endif
	ICALL?L	L00001
	LABEL?L	L00020	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00142	if (mode == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 001h, L00022

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00143	    if (sleep_period != 0) then
	ICALL?L	L00001
	CMPEQ?WCL	_sleep_period, 000h, L00024

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00144	       mode = 2
	ICALL?L	L00001
	MOVE?CB	002h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00145	       seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00146	       ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00148	      gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00149	    endif
	ICALL?L	L00001
	LABEL?L	L00024	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00150	endif
	ICALL?L	L00001
	LABEL?L	L00022	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00151	if (mode == 3) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 003h, L00026

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00152	      if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00028

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00153	          gosub sendCurrentPosition
	ICALL?L	L00001
	GOSUB?L	_sendCurrentPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00154	          gosub setModeBasedOnSleepPeriod
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00155	      endif
	ICALL?L	L00001
	LABEL?L	L00028	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00156	endif
	ICALL?L	L00001
	LABEL?L	L00026	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00158	if (temp_data[0] != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_data, 000h, L00030

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00159	    if (configure == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_configure, 001h, L00032

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00160	        gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00161	        mode = 4
	ICALL?L	L00001
	MOVE?CB	004h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00162	        configure = 0
	ICALL?L	L00001
	MOVE?CB	000h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00163	    endif
	ICALL?L	L00001
	LABEL?L	L00032	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00164	    gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00165	    temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00166	    GOTO main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00167	endif
	ICALL?L	L00001
	LABEL?L	L00030	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00168	if (mode == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 002h, L00034

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00169	    if (seconds > 2) then
	ICALL?L	L00001
	CMPLE?BCL	_seconds, 002h, L00036

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00171	      if (temperatureExp != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temperatureExp, 000h, L00038

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00172	         if (temperature.11 != 1) then                          
	ICALL?L	L00001
	CMPEQ?TCL	_temperature_11, 001h, L00040

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00173	             if (temperatureExp > temp3_byte) then
	ICALL?L	L00001
	CMPLE?BBL	_temperatureExp, _temp3_byte, L00042

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00174	                temp2_byte = temperatureExp - temp3_byte
	ICALL?L	L00001
	SUB?BBB	_temperatureExp, _temp3_byte, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00175	                if (temp3_byte < 7) then
	ICALL?L	L00001
	CMPGE?BCL	_temp3_byte, 007h, L00044

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00176	                    temp_byte = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00177	                else
	ICALL?L	L00001
	GOTO?L	L00045
	LABEL?L	L00044	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00178	                        if (temp2_byte == 3) then
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 003h, L00046

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00179	                            temp_byte = 50
	ICALL?L	L00001
	MOVE?CB	032h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00180	                        else
	ICALL?L	L00001
	GOTO?L	L00047
	LABEL?L	L00046	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00181	                            if (temp2_byte == 2) then
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 002h, L00048

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00182	                                temp_byte = 60
	ICALL?L	L00001
	MOVE?CB	03Ch, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00183	                            else
	ICALL?L	L00001
	GOTO?L	L00049
	LABEL?L	L00048	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00184	                                if (temp2_byte == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 001h, L00050

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00185	                                    temp_byte = 75
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00186	                                else
	ICALL?L	L00001
	GOTO?L	L00051
	LABEL?L	L00050	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00187	                                    temp_byte = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00188	                                endif
	ICALL?L	L00001
	LABEL?L	L00051	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00189	                            endif
	ICALL?L	L00001
	LABEL?L	L00049	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00190	                        endif
	ICALL?L	L00001
	LABEL?L	L00047	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00191	                endif
	ICALL?L	L00001
	LABEL?L	L00045	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00192	             else
	ICALL?L	L00001
	GOTO?L	L00043
	LABEL?L	L00042	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00193	                temp_byte = 100
	ICALL?L	L00001
	MOVE?CB	064h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00194	             endif
	ICALL?L	L00001
	LABEL?L	L00043	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00195	         else
	ICALL?L	L00001
	GOTO?L	L00041
	LABEL?L	L00040	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00197	            temp_byte = 0          
	ICALL?L	L00001
	MOVE?CB	000h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00198	         endif
	ICALL?L	L00001
	LABEL?L	L00041	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00199	         gosub setup_sleep
	ICALL?L	L00001
	GOSUB?L	_setup_sleep

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00200	         gosub setValveToPosition
	ICALL?L	L00001
	GOSUB?L	_setValveToPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00201	         dummy = 0
	ICALL?L	L00001
	MOVE?CB	000h, _Dummy

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00202	         waitMotorStop:

	LABEL?L	_waitMotorStop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00203	         if (motorRunning != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_motorRunning, 000h, L00052

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00204	                dummy = 1
	ICALL?L	L00001
	MOVE?CB	001h, _Dummy

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00205	                goto waitMotorStop
	ICALL?L	L00001
	GOTO?L	_waitMotorStop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00206	         endif
	ICALL?L	L00001
	LABEL?L	L00052	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00207	         gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00208	         if (dummy == 1) then 
	ICALL?L	L00001
	CMPNE?BCL	_Dummy, 001h, L00054

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00209	             gosub sendCurrentPosition
	ICALL?L	L00001
	GOSUB?L	_sendCurrentPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00210	             gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00211	             temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00212	         endif
	ICALL?L	L00001
	LABEL?L	L00054	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00213	      endif      
	ICALL?L	L00001
	LABEL?L	L00038	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00214	      INTCON = 0
	ICALL?L	L00001
	MOVE?CB	000h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00215	      OSCCON = %00010000
	ICALL?L	L00001
	MOVE?CB	010h, OSCCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00216	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00217	      gosub setup_sleep
	ICALL?L	L00001
	GOSUB?L	_setup_sleep

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00218	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00219	      sleep sleep_period * 10
	ICALL?L	L00001
	MUL?WCW	_sleep_period, 00Ah, T1
	SLEEP?W	T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00220	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00221	      seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00222	      ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00223	      OSCCON = %01110000
	ICALL?L	L00001
	MOVE?CB	070h, OSCCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00224	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00225	      INTCON = %10101000
	ICALL?L	L00001
	MOVE?CB	0A8h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00226	      OPTION_REG = %00000100
	ICALL?L	L00001
	MOVE?CB	004h, OPTION_REG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00227	      mode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00228	      goto commonSettings
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00229	    endif
	ICALL?L	L00001
	LABEL?L	L00036	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00230	endif
	ICALL?L	L00001
	LABEL?L	L00034	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00231	if (mode == 4) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 004h, L00056

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00232	    temp_data[0] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00233	    temp_data[1] = "s"
	ICALL?L	L00001
	MOVE?CB	073h, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00234	    temp_data[2] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00235	    temp_data[3] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00236	    motorAnalogValue = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValue

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00237	    motorAnalogValueSeconds = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueSeconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00238	    motorAnalogValueTmpTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00239	    motorAnalogValueTmp = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00240	    mode = 5    
	ICALL?L	L00001
	MOVE?CB	005h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00241	    gosub MotorOpenHead
	ICALL?L	L00001
	GOSUB?L	_MotorOpenHead

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00242	endif
	ICALL?L	L00001
	LABEL?L	L00056	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00243	if (mode == 5) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 005h, L00058

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00244	    if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00060

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00245	        motorAnalogValue = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValue

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00246	        motorAnalogValueSeconds = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueSeconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00247	        motorAnalogValueTmpTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00248	        motorAnalogValueTmp = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00249	        mode = 6
	ICALL?L	L00001
	MOVE?CB	006h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00250	        motorCurrentTicks = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorCurrentTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00251	        gosub MotorCloseHead
	ICALL?L	L00001
	GOSUB?L	_MotorCloseHead

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00252	    endif
	ICALL?L	L00001
	LABEL?L	L00060	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00253	endif
	ICALL?L	L00001
	LABEL?L	L00058	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00254	if (mode == 6) then
	ICALL?L	L00001
	CMPNE?BCL	_mode, 006h, L00062

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00255	    if (motorRunning == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_motorRunning, 000h, L00064

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00256	        motorFullRangeTicks = motorCurrentTicks
	ICALL?L	L00001
	MOVE?WW	_motorCurrentTicks, _motorFullRangeTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00257	        write 12, motorFullRangeTicks.highbyte
	ICALL?L	L00001
	WRITE?CB	00Ch, _motorFullRangeTicks_HIGHBYTE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00258	        write 13, motorFullRangeTicks.lowbyte
	ICALL?L	L00001
	WRITE?CB	00Dh, _motorFullRangeTicks_LOWBYTE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00259	        TEMP_data[0] = "A"
	ICALL?L	L00001
	MOVE?CB	041h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00260	        TEMP_data[1] = "e"
	ICALL?L	L00001
	MOVE?CB	065h, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00261	        gosub setModeBasedOnSleepPeriod    
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00262	    endif
	ICALL?L	L00001
	LABEL?L	L00064	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00263	endif
	ICALL?L	L00001
	LABEL?L	L00062	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00264	if (mode > 2) then irqLoop
	ICALL?L	L00001
	CMPGT?BCL	_mode, 002h, _irqLoop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00265	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00266	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00267	lop:

	LABEL?L	_lop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00268	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	ICALL?L	L00001
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00269	num_byte=payloadLength
	ICALL?L	L00001
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00270	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00271	gosub ackData
	ICALL?L	L00001
	GOSUB?L	_ackData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00273	temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00274	if (data_in[1] == device_id) then
	ICALL?L	L00001
	CMPNE?BBL	_data_in + 00001h, _device_id, L00066

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00275	    if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00068

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00276	        if (data_in[2] == "c") then        
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 063h, L00070

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00278	            for i = 0 to 10
	ICALL?L	L00001
	MOVE?CB	000h, _i
	LABEL?L	L00072	
	CMPGT?BCL	_i, 00Ah, L00073

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00279	                disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00280	                write i, data_in[i+4]
	ADD?BCW	_i, 004h, T1
	AOUT?BWB	_data_in, T1, T1
	WRITE?BB	_i, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00281	                enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00282	            next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00072
	LABEL?L	L00073	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00283	            read 10, device_id            
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00284	            pause 250
	ICALL?L	L00001
	PAUSE?C	0FAh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00285	            configure = 1
	ICALL?L	L00001
	MOVE?CB	001h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00286	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00287	        else
	ICALL?L	L00001
	GOTO?L	L00071
	LABEL?L	L00070	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00288	                        i = 4
	ICALL?L	L00001
	MOVE?CB	004h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00289	                        gosub convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00290	                        if (data_in[2] == "l") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 06Ch, L00074

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00291	                            if (temp_byte < 101) then 
	ICALL?L	L00001
	CMPGE?BCL	_temp_byte, 065h, L00076

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00292	                                gosub setValveToPosition
	ICALL?L	L00001
	GOSUB?L	_setValveToPosition

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00293	                                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00294	                            endif
	ICALL?L	L00001
	LABEL?L	L00076	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00295	                        else
	ICALL?L	L00001
	GOTO?L	L00075
	LABEL?L	L00074	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00296	                            if (data_in[2] == "m") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 06Dh, L00078

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00297	                                disable   
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00298	                                write 11, temp_byte
	WRITE?CB	00Bh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00299	                                enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00300	                                sleep_period = temp_byte
	ICALL?L	L00001
	MOVE?BW	_temp_byte, _sleep_period

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00301	                                gosub setModeBasedOnSleepPeriod
	ICALL?L	L00001
	GOSUB?L	_setModeBasedOnSleepPeriod

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00302	                                gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00303	                            else
	ICALL?L	L00001
	GOTO?L	L00079
	LABEL?L	L00078	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00304	                                if (data_in[2] == "t") then 
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 074h, L00080

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00305	                                    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00306	                                    write 14, temp_byte
	WRITE?CB	00Eh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00307	                                    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00308	                                    temperatureExp = temp_byte
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _temperatureExp

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00309	                                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00310	                                else
	ICALL?L	L00001
	GOTO?L	L00081
	LABEL?L	L00080	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00311	                                    if (data_in[2] == "n") then 
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 06Eh, L00082

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00312	                                        disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00313	                                        write 15, temp_byte
	WRITE?CB	00Fh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00314	                                        enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00315	                                        ANALOG_PERCENTAGE = temp_byte
	ICALL?L	L00001
	MOVE?BB	_temp_byte, _ANALOG_PERCENTAGE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00316	                                        gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00317	                                    endif
	ICALL?L	L00001
	LABEL?L	L00082	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00318	                                endif
	ICALL?L	L00001
	LABEL?L	L00081	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00319	                            endif
	ICALL?L	L00001
	LABEL?L	L00079	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00320	                        endif
	ICALL?L	L00001
	LABEL?L	L00075	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00321	        endif
	ICALL?L	L00001
	LABEL?L	L00071	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00322	    ELSE
	ICALL?L	L00001
	GOTO?L	L00069
	LABEL?L	L00068	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00323	        if (data_in[2] == "a") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 061h, L00084

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00324	            mode = 4
	ICALL?L	L00001
	MOVE?CB	004h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00325	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00326	        else
	ICALL?L	L00001
	GOTO?L	L00085
	LABEL?L	L00084	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00327	            if (data_in[2] == "p") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 070h, L00086

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00328	                if (data_in[3] == "n") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 06Eh, L00088

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00329	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00330	                endif
	ICALL?L	L00001
	LABEL?L	L00088	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00331	            ELSE
	ICALL?L	L00001
	GOTO?L	L00087
	LABEL?L	L00086	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00332	                if (data_in[2] == "s") then    
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 073h, L00090

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00333	                    gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00334	                endif
	ICALL?L	L00001
	LABEL?L	L00090	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00335	            endif
	ICALL?L	L00001
	LABEL?L	L00087	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00336	        endif
	ICALL?L	L00001
	LABEL?L	L00085	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00337	    endif
	ICALL?L	L00001
	LABEL?L	L00069	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00338	    if (temp_data[0] == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp_data, 000h, L00092

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00339	        temp_data[0] = "E"
	ICALL?L	L00001
	MOVE?CB	045h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00340	        temp_data[1] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00341	        temp_data[2] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00342	        temp_data[3] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00343	        temp_data[4] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00344	        temp_data[5] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00345	    endif
	ICALL?L	L00001
	LABEL?L	L00092	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00346	endif
	ICALL?L	L00001
	LABEL?L	L00066	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00347	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00348	end
	ICALL?L	L00001
	END?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00350	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00351	intManagement:

	LABEL?L	_intManagement	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00352	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON_2, 001h, L00094

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00353	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00354	           if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00096

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00355	                if (MOVE_SENSOR != moveSensorPrevious) then
	CMPEQ?TBL	_MOVE_SENSOR, _moveSensorPrevious, L00098

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00356	                    if (motorRunning == 1) then 
	CMPNE?BCL	_motorRunning, 001h, L00100

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00357	                        motorCurrentTicks = motorCurrentTicks + 1
	ADD?WCW	_motorCurrentTicks, 001h, _motorCurrentTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00358	                    else
	GOTO?L	L00101
	LABEL?L	L00100	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00359	                        motorCurrentTicks = motorCurrentTicks - 1
	SUB?WCW	_motorCurrentTicks, 001h, _motorCurrentTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00360	                    endif
	LABEL?L	L00101	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00361	                    moveSensorPrevious = MOVE_SENSOR
	MOVE?TB	_MOVE_SENSOR, _moveSensorPrevious

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00362	                endif
	LABEL?L	L00098	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00363	                if (motorCurrentTicks == motorExpectedTicks) then
	CMPNE?WWL	_motorCurrentTicks, _motorExpectedTicks, L00102

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00364	                    if (mode == 3) then
	CMPNE?BCL	_mode, 003h, L00104

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00365	                        gosub motorStopInt
	GOSUB?L	_motorStopInt

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00366	                    endif
	LABEL?L	L00104	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00367	                endif
	LABEL?L	L00102	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00368	                if ((ticks // 40) == 0) then
	MOD?BCW	_ticks, 028h, T1
	CMPNE?WCL	T1, 000h, L00106

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00369	                    if (mode > 3) then
	CMPLE?BCL	_mode, 003h, L00108

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00371	                            ADCIN 11, temp_word_int
	ADCIN?CW	00Bh, _temp_word_int

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00372	                            motorAnalogValueTmp = motorAnalogValueTmp + temp_word_int
	ADD?WWW	_motorAnalogValueTmp, _temp_word_int, _motorAnalogValueTmp

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00373	                            motorAnalogValueTmpTicks = motorAnalogValueTmpTicks + 1                            
	ADD?WCW	_motorAnalogValueTmpTicks, 001h, _motorAnalogValueTmpTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00374	                    endif
	LABEL?L	L00108	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00375	                endif
	LABEL?L	L00106	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00376	           endif
	LABEL?L	L00096	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00377	           If ticks < 241 Then tiexit
	CMPLT?BCL	_ticks, 0F1h, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00378	           if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00110

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00379	                if (motorCurrentTicks == motorTicksSecond) then
	CMPNE?WWL	_motorCurrentTicks, _motorTicksSecond, L00112

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00380	                    gosub motorStopInt
	GOSUB?L	_motorStopInt

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00381	                endif
	LABEL?L	L00112	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00382	                motorTicksSecond = motorCurrentTicks 
	MOVE?WW	_motorCurrentTicks, _motorTicksSecond

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00383	           endif
	LABEL?L	L00110	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00384	           if (mode > 3) then
	CMPLE?BCL	_mode, 003h, L00114

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00385	               if (motorRunning != 0) then
	CMPEQ?BCL	_motorRunning, 000h, L00116

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00386	                  temp_word_int = (motorAnalogValueTmp / motorAnalogValueTmpTicks)*10
	DIV?WWW	_motorAnalogValueTmp, _motorAnalogValueTmpTicks, T1
	MUL?WCW	T1, 00Ah, _temp_word_int

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00387	                  if (seconds == 2) then                          
	CMPNE?BCL	_seconds, 002h, L00118

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00388	                        motorAnalogValue = temp_word_int / 100
	DIV?WCW	_temp_word_int, 064h, _motorAnalogValue

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00389	                  endif
	LABEL?L	L00118	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00390	                  motorAnalogValueTmp = 0
	MOVE?CW	000h, _motorAnalogValueTmp

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00391	                  motorAnalogValueTmpTicks = 0
	MOVE?CW	000h, _motorAnalogValueTmpTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00392	                  if (temp_word_int/motorAnalogValue) < ANALOG_PERCENTAGE then
	DIV?WWW	_temp_word_int, _motorAnalogValue, T1
	CMPGE?WBL	T1, _ANALOG_PERCENTAGE, L00120

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00393	                      gosub motorStopInt  
	GOSUB?L	_motorStopInt

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00394	                  endif
	LABEL?L	L00120	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00395	               endif
	LABEL?L	L00116	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00396	           endif
	LABEL?L	L00114	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00397	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00398	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00399	           if seconds <= 58 then tiexit
	CMPLE?BCL	_seconds, 03Ah, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00400	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00401	           tiexit: 

	LABEL?L	_tiexit	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00402	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00403	        endif
	LABEL?L	L00094	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00404	        if (INTCON.0 == 1) then
	CMPNE?TCL	_INTCON_0, 001h, L00122

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00405	           INTCON.0 = 0
	MOVE?CT	000h, _INTCON_0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00406	           RESET_BUTTON_FLAG = 1
	MOVE?CB	001h, _RESET_BUTTON_FLAG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00407	        endif
	LABEL?L	L00122	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00408	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00409	resume
	RESUME?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00411	motorStopInt:

	LABEL?L	_motorStopInt	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00412	        low MOTOR_1
	LOW?T	_MOTOR_1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00413	        low MOTOR_2
	LOW?T	_MOTOR_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00414	        motorRunning = 0
	MOVE?CB	000h, _motorRunning

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00415	        LOW MOVE_SENSOR_power
	LOW?T	_MOVE_SENSOR_POWER

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00416	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00418	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00420	sendDataOK:

	LABEL?L	_sendDataOK	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00421	    temp_data[0] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00422	    temp_data[1] = "K"
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00423	    temp_data[2] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00424	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00426	convertInputData:

	LABEL?L	_convertInputData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00427	    temp_word = 0
	ICALL?L	L00001
	MOVE?CW	000h, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00428	    conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00429	    labelContReadDecimals:

	LABEL?L	_labelContReadDecimals	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00430	        if data_in[i] > 47 then
	ICALL?L	L00001
	AOUT?BBB	_data_in, _i, T1
	CMPLE?BCL	T1, 02Fh, L00124

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00431	            if data_in[i] < 58 then
	ICALL?L	L00001
	AOUT?BBB	_data_in, _i, T1
	CMPGE?BCL	T1, 03Ah, L00126

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00432	                conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00433	                TEMP_word = TEMP_word*10 + ((data_in[i]+2)-50)
	ICALL?L	L00001
	MUL?WCW	_temp_word, 00Ah, T1
	AOUT?BBB	_data_in, _i, T2
	ADD?BCW	T2, 002h, T2
	SUB?WCW	T2, 032h, T2
	ADD?WWW	T1, T2, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00434	                i=i+1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00435	                if (TEMP_word < 256) then goto labelContReadDecimals
	ICALL?L	L00001
	CMPGE?WCL	_temp_word, 00100h, L00128
	GOTO?L	_labelContReadDecimals
	LABEL?L	L00128	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00436	            endif
	ICALL?L	L00001
	LABEL?L	L00126	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00437	        endif
	ICALL?L	L00001
	LABEL?L	L00124	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00438	    if (TEMP_word > 255) then
	ICALL?L	L00001
	CMPLE?WCL	_temp_word, 0FFh, L00130

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00439	         conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00440	    else
	ICALL?L	L00001
	GOTO?L	L00131
	LABEL?L	L00130	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00441	        temp_byte = TEMP_word
	ICALL?L	L00001
	MOVE?WB	_temp_word, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00442	    endif
	ICALL?L	L00001
	LABEL?L	L00131	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00443	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00445	convertNoToStr:

	LABEL?L	_convertNoToStr	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00446	        temp3_byte = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCB	T1, 030h, _temp3_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00447	        temp2_byte = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCB	T1, 030h, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00448	        temp1_byte = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCB	T1, 030h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00449	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00451	MotorOpenHead:

	LABEL?L	_MotorOpenHead	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00452	    motorRunning = 2
	ICALL?L	L00001
	MOVE?CB	002h, _motorRunning

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00453	    HIGH MOTOR_1
	ICALL?L	L00001
	HIGH?T	_MOTOR_1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00454	    LOW MOTOR_2
	ICALL?L	L00001
	LOW?T	_MOTOR_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00455	    high MOVE_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_MOVE_SENSOR_POWER

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00456	    motorTicksSecond = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorTicksSecond

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00457	    ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00458	    seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00459	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00461	motorCloseHead:

	LABEL?L	_MotorCloseHead	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00462	    motorRunning = 1
	ICALL?L	L00001
	MOVE?CB	001h, _motorRunning

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00463	    HIGH MOTOR_2
	ICALL?L	L00001
	HIGH?T	_MOTOR_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00464	    LOW MOTOR_1
	ICALL?L	L00001
	LOW?T	_MOTOR_1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00465	    high MOVE_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_MOVE_SENSOR_POWER

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00466	    motorTicksSecond = 0
	ICALL?L	L00001
	MOVE?CW	000h, _motorTicksSecond

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00467	    ticks = 0
	ICALL?L	L00001
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00468	    seconds = 0
	ICALL?L	L00001
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00469	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00471	setValveToPosition:

	LABEL?L	_setValveToPosition	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00472	      disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00473	          temp_word = (motorFullRangeTicks * temp_byte) 
	MUL?WBW	_motorFullRangeTicks, _temp_byte, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00474	          motorExpectedTicks = DIV32 100   
	DIV32?CW	064h, _motorExpectedTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00475	      enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00476	      mode = 3
	ICALL?L	L00001
	MOVE?CB	003h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00477	      if (motorExpectedTicks != motorCurrentTicks) THEN
	ICALL?L	L00001
	CMPEQ?WWL	_motorExpectedTicks, _motorCurrentTicks, L00132

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00478	          if (motorExpectedTicks > motorCurrentTicks) then
	ICALL?L	L00001
	CMPLE?WWL	_motorExpectedTicks, _motorCurrentTicks, L00134

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00479	              GOSUB MotorCloseHead            
	ICALL?L	L00001
	GOSUB?L	_MotorCloseHead

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00480	          else
	ICALL?L	L00001
	GOTO?L	L00135
	LABEL?L	L00134	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00481	              GOSUB MotorOpenHead            
	ICALL?L	L00001
	GOSUB?L	_MotorOpenHead

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00482	          endif
	ICALL?L	L00001
	LABEL?L	L00135	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00483	      endif
	ICALL?L	L00001
	LABEL?L	L00132	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00484	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00486	sendCurrentPosition:

	LABEL?L	_sendCurrentPosition	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00487	      temp_data[0] = "l"
	ICALL?L	L00001
	MOVE?CB	06Ch, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00488	      i=1
	ICALL?L	L00001
	MOVE?CB	001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00489	      gosub printCurrentTicks
	ICALL?L	L00001
	GOSUB?L	_printCurrentTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00490	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00492	printCurrentTicks:

	LABEL?L	_printCurrentTicks	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00493	        temp_data[i] = "|"
	ICALL?L	L00001
	AIN?CBB	07Ch, _temp_data, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00494	        temp_byte = (motorCurrentTicks * 10) / (motorFullRangeTicks / 10)
	ICALL?L	L00001
	MUL?WCW	_motorCurrentTicks, 00Ah, T1
	DIV?WCW	_motorFullRangeTicks, 00Ah, T2
	DIV?WWB	T1, T2, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00495	        i=i+1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00496	        gosub printByteToTempByte
	ICALL?L	L00001
	GOSUB?L	_printByteToTempByte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00497	        temp_data[i+3] = 13
	ICALL?L	L00001
	ADD?BCW	_i, 003h, T1
	AIN?CBW	00Dh, _temp_data, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00498	        temp_data[i+4] = 10
	ICALL?L	L00001
	ADD?BCW	_i, 004h, T1
	AIN?CBW	00Ah, _temp_data, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00499	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00501	printByteToTempByte:        

	LABEL?L	_printByteToTempByte	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00502	        temp_data[i] = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBB	T1, _temp_data, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00503	print2LastBytesToTempByte:

	LABEL?L	_print2LastBytesToTempByte	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00504	        temp_data[i+1] = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	ADD?BCW	_i, 001h, T2
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBW	T1, _temp_data, T2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00505	        temp_data[i+2] = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	ADD?BCW	_i, 002h, T2
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCW	T1, 030h, T1
	AIN?WBW	T1, _temp_data, T2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00506	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00508	sendTemperature:

	LABEL?L	_sendTemperature	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00509	    high HEATING_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_HEATING_SENSOR_power

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00510	    pause 2
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00512	   OWOUT HEATING_SENSOR, 1, [$CC, $44] 'Skip ROM search & do temp conversion
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	001h
	OWOUT?C	0CCh
	OWOUT?C	044h
	OWEND?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00513	Wait_Up:

	LABEL?L	_Wait_Up	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00514	   OWIN HEATING_SENSOR, 4, [Busy]      'Read busy-bit
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	004h
	OWIN?T	_busy
	OWEND?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00515	   IF Busy = 0 THEN goto Wait_Up            'Still busy..?, Wait_Up..!
	ICALL?L	L00001
	CMPNE?TCL	_busy, 000h, L00136
	GOTO?L	_Wait_Up
	LABEL?L	L00136	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00516	   OWOUT HEATING_SENSOR, 1, [$CC, $BE] 'Skip ROM search & read scratchpad memory
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	001h
	OWOUT?C	0CCh
	OWOUT?C	0BEh
	OWEND?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00517	   OWIN HEATING_SENSOR, 2, [temperature.Lowbyte, temperature.Highbyte] 'Read two bytes / end comms
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	002h
	OWIN?B	_temperature_LOWBYTE
	OWIN?B	_temperature_HIGHBYTE
	OWEND?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00518	   low HEATING_SENSOR_power
	ICALL?L	L00001
	LOW?T	_HEATING_SENSOR_power

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00519	   temp_data[0] = "4"
	ICALL?L	L00001
	MOVE?CB	034h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00520	   temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00521	   if (temperature.11 == 1) then
	ICALL?L	L00001
	CMPNE?TCL	_temperature_11, 001h, L00138

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00522	        temp_data[2] = "-"
	ICALL?L	L00001
	MOVE?CB	02Dh, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00523	        disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00524	        Dummy = 625 * (~temperature+1)
	NOT?WW	_temperature, T1
	ADD?WCW	T1, 001h, T1
	MUL?CWB	00271h, T1, _Dummy

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00525	        TempC = DIV32 10
	DIV32?CW	00Ah, _TempC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00526	        enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00527	        temp_data[3] = (TempC DIG 4) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 004h, T1
	ADD?WCB	T1, 030h, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00528	        temp_data[4] = (TempC DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00529	   else
	ICALL?L	L00001
	GOTO?L	L00139
	LABEL?L	L00138	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00530	        disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00531	        Dummy = 625 * temperature
	MUL?CWB	00271h, _temperature, _Dummy

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00532	        TempC = DIV32 10
	DIV32?CW	00Ah, _TempC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00533	        enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00534	        TempC  = (temperature & $0FF0) >> 4 ' Mask middle 8-bits, shift into lower byte
	ICALL?L	L00001
	AND?WCW	_temperature, 00FF0h, T1
	SHIFTR?WCW	T1, 004h, _TempC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00535	        Float = ((temperature.Lowbyte & $0F) * 625) ' Lower 4-bits of result * 625
	ICALL?L	L00001
	AND?BCW	_temperature_LOWBYTE, 00Fh, T1
	MUL?WCW	T1, 00271h, _Float

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00536	        temp_data[2] = (TempC DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00537	        temp_data[3] = (TempC DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00538	        temp_data[4] = (Float DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_Float, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00539	        temp3_byte = TempC.lowbyte * 2
	ICALL?L	L00001
	MUL?BCB	_TempC_LOWBYTE, 002h, _temp3_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00540	        if ((temp_data[4] - $30) > 4) then temp3_byte = temp3_byte + 1
	ICALL?L	L00001
	SUB?BCW	_temp_data + 00004h, 030h, T1
	CMPLE?WCL	T1, 004h, L00140
	ADD?BCB	_temp3_byte, 001h, _temp3_byte
	LABEL?L	L00140	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00541	   endif
	ICALL?L	L00001
	LABEL?L	L00139	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00543	        VRCON.4 = 1 ; Turn 0.6V reference ON
	ICALL?L	L00001
	MOVE?CT	001h, _VRCON_4

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00544	        PAUSEUS 200 ; Allow VP6 to settle
	ICALL?L	L00001
	PAUSEUS?C	0C8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00545	        ADCIN 13, temp_word ; get VP6 analog reading (10-bit)
	ICALL?L	L00001
	ADCIN?CW	00Dh, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00546	        VRCON.4 = 0 ; Turn 0.6V reference OFF
	ICALL?L	L00001
	MOVE?CT	000h, _VRCON_4

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00547	        VDD = 6138 / temp_word ; convert to voltage ve vdd je 25 = 2,5 V        
	ICALL?L	L00001
	DIV?CWW	017FAh, _temp_word, _VDD

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00548	        temp_data[5] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00549	        temp_data[6] = (VDD DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_VDD, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00550	        temp_data[7] = (VDD DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_VDD, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00551	        temp_data[8] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00552	        temp_byte = sleep_period / 10
	ICALL?L	L00001
	DIV?WCB	_sleep_period, 00Ah, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00553	        i=9
	ICALL?L	L00001
	MOVE?CB	009h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00554	        gosub printByteToTempByte
	ICALL?L	L00001
	GOSUB?L	_printByteToTempByte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00555	        temp_data[12] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 0000Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00556	        i=12
	ICALL?L	L00001
	MOVE?CB	00Ch, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00557	        temp_byte = temperatureExp
	ICALL?L	L00001
	MOVE?BB	_temperatureExp, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00558	        gosub print2LastBytesToTempByte
	ICALL?L	L00001
	GOSUB?L	_print2LastBytesToTempByte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00559	        i=15
	ICALL?L	L00001
	MOVE?CB	00Fh, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00560	        gosub printCurrentTicks
	ICALL?L	L00001
	GOSUB?L	_printCurrentTicks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00561	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00563	setModeBasedOnSleepPeriod:

	LABEL?L	_setModeBasedOnSleepPeriod	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00564	    if (device_id == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_device_id, 000h, L00142

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00565	        mode = 0
	ICALL?L	L00001
	MOVE?CB	000h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00566	    else 
	ICALL?L	L00001
	GOTO?L	L00143
	LABEL?L	L00142	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00567	        if (sleep_period == 0) then 
	ICALL?L	L00001
	CMPNE?WCL	_sleep_period, 000h, L00144

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00568	            mode = 0
	ICALL?L	L00001
	MOVE?CB	000h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00569	        else     
	ICALL?L	L00001
	GOTO?L	L00145
	LABEL?L	L00144	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00570	            mode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _mode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00571	        endif
	ICALL?L	L00001
	LABEL?L	L00145	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00572	    endif
	ICALL?L	L00001
	LABEL?L	L00143	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00573	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00575	setRxAddressPipe:

	LABEL?L	_setRxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00576	READ 6, data_out[1]
	ICALL?L	L00001
	READ?CB	006h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00577	READ 7, data_out[2]
	ICALL?L	L00001
	READ?CB	007h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00578	READ 8, data_out[3]
	ICALL?L	L00001
	READ?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00579	READ 9, data_out[4]
	ICALL?L	L00001
	READ?CB	009h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00580	data_out[5] = device_id
	ICALL?L	L00001
	MOVE?BB	_device_id, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00581	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00583	setTxAddressPipe:

	LABEL?L	_setTxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00584	READ 1, data_out[1]
	ICALL?L	L00001
	READ?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00585	READ 2, data_out[2]
	ICALL?L	L00001
	READ?CB	002h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00586	READ 3, data_out[3]
	ICALL?L	L00001
	READ?CB	003h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00587	READ 4, data_out[4]
	ICALL?L	L00001
	READ?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00588	READ 5, data_out[5]
	ICALL?L	L00001
	READ?CB	005h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\HEATIN~1.PBP	00589	return
	ICALL?L	L00001
	RETURN?	

	END
