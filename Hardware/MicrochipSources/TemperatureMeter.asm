
; PicBasic Pro Compiler 2.46, (c) 1998, 2005 microEngineering Labs, Inc. All Rights Reserved.  
PM_USED			EQU	1

	INCLUDE	"16F690.INC"


; Define statements.
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4
#define		CODE_SIZE		 4
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00020	 DEFINE OSC 8
#define		OSC		 8
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00021	 DEFINE ADC_BITS 10
#define		ADC_BITS		 10
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00022	 DEFINE ADC_CLOCK 3 ' ADC clock source (Fosc/32)
#define		ADC_CLOCK		 3 
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00023	 DEFINE ADC_SAMPLEUS 50 ' ADC sampling time (uSec)
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00016	data_in var Byte[payloadLengthD] 'data received
_data_in         		EQU	RAM_START + 01Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00015	data_out VAR BYTE[payloadLengthD] 'data sent
_data_out        		EQU	RAM_START + 032h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00017	temp_data var byte[payloadLength]
_temp_data       		EQU	RAM_START + 04Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00074	Float       VAR WORD        
_Float           		EQU	RAM_START + 080h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00014	Pack_count VAR word 'number of packets sent
_Pack_count      		EQU	RAM_START + 082h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00071	sleep_period var word
_sleep_period    		EQU	RAM_START + 084h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00063	temp_word var word
_temp_word       		EQU	RAM_START + 086h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00073	TempC       VAR WORD
_TempC           		EQU	RAM_START + 088h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00077	temperature var word
_temperature     		EQU	RAM_START + 08Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00076	VDD         VAR WORD
_VDD             		EQU	RAM_START + 08Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00056	ci var byte
_ci              		EQU	RAM_START + 08Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00057	configure var byte
_configure       		EQU	RAM_START + 08Fh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00069	conversionSuccess VAR BYTE
_conversionSuccess		EQU	RAM_START + 090h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00025	device_id var byte
_device_id       		EQU	RAM_START + 091h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00072	Dummy       VAR BYTE
_Dummy           		EQU	RAM_START + 092h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00064	EEPROMBYTE      VAR BYTE
_EEPROMBYTE      		EQU	RAM_START + 093h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00065	EEPROMPOSITION  VAR BYTE
_EEPROMPOSITION  		EQU	RAM_START + 094h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00054	i VAR BYTE 'loop counter
_i               		EQU	RAM_START + 095h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00055	j var byte
_j               		EQU	RAM_START + 096h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00019	k VAR byte
_k               		EQU	RAM_START + 097h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00068	l1counter var byte
_l1counter       		EQU	RAM_START + 098h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00012	num_byte var byte 'temp value
_num_byte        		EQU	RAM_START + 099h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00001	'@  __config _INTRC_OSC_NOCLKOUT & _WDT_ON & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_ON & _PWRTE_ON
PB01            		EQU	RAM_START + 09Ah
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00053	RESET_BUTTON_FLAG var byte
_RESET_BUTTON_FLAG		EQU	RAM_START + 09Bh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00066	seconds  var     byte    ' Define second variable
_seconds         		EQU	RAM_START + 09Ch
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00070	sleepMode var byte
_sleepMode       		EQU	RAM_START + 09Dh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00060	temp1_byte var byte
_temp1_byte      		EQU	RAM_START + 09Eh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00021	temp1_byte_rfm var byte
_temp1_byte_rfm  		EQU	RAM_START + 09Fh
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00061	temp2_byte var byte
_temp2_byte      		EQU	RAM_START + 0A0h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00022	temp2_byte_rfm var byte
_temp2_byte_rfm  		EQU	RAM_START + 0A1h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00062	temp3_byte var byte
_temp3_byte      		EQU	RAM_START + 0A2h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00023	temp3_byte_rfm var byte
_temp3_byte_rfm  		EQU	RAM_START + 0A3h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00024	temp4_byte_rfm var byte
_temp4_byte_rfm  		EQU	RAM_START + 0A4h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00059	temp_byte var byte
_temp_byte       		EQU	RAM_START + 0A5h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00058	temp_byte_int var byte
_temp_byte_int   		EQU	RAM_START + 0A6h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00020	temp_byte_rfm var byte
_temp_byte_rfm   		EQU	RAM_START + 0A7h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00067	ticks   var     byte    ' Define pieces of seconds variable
_ticks           		EQU	RAM_START + 0A8h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00013	val var byte 'temp value
_val             		EQU	RAM_START + 0A9h
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00018	w var byte
_w               		EQU	RAM_START + 0AAh
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00021	PORTL   VAR     PORTA
_PORTL           		EQU	 PORTA
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00022	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00023	TRISL   VAR     TRISA
_TRISL           		EQU	 TRISA
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00024	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC
_temperature_LOWBYTE		EQU	_temperature
_temperature_HIGHBYTE		EQU	_temperature + 001h
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
#define _ADCON0_7        	 ADCON0, 007h
#define _ADCON0_0        	 ADCON0, 000h
#define _IOCA_4          	 IOCA, 004h
#define _PORTA_4         	 PORTA, 004h
#define _PORTC_1         	 PORTC, 001h
#define _val_0           	_val, 000h
#define _INTCON_2        	 INTCON, 002h
#define _INTCON_0        	 INTCON, 000h
#define _INTCON_7        	 INTCON, 007h
#define _temperature_11  	_temperature + 001h, 003h
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
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00016	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,0,0]
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

	INCLUDE	"TEMPER~1.MAC"
	INCLUDE	"PBPPIC14.LIB"


; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00012	BANK0   $0020, $007F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00013	BANK1   $00A0, $00EF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00014	BANK2   $0120, $016F
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00015	EEPROM  $2100, $21FF
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00016	LIBRARY "PBPPIC14"
; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00017	DEFINE  CODE_SIZE 4

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00019	        include "PIC14EXT.BAS"

; C:\PICDEV~1\PBP\PBP246\16F690.BAS	00026	        include "PBPPIC14.RAM"

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00003	@ DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ASM?
 DEVICE PIC16F690,INTRC_OSC_NOCLKOUT

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00004	@ DEVICE PIC16F690,WDT_ON

	ASM?
 DEVICE PIC16F690,WDT_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00005	@ DEVICE PIC16F690,MCLR_ON

	ASM?
 DEVICE PIC16F690,MCLR_ON

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00006	@ DEVICE PIC16F690,CPD_OFF

	ASM?
 DEVICE PIC16F690,CPD_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00007	@ DEVICE PIC16F690,BOD_OFF

	ASM?
 DEVICE PIC16F690,BOD_OFF

	ENDASM?


; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00008	@ DEVICE PIC16F690,PWRT_OFF

	ASM?
 DEVICE PIC16F690,PWRT_OFF

	ENDASM?

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00016	EEPROM  0, [40,"R","E","M","O","T","E","H","O","M",0,1,0,0,0,0]

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00018	INCLUDE "RFM70.pbp"
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00010	payloadLength con 22
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00011	payloadLengthD con 24
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00028	Idle_int con $00 'Idle no interrupt pending
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00029	Max_rt con $10 'Max # of Tx retrans interrupt
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00030	Tx_inter con $30 'Tx interrupted
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00031	Rx_ds con $40 'Rx data received
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00033	Read_reg con $00 'def read command to register
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00034	Write_reg CON $20 'def write command to register
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00035	Rd_rx_pload con $61 'def Rx payload register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00036	Wr_tx_pload con $A0 'def Tx payload register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00037	Flush_tx con $E1 'def flush Tx register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00038	Flush_rx con $E2 'def flush Rx register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00039	Reuse_tx_pl con $E3 'def reuse Tx payload register command
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00040	Nop_comm con $FF 'def No operation
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00042	Config_nrf con $00 'Config register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00043	En_aa con $01 'enable auto acknowledgment register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00044	En_rxaddr con $02 'enable RX addresses register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00045	Setup_aw con $03 'setup address width register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00046	Setup_retr con $04 'setup auto retrans register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00047	Rf_ch con $05 'RF channel register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00048	Rf_setup con $06 'RF setup register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00049	Stat_us con $07 'Status register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00050	Observe_tx con $08 'Observe TX register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00051	Cd con $09 'Carrier detect register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00052	Rx_addr_p0 con $0A 'RX address pipe0 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00053	Rx_addr_p1 con $0B 'RX address pipe1 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00054	Rx_addr_p2 con $0C 'RX address pipe2 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00055	Rx_addr_p3 con $0D 'RX address pipe3 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00056	Rx_addr_p4 con $0E 'RX address pipe4 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00057	Rx_addr_p5 con $0F 'RX address pipe5 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00058	Tx_addr con $10 'TX address register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00059	Rx_pw_p0 con $11 'RX payload width pipe0 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00060	Rx_pw_p1 con $12 'RX payload width pipe1 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00061	Rx_pw_p2 con $13 'RX payload width pipe2 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00062	Rx_pw_p3 con $14 'RX payload width pipe3 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00063	Rx_pw_p4 con $15 'RX payload width pipe4 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00064	Rx_pw_p5 con $16 'RX payload width pipe5 register address
; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00065	Fifo_status con $17 'FIFO status register register address

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00067	goto endRFM70
	GOTO?L	_endRFM70

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00068	initModule:

	LABEL?L	_initModule	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00069	pause 200
	PAUSE?C	0C8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00071	SSPEN = 1 'enable SPI pins
	MOVE?CT	001h, _SSPEN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00072	SSPCON.0=1 'SPI rate=OSC/16
	MOVE?CT	001h, _SSPCON_0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00073	CKP = 0 'clock idle low
	MOVE?CT	000h, _CKP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00074	CKE = 1 'transmit on active to idle
	MOVE?CT	001h, _CKE

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00075	SSPIF = 0 'clear buffer full status
	MOVE?CT	000h, _SSPIF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00076	SMP = 0 'sample in middle of data
	MOVE?CT	000h, _SMP

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00078	Ce=1 'init spi pins
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00079	pause 10 'wait 10 ms hardware is stable
	PAUSE?C	00Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00080	Ce=0 'set CE pin low disable Rx
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00081	CSN=0 'set CSN pin low
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00082	Pack_count=0 'number of packets sent
	MOVE?CW	000h, _Pack_count

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00083	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00085	commonRXTX:

	LABEL?L	_commonRXTX	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00086	data_out[0]=Write_reg+Rx_addr_p0 'Rx address for pipe0
	MOVE?CB	02Ah, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00087	gosub setRxAddressPipe
	GOSUB?L	_setRxAddressPipe

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00088	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00089	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00090	data_out[0]=Write_reg+En_aa 'enable auto ACK pipe0
	MOVE?CB	021h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00091	data_out[1]=$01 '1 enable, 0 disable
	MOVE?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00092	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00093	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00094	data_out[0]=Write_reg+En_rxaddr 'enable Rx address pipe0
	MOVE?CB	022h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00095	data_out[1]=$01
	MOVE?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00096	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00097	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00098	data_out[0]=Write_reg+Rf_ch 'Set RF channel
	MOVE?CB	025h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00099	READ 0, data_out[1] 'number of channel used
	READ?CB	000h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00100	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00101	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00102	data_out[0]=Write_reg+Rx_pw_p0 'Set Rx pload width pipe0
	MOVE?CB	031h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00103	data_out[1]=payloadLength 'number of bytes used in data sent
	MOVE?CB	_payloadLength, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00104	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00105	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00106	data_out[0]=Write_reg+Rf_setup 'Set RF: 'Set RF:5dbm, 1Mbps
	MOVE?CB	026h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00107	data_out[1]=%00110111
	MOVE?CB	037h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00108	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00109	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00111	temp_byte_rfm = 1
	MOVE?CB	001h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00112	gosub setBank
	GOSUB?L	_setBank

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00113	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	000h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00113	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	040h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00113	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00113	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	001h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00113	temp_byte_rfm = 0 : temp1_byte_rfm = $40 : temp2_byte_rfm = $4B : temp3_byte_rfm = $01 : temp4_byte_rfm = $E2
	MOVE?CB	0E2h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00114	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00115	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	001h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00115	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	0C0h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00115	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	04Bh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00115	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00115	temp_byte_rfm = 1 : temp1_byte_rfm = $C0 : temp2_byte_rfm = $4B : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00116	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0D0h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	0FCh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	08Ch, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00117	temp_byte_rfm = 2 : temp1_byte_rfm = $D0 : temp2_byte_rfm = $FC : temp3_byte_rfm = $8C : temp4_byte_rfm = $02
	MOVE?CB	002h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00118	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	003h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	099h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	000h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	039h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00119	temp_byte_rfm = 3 : temp1_byte_rfm = $99 : temp2_byte_rfm = $00 : temp3_byte_rfm = $39 : temp4_byte_rfm = $41
	MOVE?CB	041h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00120	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	004h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	0B9h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	09Eh, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	086h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00121	temp_byte_rfm = 4 : temp1_byte_rfm = $B9 : temp2_byte_rfm = $9E : temp3_byte_rfm = $86 : temp4_byte_rfm = $0B
	MOVE?CB	00Bh, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00122	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	005h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	024h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	006h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	07Fh, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00123	temp_byte_rfm = 5 : temp1_byte_rfm = $24 : temp2_byte_rfm = $06 : temp3_byte_rfm = $7F : temp4_byte_rfm = $A6
	MOVE?CB	0A6h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00124	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00125	for k = 6 TO 11
	MOVE?CB	006h, _k
	LABEL?L	L00003	
	CMPGT?BCL	_k, 00Bh, L00004

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00126	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?BB	_k, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00126	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00126	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00126	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00126	    temp_byte_rfm = k : temp1_byte_rfm = $00 : temp2_byte_rfm = $00 : temp3_byte_rfm = $00 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00127	    gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00128	next k
	NEXT?BCL	_k, 001h, L00003
	LABEL?L	L00004	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00129	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	00Ch, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00129	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00129	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	012h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00129	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	073h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00129	temp_byte_rfm = 12 : temp1_byte_rfm = $00 : temp2_byte_rfm = $12 : temp3_byte_rfm = $73 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00130	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00131	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	00Dh, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00131	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	036h, _temp1_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00131	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	0B4h, _temp2_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00131	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	080h, _temp3_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00131	temp_byte_rfm = 13 : temp1_byte_rfm = $36 : temp2_byte_rfm = $b4 : temp3_byte_rfm = $80 : temp4_byte_rfm = $00
	MOVE?CB	000h, _temp4_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00132	gosub conf4bytes
	GOSUB?L	_conf4bytes

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00133	data_out[0]=Write_reg+$0E
	MOVE?CB	02Eh, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00134	data_out[1]=$41
	MOVE?CB	041h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00135	data_out[2]=$20
	MOVE?CB	020h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00136	data_out[3]=$08
	MOVE?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00137	data_out[4]=$04
	MOVE?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00138	data_out[5]=$81
	MOVE?CB	081h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00139	data_out[6]=$20
	MOVE?CB	020h, _data_out + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00140	data_out[7]=$CF
	MOVE?CB	0CFh, _data_out + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00141	data_out[8]=$F7
	MOVE?CB	0F7h, _data_out + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00142	data_out[9]=$FE
	MOVE?CB	0FEh, _data_out + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00143	data_out[10]=$FF
	MOVE?CB	0FFh, _data_out + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00144	data_out[11]=$FF
	MOVE?CB	0FFh, _data_out + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00145	num_byte=11
	MOVE?CB	00Bh, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00146	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00147	temp_byte_rfm = 0
	MOVE?CB	000h, _temp_byte_rfm

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00148	gosub setBank
	GOSUB?L	_setBank

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00149	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00151	setBank:

	LABEL?L	_setBank	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00152	data_out[0]=Read_reg+$07
	MOVE?CB	007h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00153	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00154	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00155	if (temp_byte_rfm != (data_in[0] & $80)) then
	AND?BCW	_data_in, 080h, T1
	CMPEQ?BWL	_temp_byte_rfm, T1, L00005

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00157	    data_out[0]=$50
	MOVE?CB	050h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00158	    data_out[1]=$53    
	MOVE?CB	053h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00159	    num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00160	    gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00161	endif
	LABEL?L	L00005	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00162	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00164	conf4bytes:

	LABEL?L	_conf4bytes	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00165	data_out[0]=Write_reg+temp_byte_rfm
	ADD?CBB	_Write_reg, _temp_byte_rfm, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00166	data_out[1]=temp1_byte_rfm
	MOVE?BB	_temp1_byte_rfm, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00167	data_out[2]=temp2_byte_rfm
	MOVE?BB	_temp2_byte_rfm, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00168	data_out[3]=temp3_byte_rfm
	MOVE?BB	_temp3_byte_rfm, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00169	data_out[4]=temp4_byte_rfm
	MOVE?BB	_temp4_byte_rfm, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00170	num_byte=4
	MOVE?CB	004h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00171	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00172	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00174	sendData:

	LABEL?L	_sendData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00175	pause 30
	PAUSE?C	01Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00176	GOSUB debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00177	data_out[0]=Flush_tx 'flush TX_fifo buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00178	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00179	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00180	data_out[0]=Write_reg+Stat_us 'reset IRQ bits
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00181	data_out[1]=%00110000
	MOVE?CB	030h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00182	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00183	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00184	gosub setup_tx 'setup Tx
	GOSUB?L	_setup_tx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00185	data_out[0]=Wr_tx_pload 'put 10 bytes data in Tx pload buffer
	MOVE?CB	_Wr_tx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00186	data_out[1]=device_id
	MOVE?BB	_device_id, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00187	for w = 2 to payloadLength+1
	MOVE?CB	002h, _w
	LABEL?L	L00007	
	CMPGT?BCL	_w, 017h, L00008

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00188	    data_out[w]=temp_data[w-2]
	SUB?BCW	_w, 002h, T1
	AOUT?BWB	_temp_data, T1, T1
	AIN?BBB	T1, _data_out, _w

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00189	    if data_out[w] == 10 then contSendX1
	AOUT?BBB	_data_out, _w, T1
	CMPEQ?BCL	T1, 00Ah, _contSendX1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00190	next w
	NEXT?BCL	_w, 001h, L00007
	LABEL?L	L00008	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00191	:contSendX1

	LABEL?L	_contSendX1	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00192	num_byte=payloadLength
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00193	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00194	pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00195	Ce=1 'CE=1 (toggle) transmit FIFO buffer
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00196	Pauseus 500 'pause 500 us
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00197	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00198	Pause 1
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00199	trans_irq:

	LABEL?L	_trans_irq	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00200	If Irq !=0 then trans_irq 'wait until IRQ, active low
	CMPNE?TCL	_Irq, 000h, _trans_irq

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00201	data_out[0]=Stat_us 'read status register
	MOVE?CB	_Stat_us, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00202	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00203	gosub spi_read
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00204	val=data_in[0]&%01110000 'mask the IRQ bits STATUS byte
	AND?BCB	_data_in, 070h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00205	if (val = Max_rt) then gosub max_retry 'maximum TX retries
	CMPNE?BCL	_val, _Max_rt, L00009
	GOSUB?L	_max_retry
	LABEL?L	L00009	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00206	if (val = Tx_inter) then gosub tx_int 'Tx interrupted
	CMPNE?BCL	_val, _Tx_inter, L00011
	GOSUB?L	_tx_int
	LABEL?L	L00011	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00207	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00208	data_out[1]=%00100000 'clear TX_DS IRQ bit
	MOVE?CB	020h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00209	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00210	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00211	gosub debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00212	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00215	debounce:

	LABEL?L	_debounce	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00216	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00217	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00218	Ce=1
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00219	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00220	Ce=0
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00221	pauseus 500
	PAUSEUS?C	001F4h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00222	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00224	spi_write:

	LABEL?L	_spi_write	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00225	CSN=0
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00226	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00013	
	CMPGT?BBL	_w, _num_byte, L00014

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00227	SSPBUF=data_out[w] 'send array variable
	AOUT?BBB	_data_out, _w, SSPBUF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00228	GoSub buffer_ok 'wait until buffer ready
	GOSUB?L	_buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00229	Next w 'next location
	NEXT?BCL	_w, 001h, L00013
	LABEL?L	L00014	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00230	CSN=1
	MOVE?CT	001h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00231	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00233	spi_read:

	LABEL?L	_spi_read	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00234	CSN=0
	MOVE?CT	000h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00235	For w = 0 to num_byte 'loop for # byte
	MOVE?CB	000h, _w
	LABEL?L	L00015	
	CMPGT?BBL	_w, _num_byte, L00016

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00236	    SSPBUF = data_out[0] 'write to SSPBUF to start clock
	MOVE?BB	_data_out, SSPBUF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00237	    GoSub buffer_ok 'wait for receipt
	GOSUB?L	_buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00238	data_in[w] = SSPBUF 'store received character in array
	AIN?BBB	SSPBUF, _data_in, _w

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00239	Next w 'get next byte
	NEXT?BCL	_w, 001h, L00015
	LABEL?L	L00016	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00240	CSN=1
	MOVE?CT	001h, _CSN

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00241	Return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00242	buffer_ok:

	LABEL?L	_buffer_ok	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00243	IF SSPIF = 0 Then buffer_ok 'wait for SPI interupt flag
	CMPEQ?TCL	_SSPIF, 000h, _buffer_ok

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00244	SSPIF = 0 'reset flag
	MOVE?CT	000h, _SSPIF

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00245	Return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00247	max_retry:

	LABEL?L	_max_retry	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00248	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00249	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00250	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00251	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00252	data_out[1]=%00010000 'clear MAX_RT IRQ bit
	MOVE?CB	010h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00253	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00254	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00255	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00257	tx_int:

	LABEL?L	_tx_int	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00258	data_out[0]=Flush_tx 'flush TX buffer
	MOVE?CB	_Flush_tx, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00259	num_byte=0
	MOVE?CB	000h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00260	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00261	data_out[0]=Write_reg+Stat_us
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00262	data_out[1]=%00110000 'clear TX_DS & MAX_RT IRQ bit
	MOVE?CB	030h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00263	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00264	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00265	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00267	setup_rx:

	LABEL?L	_setup_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00268	GOSUB debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00269	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00270	data_out[1]=$0F
	MOVE?CB	00Fh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00271	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00272	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00273	GOSUB debounce
	GOSUB?L	_debounce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00274	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00276	setup_sleep:

	LABEL?L	_setup_sleep	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00277	data_out[0]=Write_reg+Config_nrf 'Config:PRX=1,PWR_UP=0, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00278	data_out[1]=%00001101
	MOVE?CB	00Dh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00279	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00280	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00281	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00283	setup_tx:

	LABEL?L	_setup_tx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00284	data_out[0]=Write_reg+Tx_addr 'Tx address
	MOVE?CB	030h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00285	gosub setTxAddressPipe
	GOSUB?L	_setTxAddressPipe

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00286	num_byte=5
	MOVE?CB	005h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00287	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00288	data_out[0]= Write_reg+Setup_retr 'Set retransmit @ ACK
	MOVE?CB	024h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00289	data_out[1]= %00110101 '3x re-transmit (default)
	MOVE?CB	035h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00290	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00291	Gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00292	data_out[0]=Write_reg+Config_nrf 'Config:PRX=0,PWR_UP=1, CRC=2, enabled
	MOVE?CB	020h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00293	data_out[1]=$0E
	MOVE?CB	00Eh, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00294	num_byte=1
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00295	gosub spi_write
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00296	return
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\RFM70.PBP	00297	:endRFM70

	LABEL?L	_endRFM70	
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00020	 DEFINE OSC 8
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00021	 DEFINE ADC_BITS 10
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00022	 DEFINE ADC_CLOCK 3 ' ADC clock source (Fosc/32)
; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00023	 DEFINE ADC_SAMPLEUS 50 ' ADC sampling time (uSec)

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00024	 ADCON0.7 = 1
	MOVE?CT	001h, _ADCON0_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00025	 ADCON0.0 = 0
	MOVE?CT	000h, _ADCON0_0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00027	 OSCCON = %01110000 ' Internal 8MHz osc
	MOVE?CB	070h, OSCCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00028	 ANSEL = 0
	MOVE?CB	000h, ANSEL

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00029	 ANSELH = 0
	MOVE?CB	000h, ANSELH

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00030	 CM1CON0 = 0
	MOVE?CB	000h, CM1CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00031	 CM2CON0 = 0
	MOVE?CB	000h, CM2CON0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00034	    INTCON = %10101000 'TMR0 enabled , PORTAB int enabled PEIE disabled.
	MOVE?CB	0A8h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00035	    PIE1 = %00000000    'USART disabled
	MOVE?CB	000h, PIE1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00036	    OPTION_REG = %00000111
	MOVE?CB	007h, OPTION_REG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00038	on interrupt goto intManagement
	ONINT?LL	_intManagement, L00001

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00039	ENABLE
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00041	TRISA = %00110000 'Set PORTA to all output
	ICALL?L	L00001
	MOVE?CB	030h, TRISA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00042	TRISB = %00010000 'Set , SDI input
	ICALL?L	L00001
	MOVE?CB	010h, TRISB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00043	TRISC = %00000100 'Set IRQ input,
	ICALL?L	L00001
	MOVE?CB	004h, TRISC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00044	WPUA = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUA

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00045	WPUB = %11111111
	ICALL?L	L00001
	MOVE?CB	0FFh, WPUB

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00046	IOCA.4 = 1 'PORTA.4 is reset button, enable interrupt 
	ICALL?L	L00001
	MOVE?CT	001h, _IOCA_4

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00079	startProgLabel:

	LABEL?L	_startProgLabel	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00080	clear
	ICALL?L	L00001
	CLEAR?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00081	read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00082	gosub initModule
	ICALL?L	L00001
	GOSUB?L	_initModule

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00083	READ 11, temp_byte
	ICALL?L	L00001
	READ?CB	00Bh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00084	sleep_period = temp_byte * 10
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 00Ah, _sleep_period

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00085	if (sleep_period != 0) then
	ICALL?L	L00001
	CMPEQ?WCL	_sleep_period, 000h, L00017

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00086	    if (device_id != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_device_id, 000h, L00019

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00087	        sleepMode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _sleepMode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00088	        gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00089	    endif
	ICALL?L	L00001
	LABEL?L	L00019	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00090	endif
	ICALL?L	L00001
	LABEL?L	L00017	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00091	low HEATING_SENSOR_POWER
	ICALL?L	L00001
	LOW?T	_HEATING_SENSOR_power

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00092	commonSettings:

	LABEL?L	_commonSettings	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00093	gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00096	Main_rx:

	LABEL?L	_Main_rx	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00097	gosub setup_rx 'setup Rx
	ICALL?L	L00001
	GOSUB?L	_setup_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00098	pause 2 'delay for Rx starting
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00099	Ce=1 'set nRF24L01 in Rx mode
	ICALL?L	L00001
	MOVE?CT	001h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00100	irqLoop:

	LABEL?L	_irqLoop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00101	if RESET_BUTTON_FLAG == 1 then
	ICALL?L	L00001
	CMPNE?BCL	_RESET_BUTTON_FLAG, 001h, L00021

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00102	    RESET_BUTTON_FLAG = 0
	ICALL?L	L00001
	MOVE?CB	000h, _RESET_BUTTON_FLAG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00103	    DISABLE
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00104	    write 0, 40
	WRITE?CC	000h, 028h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00105	    write 1, "R"
	WRITE?CC	001h, 052h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00106	    write 2, "E"
	WRITE?CC	002h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00107	    write 3, "M"
	WRITE?CC	003h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00108	    write 4, "O"
	WRITE?CC	004h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00109	    write 5, "T"
	WRITE?CC	005h, 054h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00110	    write 6, "E"
	WRITE?CC	006h, 045h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00111	    write 7, "H"
	WRITE?CC	007h, 048h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00112	    write 8, "O"
	WRITE?CC	008h, 04Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00113	    write 9, "M"
	WRITE?CC	009h, 04Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00114	    write 10, 0
	WRITE?CC	00Ah, 000h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00115	    write 11, 1
	WRITE?CC	00Bh, 001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00116	    ENABLE
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00117	    pause 1000
	ICALL?L	L00001
	PAUSE?C	003E8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00118	    goto startProgLabel
	ICALL?L	L00001
	GOTO?L	_startProgLabel

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00119	endif
	ICALL?L	L00001
	LABEL?L	L00021	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00121	if (temp_data[0] != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_temp_data, 000h, L00023

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00122	    if (configure == 1) then
	ICALL?L	L00001
	CMPNE?BCL	_configure, 001h, L00025

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00123	        gosub commonRXTX
	ICALL?L	L00001
	GOSUB?L	_commonRXTX

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00124	        configure = 0
	ICALL?L	L00001
	MOVE?CB	000h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00125	    endif
	ICALL?L	L00001
	LABEL?L	L00025	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00126	    gosub sendData
	ICALL?L	L00001
	GOSUB?L	_sendData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00127	    temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00128	    GOTO main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00129	endif
	ICALL?L	L00001
	LABEL?L	L00023	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00130	if (sleepMode == 1) then    
	ICALL?L	L00001
	CMPNE?BCL	_sleepMode, 001h, L00027

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00131	      gosub setup_sleep
	ICALL?L	L00001
	GOSUB?L	_setup_sleep

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00132	      sleep sleep_period
	ICALL?L	L00001
	SLEEP?W	_sleep_period

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00133	      pause 1
	ICALL?L	L00001
	PAUSE?C	001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00134	      seconds = 57
	ICALL?L	L00001
	MOVE?CB	039h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00135	      ticks = 25
	ICALL?L	L00001
	MOVE?CB	019h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00136	      sleepmode = 0
	ICALL?L	L00001
	MOVE?CB	000h, _sleepMode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00137	      INTCON = %10101000      
	ICALL?L	L00001
	MOVE?CB	0A8h, INTCON

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00138	      OPTION_REG = %00000111
	ICALL?L	L00001
	MOVE?CB	007h, OPTION_REG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00139	      gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00140	      goto commonSettings    
	ICALL?L	L00001
	GOTO?L	_commonSettings

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00141	endif
	ICALL?L	L00001
	LABEL?L	L00027	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00142	If Irq !=0 then irqLoop 'wait until IRQ, active low
	ICALL?L	L00001
	CMPNE?TCL	_Irq, 000h, _irqLoop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00143	Ce=0
	ICALL?L	L00001
	MOVE?CT	000h, _Ce

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00144	lop:

	LABEL?L	_lop	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00145	data_out[0]=rd_rx_pload 'Read 5 bytes Rx pload
	ICALL?L	L00001
	MOVE?CB	_Rd_rx_pload, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00146	num_byte=payloadLength
	ICALL?L	L00001
	MOVE?CB	_payloadLength, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00147	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00148	temp_data[0] = 0
	ICALL?L	L00001
	MOVE?CB	000h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00149	if (data_in[1] == device_id) then
	ICALL?L	L00001
	CMPNE?BBL	_data_in + 00001h, _device_id, L00029

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00150	    if (data_in[2] == "c") then    
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 063h, L00031

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00151	        if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00033

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00153	            for i = 0 to 10
	ICALL?L	L00001
	MOVE?CB	000h, _i
	LABEL?L	L00035	
	CMPGT?BCL	_i, 00Ah, L00036

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00154	                disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00155	                write i, data_in[i+4]
	ADD?BCW	_i, 004h, T1
	AOUT?BWB	_data_in, T1, T1
	WRITE?BB	_i, T1

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00156	                enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00157	            next i
	ICALL?L	L00001
	NEXT?BCL	_i, 001h, L00035
	LABEL?L	L00036	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00158	            read 10, device_id
	ICALL?L	L00001
	READ?CB	00Ah, _device_id

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00159	            pause 250
	ICALL?L	L00001
	PAUSE?C	0FAh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00160	            configure = 1
	ICALL?L	L00001
	MOVE?CB	001h, _configure

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00161	            if (sleep_period == 0) then 
	ICALL?L	L00001
	CMPNE?WCL	_sleep_period, 000h, L00037

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00162	                sleepMode = 0                
	ICALL?L	L00001
	MOVE?CB	000h, _sleepMode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00163	            else
	ICALL?L	L00001
	GOTO?L	L00038
	LABEL?L	L00037	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00164	                sleepMode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _sleepMode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00165	            endif
	ICALL?L	L00001
	LABEL?L	L00038	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00166	            gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00167	        endif
	ICALL?L	L00001
	LABEL?L	L00033	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00168	    else
	ICALL?L	L00001
	GOTO?L	L00032
	LABEL?L	L00031	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00169	        if (data_in[2] == "m") then    
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 06Dh, L00039

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00170	            if (data_in[3] == "=") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 03Dh, L00041

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00171	                I=4
	ICALL?L	L00001
	MOVE?CB	004h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00172	                GOSUB convertInputData
	ICALL?L	L00001
	GOSUB?L	_convertInputData

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00173	                if (conversionSuccess = 1) then
	ICALL?L	L00001
	CMPNE?BCL	_conversionSuccess, 001h, L00043

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00174	                    disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00175	                    write 11, temp_byte
	WRITE?CB	00Bh, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00176	                    enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00177	                    sleep_period = temp_byte * 10
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 00Ah, _sleep_period

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00178	                    if (sleep_period == 0) then 
	ICALL?L	L00001
	CMPNE?WCL	_sleep_period, 000h, L00045

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00179	                        sleepMode = 0                
	ICALL?L	L00001
	MOVE?CB	000h, _sleepMode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00180	                    else
	ICALL?L	L00001
	GOTO?L	L00046
	LABEL?L	L00045	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00181	                        if (device_id != 0) then
	ICALL?L	L00001
	CMPEQ?BCL	_device_id, 000h, L00047

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00182	                            sleepMode = 1
	ICALL?L	L00001
	MOVE?CB	001h, _sleepMode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00183	                        else
	ICALL?L	L00001
	GOTO?L	L00048
	LABEL?L	L00047	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00184	                            sleepMode = 0
	ICALL?L	L00001
	MOVE?CB	000h, _sleepMode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00185	                        endif
	ICALL?L	L00001
	LABEL?L	L00048	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00186	                    endif
	ICALL?L	L00001
	LABEL?L	L00046	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00187	                    gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00188	                endif
	ICALL?L	L00001
	LABEL?L	L00043	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00189	            ENDIF
	ICALL?L	L00001
	LABEL?L	L00041	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00190	        else
	ICALL?L	L00001
	GOTO?L	L00040
	LABEL?L	L00039	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00191	            if (data_in[2] == "s") then    
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 073h, L00049

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00192	                gosub sendTemperature
	ICALL?L	L00001
	GOSUB?L	_sendTemperature

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00193	            else
	ICALL?L	L00001
	GOTO?L	L00050
	LABEL?L	L00049	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00194	                if (data_in[2] == "p") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00002h, 070h, L00051

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00195	                    if (data_in[3] == "n") then
	ICALL?L	L00001
	CMPNE?BCL	_data_in + 00003h, 06Eh, L00053

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00196	                        gosub sendDataOK
	ICALL?L	L00001
	GOSUB?L	_sendDataOK

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00197	                    endif
	ICALL?L	L00001
	LABEL?L	L00053	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00198	                endif
	ICALL?L	L00001
	LABEL?L	L00051	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00199	            endif
	ICALL?L	L00001
	LABEL?L	L00050	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00200	        endif
	ICALL?L	L00001
	LABEL?L	L00040	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00201	    endif
	ICALL?L	L00001
	LABEL?L	L00032	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00202	    if (temp_data[0] == 0) then
	ICALL?L	L00001
	CMPNE?BCL	_temp_data, 000h, L00055

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00203	        temp_data[0] = "E"
	ICALL?L	L00001
	MOVE?CB	045h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00204	        temp_data[1] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00205	        temp_data[2] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00206	        temp_data[3] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00207	        temp_data[4] = "R"
	ICALL?L	L00001
	MOVE?CB	052h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00208	        temp_data[5] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00209	        temp_data[6] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00210	    endif
	ICALL?L	L00001
	LABEL?L	L00055	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00211	endif
	ICALL?L	L00001
	LABEL?L	L00029	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00213	data_out[0]=Fifo_status 'Read FIFO status
	ICALL?L	L00001
	MOVE?CB	_Fifo_status, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00214	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00215	gosub spi_read
	ICALL?L	L00001
	GOSUB?L	_spi_read

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00216	val= data_in[1] 'FIFO status register
	ICALL?L	L00001
	MOVE?BB	_data_in + 00001h, _val

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00217	if val.0=0 then lop 'test RX_EMPTY=1, RX_FIFO empty
	ICALL?L	L00001
	CMPEQ?TCL	_val_0, 000h, _lop

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00218	data_out[0]=Write_reg+Stat_us 'reset RX_DR status bit
	ICALL?L	L00001
	MOVE?CB	027h, _data_out

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00219	data_out[1]=%01000000 'write 1 tp RX_DR to reset IRQ
	ICALL?L	L00001
	MOVE?CB	040h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00220	num_byte=1
	ICALL?L	L00001
	MOVE?CB	001h, _num_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00221	gosub spi_write
	ICALL?L	L00001
	GOSUB?L	_spi_write

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00222	pause 2 'wait 2ms Rx<->Tx
	ICALL?L	L00001
	PAUSE?C	002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00223	GOTO Main_rx
	ICALL?L	L00001
	GOTO?L	_Main_rx

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00224	end
	ICALL?L	L00001
	END?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00226	disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00227	intManagement:

	LABEL?L	_intManagement	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00228	        if (INTCON.2 == 1) then
	CMPNE?TCL	_INTCON_2, 001h, L00057

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00229	           ticks = ticks + 1      ' Count pieces of seconds
	ADD?BCB	_ticks, 001h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00230	           If ticks < 31 Then tiexit
	CMPLT?BCL	_ticks, 01Fh, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00231	           ticks = 0
	MOVE?CB	000h, _ticks

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00232	           seconds = seconds + 1
	ADD?BCB	_seconds, 001h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00233	           if seconds <= 58 then tiexit
	CMPLE?BCL	_seconds, 03Ah, _tiexit

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00234	           seconds = 0
	MOVE?CB	000h, _seconds

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00235	           if (sleep_period != 0) then
	CMPEQ?WCL	_sleep_period, 000h, L00059

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00236	               if (device_id != 0) then
	CMPEQ?BCL	_device_id, 000h, L00061

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00237	                   sleepMode = 1
	MOVE?CB	001h, _sleepMode

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00238	               endif
	LABEL?L	L00061	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00239	           endif
	LABEL?L	L00059	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00240	           tiexit: 

	LABEL?L	_tiexit	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00241	           INTCON.2 = 0
	MOVE?CT	000h, _INTCON_2

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00242	        endif
	LABEL?L	L00057	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00243	        if (INTCON.0 == 1) then
	CMPNE?TCL	_INTCON_0, 001h, L00063

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00244	           INTCON.0 = 0
	MOVE?CT	000h, _INTCON_0

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00245	           RESET_BUTTON_FLAG = 1
	MOVE?CB	001h, _RESET_BUTTON_FLAG

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00246	        endif
	LABEL?L	L00063	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00247	        INTCON.7 = 1
	MOVE?CT	001h, _INTCON_7

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00248	resume
	RESUME?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00249	enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00251	sendDataOK:

	LABEL?L	_sendDataOK	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00252	    temp_data[0] = "O"
	ICALL?L	L00001
	MOVE?CB	04Fh, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00253	    temp_data[1] = "K"
	ICALL?L	L00001
	MOVE?CB	04Bh, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00254	    temp_data[2] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00255	    temp_data[3] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00256	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00258	convertInputData:

	LABEL?L	_convertInputData	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00259	    conversionSuccess = 0
	ICALL?L	L00001
	MOVE?CB	000h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00260	    TEMP_BYTE="a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00261	    for ci=0 to 2    
	ICALL?L	L00001
	MOVE?CB	000h, _ci
	LABEL?L	L00065	
	CMPGT?BCL	_ci, 002h, L00066

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00262	        TEMP1_BYTE = "a"
	ICALL?L	L00001
	MOVE?CB	061h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00263	        TEMP2_BYTE = data_in[i]
	ICALL?L	L00001
	AOUT?BBB	_data_in, _i, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00264	        if (TEMP2_BYTE == "|") then return
	ICALL?L	L00001
	CMPNE?BCL	_temp2_byte, 07Ch, L00067
	RETURN?	
	LABEL?L	L00067	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00265	        GOSUB lookupChar
	ICALL?L	L00001
	GOSUB?L	_lookupChar

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00266	        if (TEMP1_BYTE == "a") then return 
	ICALL?L	L00001
	CMPNE?BCL	_temp1_byte, 061h, L00069
	RETURN?	
	LABEL?L	L00069	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00267	        if (ci==0) then 
	ICALL?L	L00001
	CMPNE?BCL	_ci, 000h, L00071

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00268	            TEMP_BYTE = TEMP1_BYTE
	ICALL?L	L00001
	MOVE?BB	_temp1_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00269	            conversionSuccess = 1 
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00270	        else 
	ICALL?L	L00001
	GOTO?L	L00072
	LABEL?L	L00071	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00271	            TEMP_BYTE = TEMP_BYTE*10 + TEMP1_BYTE
	ICALL?L	L00001
	MUL?BCW	_temp_byte, 00Ah, T1
	ADD?WBB	T1, _temp1_byte, _temp_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00272	            conversionSuccess = 1
	ICALL?L	L00001
	MOVE?CB	001h, _conversionSuccess

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00273	        endif
	ICALL?L	L00001
	LABEL?L	L00072	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00274	        i = i + 1
	ICALL?L	L00001
	ADD?BCB	_i, 001h, _i

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00275	    next ci
	ICALL?L	L00001
	NEXT?BCL	_ci, 001h, L00065
	LABEL?L	L00066	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00276	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00278	lookupChar:

	LABEL?L	_lookupChar	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00279	    LOOKDOWN temp2_byte,["0123456789"], temp1_byte
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

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00280	RETURN
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00282	convertNoToStr:

	LABEL?L	_convertNoToStr	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00283	        temp3_byte = (temp_byte DIG 2) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 002h, T1
	ADD?WCB	T1, 030h, _temp3_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00284	        temp2_byte = (temp_byte DIG 1) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 001h, T1
	ADD?WCB	T1, 030h, _temp2_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00285	        temp1_byte = (temp_byte DIG 0) + $30
	ICALL?L	L00001
	DIG?BCW	_temp_byte, 000h, T1
	ADD?WCB	T1, 030h, _temp1_byte

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00286	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00288	sendTemperature:

	LABEL?L	_sendTemperature	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00289	    high HEATING_SENSOR_power
	ICALL?L	L00001
	HIGH?T	_HEATING_SENSOR_power

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00290	    pause 50
	ICALL?L	L00001
	PAUSE?C	032h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00292	   OWOUT HEATING_SENSOR, 1, [$CC, $44] 'Skip ROM search & do temp conversion
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	001h
	OWOUT?C	0CCh
	OWOUT?C	044h
	OWEND?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00293	Wait_Up:

	LABEL?L	_Wait_Up	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00294	   OWIN HEATING_SENSOR, 4, [Busy]      'Read busy-bit
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	004h
	OWIN?T	_busy
	OWEND?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00295	   IF Busy = 0 THEN goto Wait_Up            'Still busy..?, Wait_Up..!
	ICALL?L	L00001
	CMPNE?TCL	_busy, 000h, L00073
	GOTO?L	_Wait_Up
	LABEL?L	L00073	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00296	   OWOUT HEATING_SENSOR, 1, [$CC, $BE] 'Skip ROM search & read scratchpad memory
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	001h
	OWOUT?C	0CCh
	OWOUT?C	0BEh
	OWEND?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00297	   OWIN HEATING_SENSOR, 2, [temperature.Lowbyte, temperature.Highbyte] 'Read two bytes / end comms
	ICALL?L	L00001
	OWPIN?T	_HEATING_SENSOR
	OWMODE?C	002h
	OWIN?B	_temperature_LOWBYTE
	OWIN?B	_temperature_HIGHBYTE
	OWEND?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00298	   low HEATING_SENSOR_power
	ICALL?L	L00001
	LOW?T	_HEATING_SENSOR_power

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00299	   temp_data[0] = "2"
	ICALL?L	L00001
	MOVE?CB	032h, _temp_data

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00300	   temp_data[1] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00301	   if (temperature.11 = 1) then
	ICALL?L	L00001
	CMPNE?TCL	_temperature_11, 001h, L00075

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00302	        temp_data[2] = "-"
	ICALL?L	L00001
	MOVE?CB	02Dh, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00303	        disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00304	        Dummy = 625 * (~temperature+1)
	NOT?WW	_temperature, T1
	ADD?WCW	T1, 001h, T1
	MUL?CWB	00271h, T1, _Dummy

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00305	        TempC = DIV32 10
	DIV32?CW	00Ah, _TempC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00306	        enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00307	        temp_data[3] = (TempC DIG 4) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 004h, T1
	ADD?WCB	T1, 030h, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00308	        temp_data[4] = (TempC DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00309	        temp_data[5] = "."
	ICALL?L	L00001
	MOVE?CB	02Eh, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00310	        temp_data[6] = (TempC DIG 2) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 002h, T1
	ADD?WCB	T1, 030h, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00311	        temp_data[7] = (TempC DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00312	   else
	ICALL?L	L00001
	GOTO?L	L00076
	LABEL?L	L00075	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00313	        temp_data[2] = "+"
	ICALL?L	L00001
	MOVE?CB	02Bh, _temp_data + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00314	        disable
	DISABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00315	        Dummy = 625 * temperature
	MUL?CWB	00271h, _temperature, _Dummy

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00316	        TempC = DIV32 10
	DIV32?CW	00Ah, _TempC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00317	        enable
	ENABLE?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00318	        TempC  = (temperature & $0FF0) >> 4 ' Mask middle 8-bits, shift into lower byte
	ICALL?L	L00001
	AND?WCW	_temperature, 00FF0h, T1
	SHIFTR?WCW	T1, 004h, _TempC

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00319	        Float = ((temperature.Lowbyte & $0F) * 625) ' Lower 4-bits of result * 625
	ICALL?L	L00001
	AND?BCW	_temperature_LOWBYTE, 00Fh, T1
	MUL?WCW	T1, 00271h, _Float

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00320	        temp_data[3] = (TempC DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00321	        temp_data[4] = (TempC DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_TempC, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00322	        temp_data[5] = "."
	ICALL?L	L00001
	MOVE?CB	02Eh, _temp_data + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00323	        temp_data[6] = (Float DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_Float, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 00006h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00324	        temp_data[7] = (Float DIG 2) + $30
	ICALL?L	L00001
	DIG?WCW	_Float, 002h, T1
	ADD?WCB	T1, 030h, _temp_data + 00007h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00325	   endif
	ICALL?L	L00001
	LABEL?L	L00076	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00327	        VRCON.4 = 1 ; Turn 0.6V reference ON
	ICALL?L	L00001
	MOVE?CT	001h, _VRCON_4

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00328	        PAUSEUS 200 ; Allow VP6 to settle
	ICALL?L	L00001
	PAUSEUS?C	0C8h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00329	        ADCIN 13, temp_word ; get VP6 analog reading (10-bit)
	ICALL?L	L00001
	ADCIN?CW	00Dh, _temp_word

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00330	        VRCON.4 = 0 ; Turn 0.6V reference OFF
	ICALL?L	L00001
	MOVE?CT	000h, _VRCON_4

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00331	        VDD = 6138 / temp_word ; convert to voltage ve vdd je 25 = 2,5 V        
	ICALL?L	L00001
	DIV?CWW	017FAh, _temp_word, _VDD

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00332	        temp_data[8] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 00008h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00333	        temp_data[9] = (VDD DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_VDD, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 00009h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00334	        temp_data[10] = "."
	ICALL?L	L00001
	MOVE?CB	02Eh, _temp_data + 0000Ah

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00335	        temp_data[11] = (VDD DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_VDD, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 0000Bh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00336	        temp_data[12] = "|"
	ICALL?L	L00001
	MOVE?CB	07Ch, _temp_data + 0000Ch

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00337	        temp_data[13] = (sleep_period DIG 3) + $30
	ICALL?L	L00001
	DIG?WCW	_sleep_period, 003h, T1
	ADD?WCB	T1, 030h, _temp_data + 0000Dh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00338	        temp_data[14] = (sleep_period DIG 2) + $30
	ICALL?L	L00001
	DIG?WCW	_sleep_period, 002h, T1
	ADD?WCB	T1, 030h, _temp_data + 0000Eh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00339	        temp_data[15] = (sleep_period DIG 1) + $30
	ICALL?L	L00001
	DIG?WCW	_sleep_period, 001h, T1
	ADD?WCB	T1, 030h, _temp_data + 0000Fh

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00340	        temp_data[16] = (sleep_period DIG 0) + $30
	ICALL?L	L00001
	DIG?WCW	_sleep_period, 000h, T1
	ADD?WCB	T1, 030h, _temp_data + 00010h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00341	        temp_data[17] = 13
	ICALL?L	L00001
	MOVE?CB	00Dh, _temp_data + 00011h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00342	        temp_data[18] = 10
	ICALL?L	L00001
	MOVE?CB	00Ah, _temp_data + 00012h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00343	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00345	setRxAddressPipe:

	LABEL?L	_setRxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00346	READ 6, data_out[1]
	ICALL?L	L00001
	READ?CB	006h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00347	READ 7, data_out[2]
	ICALL?L	L00001
	READ?CB	007h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00348	READ 8, data_out[3]
	ICALL?L	L00001
	READ?CB	008h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00349	READ 9, data_out[4]
	ICALL?L	L00001
	READ?CB	009h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00350	data_out[5] = device_id
	ICALL?L	L00001
	MOVE?BB	_device_id, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00351	return
	ICALL?L	L00001
	RETURN?	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00353	setTxAddressPipe:

	LABEL?L	_setTxAddressPipe	

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00354	READ 1, data_out[1]
	ICALL?L	L00001
	READ?CB	001h, _data_out + 00001h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00355	READ 2, data_out[2]
	ICALL?L	L00001
	READ?CB	002h, _data_out + 00002h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00356	READ 3, data_out[3]
	ICALL?L	L00001
	READ?CB	003h, _data_out + 00003h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00357	READ 4, data_out[4]
	ICALL?L	L00001
	READ?CB	004h, _data_out + 00004h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00358	READ 5, data_out[5]
	ICALL?L	L00001
	READ?CB	005h, _data_out + 00005h

; C:\RH\PRIVATE\HARDWARE\MICROC~1\TEMPER~1.PBP	00359	return
	ICALL?L	L00001
	RETURN?	

	END
