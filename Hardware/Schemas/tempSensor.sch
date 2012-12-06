<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.3">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="rfm70">
<packages>
<package name="RFM70">
<wire x1="-1.8" y1="1.9" x2="11" y2="1.9" width="0.127" layer="21"/>
<wire x1="11" y1="1.9" x2="11" y2="-14.9" width="0.127" layer="21"/>
<wire x1="11" y1="-14.9" x2="-1.8" y2="-14.9" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-14.9" x2="-1.8" y2="1.9" width="0.127" layer="21"/>
<circle x="6" y="-8.8" radius="2.3345" width="0.127" layer="21"/>
<smd name="GND" x="-0.1" y="-14.3" dx="1.5" dy="0.85" layer="1" rot="R90"/>
<smd name="VDD" x="1.2" y="-14.3" dx="1.5" dy="0.85" layer="1" rot="R90"/>
<smd name="CE" x="2.5" y="-14.3" dx="1.5" dy="0.85" layer="1" rot="R90"/>
<smd name="CSN" x="3.8" y="-14.3" dx="1.5" dy="0.85" layer="1" rot="R90"/>
<smd name="SCK" x="5.1" y="-14.3" dx="1.5" dy="0.85" layer="1" rot="R90"/>
<smd name="MOSI" x="6.4" y="-14.3" dx="1.5" dy="0.85" layer="1" rot="R90"/>
<smd name="MISO" x="7.7" y="-14.3" dx="1.5" dy="0.85" layer="1" rot="R90"/>
<smd name="IRQ" x="9" y="-14.3" dx="1.5" dy="0.85" layer="1" rot="R90"/>
<text x="1.4" y="-1.7" size="1.27" layer="21">RFM70</text>
</package>
</packages>
<symbols>
<symbol name="RFM70">
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-20.32" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-20.32" x2="12.7" y2="-20.32" width="0.254" layer="94"/>
<wire x1="12.7" y1="-20.32" x2="12.7" y2="5.08" width="0.254" layer="94"/>
<wire x1="12.7" y1="5.08" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<text x="5.08" y="-5.08" size="1.4224" layer="94">RFM70</text>
<text x="5.08" y="-7.62" size="1.4224" layer="94">Module</text>
<pin name="GND" x="-10.16" y="2.54" length="middle" direction="pwr"/>
<pin name="VDD" x="-10.16" y="0" length="middle" direction="pwr"/>
<pin name="CE" x="-10.16" y="-5.08" length="middle"/>
<pin name="CSN" x="-10.16" y="-7.62" length="middle"/>
<pin name="SCK" x="-10.16" y="-10.16" length="middle"/>
<pin name="MOSI" x="-10.16" y="-12.7" length="middle"/>
<pin name="MISO" x="-10.16" y="-15.24" length="middle"/>
<pin name="IRQ" x="-10.16" y="-17.78" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RFM70">
<description>RFM70 2.4 Ghz Funkmodul

Autor: Daniel Weber
Website: http://projects.web4clans.com
Email: daniel.weber@web4clans.com</description>
<gates>
<gate name="G$1" symbol="RFM70" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RFM70">
<connects>
<connect gate="G$1" pin="CE" pad="CE"/>
<connect gate="G$1" pin="CSN" pad="CSN"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="IRQ" pad="IRQ"/>
<connect gate="G$1" pin="MISO" pad="MISO"/>
<connect gate="G$1" pin="MOSI" pad="MOSI"/>
<connect gate="G$1" pin="SCK" pad="SCK"/>
<connect gate="G$1" pin="VDD" pad="VDD"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="microchip">
<description>&lt;b&gt;Microchip PIC Microcontrollers and other Devices&lt;/b&gt;&lt;p&gt;
Based on the following sources :
&lt;ul&gt;
&lt;li&gt;Microchip Data Book, 1993
&lt;li&gt;THE EMERGING WORLD STANDARD, 1995/1996
&lt;li&gt;Microchip, Technical Library CD-ROM, June 1998
&lt;li&gt;www.microchip.com
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;br&gt;
----------------------------------------------------------------------------------------&lt;br&gt;
&lt;author&gt;Updated by Frankie Kovarik  - 02/08/2006&lt;br&gt;
Added: PIC 12f6xx and 10fxx&lt;br&gt; &lt;b&gt;e-mail:&lt;/b&gt; hpss@c-box.cz&lt;br&gt;&lt;/author&gt;
----------------------------------------------------------------------------------------&lt;br&gt;
&lt;author&gt;Updated by Ludovic Voltz  &lt;br&gt;&lt;/author&gt;
&lt;b&gt;08/05/2007&lt;/b&gt; : PIC16F505, 16F627*,16F628*,16F648*&lt;br&gt;
&lt;b&gt;19/05/2007&lt;/b&gt; : PIC16F631*, PIC16F677*, PIC16F685*, PIC16F687*, PIC16F689*, PIC16F690*&lt;br&gt;
&lt;b&gt;e-mail:&lt;/b&gt; ludvol@free.fr&lt;br&gt;
&lt;b&gt;website:&lt;/b&gt; http://ludvol.free.fr&lt;br&gt;&lt;/author&gt;
----------------------------------------------------------------------------------------&lt;br&gt;</description>
<packages>
<package name="DIL20">
<wire x1="12.7" y1="2.921" x2="-12.7" y2="2.921" width="0.127" layer="21"/>
<wire x1="-12.7" y1="-2.921" x2="12.7" y2="-2.921" width="0.127" layer="21"/>
<wire x1="12.7" y1="2.921" x2="12.7" y2="-2.921" width="0.127" layer="21"/>
<wire x1="-12.7" y1="2.921" x2="-12.7" y2="1.016" width="0.127" layer="21"/>
<wire x1="-12.7" y1="-2.921" x2="-12.7" y2="-1.016" width="0.127" layer="21"/>
<wire x1="-12.7" y1="1.016" x2="-12.7" y2="-1.016" width="0.127" layer="21" curve="-180"/>
<pad name="1" x="-11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="17" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="18" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="19" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="20" x="-11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-5.08" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="SSOP20">
<description>&lt;b&gt;Shrink Small Outline Package&lt;/b&gt;&lt;p&gt;
package type SS</description>
<wire x1="-3.8" y1="-2.6" x2="3.8" y2="-2.6" width="0.2032" layer="21"/>
<wire x1="3.8" y1="-2.6" x2="3.8" y2="2.6" width="0.2032" layer="21"/>
<wire x1="3.8" y1="2.6" x2="-3.8" y2="2.6" width="0.2032" layer="21"/>
<smd name="1" x="-2.925" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="2" x="-2.275" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="3" x="-1.625" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="4" x="-0.975" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="5" x="-0.325" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="6" x="0.325" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="7" x="0.975" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="8" x="1.625" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="9" x="2.275" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="10" x="2.925" y="-3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="11" x="2.925" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="12" x="2.275" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="13" x="1.625" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="14" x="0.975" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="15" x="0.325" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="16" x="-0.325" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="17" x="-0.975" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="18" x="-1.625" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="19" x="-2.275" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<smd name="20" x="-2.925" y="3.625" dx="0.4" dy="1.5" layer="1"/>
<text x="-4.206" y="-2.5999" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.506" y="-2.5999" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-3.1028" y1="-3.937" x2="-2.7472" y2="-2.6416" layer="51"/>
<rectangle x1="-2.4529" y1="-3.937" x2="-2.0973" y2="-2.6416" layer="51"/>
<rectangle x1="-1.8029" y1="-3.937" x2="-1.4473" y2="-2.6416" layer="51"/>
<rectangle x1="-1.1529" y1="-3.937" x2="-0.7973" y2="-2.6416" layer="51"/>
<rectangle x1="-0.5029" y1="-3.937" x2="-0.1473" y2="-2.6416" layer="51"/>
<rectangle x1="0.1471" y1="-3.937" x2="0.5027" y2="-2.6416" layer="51"/>
<rectangle x1="0.7971" y1="-3.937" x2="1.1527" y2="-2.6416" layer="51"/>
<rectangle x1="1.4473" y1="-3.937" x2="1.8029" y2="-2.6416" layer="51"/>
<rectangle x1="2.0973" y1="-3.937" x2="2.4529" y2="-2.6416" layer="51"/>
<rectangle x1="2.7473" y1="-3.937" x2="3.1029" y2="-2.6416" layer="51"/>
<rectangle x1="2.7471" y1="2.6416" x2="3.1027" y2="3.937" layer="51"/>
<rectangle x1="2.0971" y1="2.6416" x2="2.4527" y2="3.937" layer="51"/>
<rectangle x1="1.4471" y1="2.6416" x2="1.8027" y2="3.937" layer="51"/>
<rectangle x1="0.7972" y1="2.6416" x2="1.1528" y2="3.937" layer="51"/>
<rectangle x1="0.1472" y1="2.6416" x2="0.5028" y2="3.937" layer="51"/>
<rectangle x1="-0.5027" y1="2.6416" x2="-0.1471" y2="3.937" layer="51"/>
<rectangle x1="-1.1527" y1="2.6416" x2="-0.7971" y2="3.937" layer="51"/>
<rectangle x1="-1.8027" y1="2.6416" x2="-1.4471" y2="3.937" layer="51"/>
<rectangle x1="-2.4527" y1="2.6416" x2="-2.0971" y2="3.937" layer="51"/>
<rectangle x1="-3.1027" y1="2.6416" x2="-2.7471" y2="3.937" layer="51"/>
<rectangle x1="-3.8999" y1="-2.5999" x2="-2.925" y2="2.5999" layer="27"/>
</package>
</packages>
<symbols>
<symbol name="PIC16F690*">
<wire x1="48.26" y1="0" x2="0" y2="0" width="0.4064" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="53.34" width="0.4064" layer="94"/>
<wire x1="0" y1="53.34" x2="48.26" y2="53.34" width="0.4064" layer="94"/>
<wire x1="48.26" y1="53.34" x2="48.26" y2="0" width="0.4064" layer="94"/>
<text x="0" y="54.61" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="RA0/AN0/C1IN+/ICSPDAT/ULPWU" x="50.8" y="2.54" length="short" rot="R180"/>
<pin name="RA1/AN1/C12IN0-/VREF/ICSPCLK" x="50.8" y="5.08" length="short" rot="R180"/>
<pin name="RA2/AN2/T0CKI/INT/C1OUT" x="50.8" y="7.62" length="short" rot="R180"/>
<pin name="RA3/MCLR/VPP" x="50.8" y="10.16" length="short" rot="R180"/>
<pin name="RA4/AN3/T1G/OSC2/CLKOUT" x="50.8" y="12.7" length="short" rot="R180"/>
<pin name="RB4/AN10/SDI/SDA" x="50.8" y="20.32" length="short" rot="R180"/>
<pin name="RB5/AN11/RX/DT" x="50.8" y="22.86" length="short" rot="R180"/>
<pin name="RB6/SCK/SCL" x="50.8" y="25.4" length="short" rot="R180"/>
<pin name="RB7/TX/CK" x="50.8" y="27.94" length="short" rot="R180"/>
<pin name="VSS" x="-2.54" y="2.54" length="short" direction="pwr"/>
<pin name="VDD" x="-2.54" y="50.8" length="short" direction="pwr"/>
<pin name="RA5/T1CKI/OSC1/CLKIN" x="50.8" y="15.24" length="short" rot="R180"/>
<pin name="RC0/AN4/C2IN+" x="50.8" y="33.02" length="short" rot="R180"/>
<pin name="RC1/AN5/C12IN1-" x="50.8" y="35.56" length="short" rot="R180"/>
<pin name="RC2/AN6/C12IN2-/P1D" x="50.8" y="38.1" length="short" rot="R180"/>
<pin name="RC3/AN7C12IN3-/P1C" x="50.8" y="40.64" length="short" rot="R180"/>
<pin name="RC4/C2OUT/P1B" x="50.8" y="43.18" length="short" rot="R180"/>
<pin name="RC5/CCP1/P1A" x="50.8" y="45.72" length="short" rot="R180"/>
<pin name="RC6/AN8/SS" x="50.8" y="48.26" length="short" rot="R180"/>
<pin name="RC7/AN9/SDO" x="50.8" y="50.8" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PIC16F690*">
<description>&lt;b&gt;MICROCONTROLLER&lt;/b&gt;&lt;p&gt;&lt;p&gt;
&lt;b&gt;PIC16F690&lt;/b&gt; &lt;p&gt;
18 I/O&lt;br&gt;
One 16-bit timer &lt;br&gt;
Two 8-bit timer &lt;br&gt;
Two comparators&lt;br&gt;
Precision internal oscillator-software selectable 8 MHz - 32 KHz&lt;br&gt;
SSP w/ I2C Compatible Address mask option&lt;br&gt;
EUSART LIN 2.0 Compatible&lt;br&gt;
ECCP+ w/ PWM Steering&lt;br&gt;
12 A/D Channels&lt;br&gt;
ULPW&lt;br&gt;
Enhanced Low Power Timer 1&lt;br&gt;
Timer 1 Gate Synch Latch&lt;br&gt;
4k Program Flash memory&lt;br&gt;
256 bytes SRAM&lt;br&gt;
256 bytes EEPROM&lt;p&gt;&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="PIC16F690*" x="0" y="0"/>
</gates>
<devices>
<device name="IP" package="DIL20">
<connects>
<connect gate="G$1" pin="RA0/AN0/C1IN+/ICSPDAT/ULPWU" pad="19"/>
<connect gate="G$1" pin="RA1/AN1/C12IN0-/VREF/ICSPCLK" pad="18"/>
<connect gate="G$1" pin="RA2/AN2/T0CKI/INT/C1OUT" pad="17"/>
<connect gate="G$1" pin="RA3/MCLR/VPP" pad="4"/>
<connect gate="G$1" pin="RA4/AN3/T1G/OSC2/CLKOUT" pad="3"/>
<connect gate="G$1" pin="RA5/T1CKI/OSC1/CLKIN" pad="2"/>
<connect gate="G$1" pin="RB4/AN10/SDI/SDA" pad="13"/>
<connect gate="G$1" pin="RB5/AN11/RX/DT" pad="12"/>
<connect gate="G$1" pin="RB6/SCK/SCL" pad="11"/>
<connect gate="G$1" pin="RB7/TX/CK" pad="10"/>
<connect gate="G$1" pin="RC0/AN4/C2IN+" pad="16"/>
<connect gate="G$1" pin="RC1/AN5/C12IN1-" pad="15"/>
<connect gate="G$1" pin="RC2/AN6/C12IN2-/P1D" pad="14"/>
<connect gate="G$1" pin="RC3/AN7C12IN3-/P1C" pad="7"/>
<connect gate="G$1" pin="RC4/C2OUT/P1B" pad="6"/>
<connect gate="G$1" pin="RC5/CCP1/P1A" pad="5"/>
<connect gate="G$1" pin="RC6/AN8/SS" pad="8"/>
<connect gate="G$1" pin="RC7/AN9/SDO" pad="9"/>
<connect gate="G$1" pin="VDD" pad="1"/>
<connect gate="G$1" pin="VSS" pad="20"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="" package="SSOP20">
<connects>
<connect gate="G$1" pin="RA0/AN0/C1IN+/ICSPDAT/ULPWU" pad="19"/>
<connect gate="G$1" pin="RA1/AN1/C12IN0-/VREF/ICSPCLK" pad="18"/>
<connect gate="G$1" pin="RA2/AN2/T0CKI/INT/C1OUT" pad="17"/>
<connect gate="G$1" pin="RA3/MCLR/VPP" pad="4"/>
<connect gate="G$1" pin="RA4/AN3/T1G/OSC2/CLKOUT" pad="3"/>
<connect gate="G$1" pin="RA5/T1CKI/OSC1/CLKIN" pad="2"/>
<connect gate="G$1" pin="RB4/AN10/SDI/SDA" pad="13"/>
<connect gate="G$1" pin="RB5/AN11/RX/DT" pad="12"/>
<connect gate="G$1" pin="RB6/SCK/SCL" pad="11"/>
<connect gate="G$1" pin="RB7/TX/CK" pad="10"/>
<connect gate="G$1" pin="RC0/AN4/C2IN+" pad="16"/>
<connect gate="G$1" pin="RC1/AN5/C12IN1-" pad="15"/>
<connect gate="G$1" pin="RC2/AN6/C12IN2-/P1D" pad="14"/>
<connect gate="G$1" pin="RC3/AN7C12IN3-/P1C" pad="7"/>
<connect gate="G$1" pin="RC4/C2OUT/P1B" pad="6"/>
<connect gate="G$1" pin="RC5/CCP1/P1A" pad="5"/>
<connect gate="G$1" pin="RC6/AN8/SS" pad="8"/>
<connect gate="G$1" pin="RC7/AN9/SDO" pad="9"/>
<connect gate="G$1" pin="VDD" pad="1"/>
<connect gate="G$1" pin="VSS" pad="20"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X05">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-6.4262" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="-5.334" y1="-0.254" x2="-4.826" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
</package>
<package name="1X05/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-6.985" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="8.255" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINHD5">
<wire x1="-6.35" y1="-7.62" x2="1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X5" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X05">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X05/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ds1820">
<description>Dallas DS1820 (TO-92)
&lt;br&gt;
&lt;a href="http://jayakody2000lk.wordpress.com"&gt;jayakody2000lk.wordpress.com&lt;/a&gt;</description>
<packages>
<package name="TO-92">
<wire x1="-2.095" y1="-1.651" x2="-0.7869" y2="2.5484" width="0.1524" layer="21" curve="-111.097684"/>
<wire x1="0.7869" y1="2.5484" x2="2.095" y2="-1.651" width="0.1524" layer="21" curve="-111.097684"/>
<wire x1="-2.095" y1="-1.651" x2="2.095" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-2.254" y1="-0.254" x2="-0.286" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-2.655" y1="-0.254" x2="-2.254" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-0.286" y1="-0.254" x2="0.286" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="2.254" y1="-0.254" x2="2.655" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="0.286" y1="-0.254" x2="2.254" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-0.7864" y1="2.5484" x2="0.7864" y2="2.5484" width="0.1524" layer="51" curve="-34.298964"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.27" shape="octagon"/>
<pad name="2" x="0" y="1.905" drill="0.8128" diameter="1.27" shape="octagon"/>
<pad name="3" x="1.27" y="0" drill="0.8128" diameter="1.27" shape="octagon"/>
<text x="2.413" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="2.921" y="-1.27" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="1820">
<wire x1="-7.62" y1="5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="-7.62" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VDD" x="-10.16" y="2.54" length="short" direction="in"/>
<pin name="GND" x="0" y="-7.62" length="short" direction="pwr" rot="R90"/>
<pin name="DQ" x="10.16" y="2.54" length="short" direction="out" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DS1820" prefix="IC">
<description>DS1820 - 1-Wire Digital Thermometer</description>
<gates>
<gate name="G$1" symbol="1820" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TO-92">
<connects>
<connect gate="G$1" pin="DQ" pad="2"/>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VDD" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="solpad">
<description>&lt;b&gt;Solder Pads/Test Points&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="LSP11">
<description>&lt;b&gt;SOLDER PAD&lt;/b&gt;&lt;p&gt;
drill 1.1 mm</description>
<wire x1="-1.27" y1="0.254" x2="-1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.254" x2="1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.254" x2="1.143" y2="0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.254" x2="1.143" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.254" x2="-1.143" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.254" x2="-1.143" y2="0.254" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.254" x2="0.635" y2="0.254" width="0.1524" layer="51"/>
<wire x1="-1.143" y1="-0.254" x2="-0.635" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="0.635" y1="0.254" x2="0.635" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="0.635" y1="0.254" x2="-0.635" y2="0.254" width="0.1524" layer="51"/>
<wire x1="0.635" y1="-0.254" x2="1.143" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="0.254" x2="-0.635" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="0.254" x2="-1.143" y2="0.254" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="-0.254" x2="0.635" y2="-0.254" width="0.1524" layer="51"/>
<pad name="MP" x="0" y="0" drill="1.1176" diameter="2.159" shape="octagon"/>
<text x="-1.27" y="1.27" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0.254" size="0.0254" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="LSP">
<wire x1="-1.016" y1="2.032" x2="1.016" y2="0" width="0.254" layer="94"/>
<wire x1="-1.016" y1="0" x2="1.016" y2="2.032" width="0.254" layer="94"/>
<circle x="0" y="1.016" radius="1.016" width="0.4064" layer="94"/>
<text x="-1.27" y="2.921" size="1.778" layer="95">&gt;NAME</text>
<pin name="MP" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LSP11" prefix="LSP">
<description>&lt;b&gt;SOLDER PAD&lt;/b&gt;&lt;p&gt;
drill 1.1 mm</description>
<gates>
<gate name="1" symbol="LSP" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LSP11">
<connects>
<connect gate="1" pin="MP" pad="MP"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="rfm70" deviceset="RFM70" device=""/>
<part name="U$2" library="microchip" deviceset="PIC16F690*" device=""/>
<part name="JP2" library="pinhead" deviceset="PINHD-1X5" device="" value="Prog"/>
<part name="IC1" library="ds1820" deviceset="DS1820" device=""/>
<part name="LSP1" library="solpad" deviceset="LSP11" device=""/>
<part name="LSP2" library="solpad" deviceset="LSP11" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="170.18" y="58.42" rot="R270"/>
<instance part="U$2" gate="G$1" x="134.62" y="68.58" rot="R90"/>
<instance part="JP2" gate="A" x="162.56" y="121.92"/>
<instance part="IC1" gate="G$1" x="58.42" y="99.06"/>
<instance part="LSP1" gate="1" x="86.36" y="48.26"/>
<instance part="LSP2" gate="1" x="101.6" y="48.26"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$5" class="0">
<segment>
<wire x1="132.08" y1="30.48" x2="177.8" y2="30.48" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="VSS"/>
<wire x1="132.08" y1="66.04" x2="132.08" y2="30.48" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="172.72" y1="68.58" x2="177.8" y2="68.58" width="0.1524" layer="91"/>
<wire x1="177.8" y1="68.58" x2="177.8" y2="30.48" width="0.1524" layer="91"/>
<wire x1="160.02" y1="121.92" x2="177.8" y2="121.92" width="0.1524" layer="91"/>
<wire x1="177.8" y1="121.92" x2="177.8" y2="68.58" width="0.1524" layer="91"/>
<junction x="177.8" y="68.58"/>
<pinref part="JP2" gate="A" pin="3"/>
<pinref part="IC1" gate="G$1" pin="GND"/>
<wire x1="58.42" y1="91.44" x2="58.42" y2="30.48" width="0.1524" layer="91"/>
<wire x1="58.42" y1="30.48" x2="101.6" y2="30.48" width="0.1524" layer="91"/>
<junction x="132.08" y="30.48"/>
<pinref part="LSP2" gate="1" pin="MP"/>
<wire x1="101.6" y1="30.48" x2="132.08" y2="30.48" width="0.1524" layer="91"/>
<wire x1="101.6" y1="45.72" x2="101.6" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="114.3" y1="132.08" x2="78.74" y2="132.08" width="0.1524" layer="91"/>
<wire x1="78.74" y1="132.08" x2="78.74" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="MISO"/>
<wire x1="154.94" y1="71.12" x2="154.94" y2="68.58" width="0.1524" layer="91"/>
<wire x1="142.24" y1="71.12" x2="154.94" y2="71.12" width="0.1524" layer="91"/>
<wire x1="142.24" y1="63.5" x2="142.24" y2="71.12" width="0.1524" layer="91"/>
<wire x1="78.74" y1="63.5" x2="142.24" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="RB4/AN10/SDI/SDA"/>
<wire x1="114.3" y1="119.38" x2="114.3" y2="132.08" width="0.1524" layer="91"/>
<junction x="114.3" y="119.38"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="VDD"/>
<wire x1="83.82" y1="66.04" x2="93.98" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="VDD"/>
<wire x1="93.98" y1="66.04" x2="144.78" y2="66.04" width="0.1524" layer="91"/>
<wire x1="170.18" y1="68.58" x2="170.18" y2="66.04" width="0.1524" layer="91"/>
<wire x1="170.18" y1="66.04" x2="170.18" y2="124.46" width="0.1524" layer="91"/>
<junction x="170.18" y="66.04"/>
<junction x="144.78" y="66.04"/>
<wire x1="144.78" y1="66.04" x2="170.18" y2="66.04" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="170.18" y1="124.46" x2="160.02" y2="124.46" width="0.1524" layer="91"/>
<wire x1="93.98" y1="66.04" x2="93.98" y2="45.72" width="0.1524" layer="91"/>
<pinref part="LSP1" gate="1" pin="MP"/>
<wire x1="93.98" y1="45.72" x2="86.36" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="144.78" y1="119.38" x2="144.78" y2="132.08" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="RA0/AN0/C1IN+/ICSPDAT/ULPWU"/>
<wire x1="144.78" y1="132.08" x2="132.08" y2="132.08" width="0.1524" layer="91"/>
<wire x1="132.08" y1="132.08" x2="132.08" y2="119.38" width="0.1524" layer="91"/>
<junction x="132.08" y="119.38"/>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="160.02" y1="119.38" x2="144.78" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="147.32" y1="116.84" x2="147.32" y2="134.62" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="RA1/AN1/C12IN0-/VREF/ICSPCLK"/>
<wire x1="147.32" y1="134.62" x2="129.54" y2="134.62" width="0.1524" layer="91"/>
<wire x1="129.54" y1="134.62" x2="129.54" y2="119.38" width="0.1524" layer="91"/>
<junction x="129.54" y="119.38"/>
<pinref part="JP2" gate="A" pin="5"/>
<wire x1="147.32" y1="116.84" x2="160.02" y2="116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RA2/AN2/T0CKI/INT/C1OUT"/>
<wire x1="127" y1="119.38" x2="127" y2="139.7" width="0.1524" layer="91"/>
<wire x1="127" y1="139.7" x2="165.1" y2="139.7" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="CE"/>
<wire x1="165.1" y1="139.7" x2="165.1" y2="68.58" width="0.1524" layer="91"/>
<junction x="127" y="119.38"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RC0/AN4/C2IN+"/>
<wire x1="101.6" y1="119.38" x2="101.6" y2="127" width="0.1524" layer="91"/>
<wire x1="101.6" y1="127" x2="139.7" y2="127" width="0.1524" layer="91"/>
<wire x1="139.7" y1="127" x2="139.7" y2="81.28" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="CSN"/>
<wire x1="139.7" y1="81.28" x2="162.56" y2="81.28" width="0.1524" layer="91"/>
<wire x1="162.56" y1="81.28" x2="162.56" y2="68.58" width="0.1524" layer="91"/>
<junction x="101.6" y="119.38"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RC2/AN6/C12IN2-/P1D"/>
<wire x1="96.52" y1="119.38" x2="96.52" y2="129.54" width="0.1524" layer="91"/>
<wire x1="96.52" y1="129.54" x2="152.4" y2="129.54" width="0.1524" layer="91"/>
<wire x1="152.4" y1="129.54" x2="152.4" y2="68.58" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="IRQ"/>
<junction x="96.52" y="119.38"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RB6/SCK/SCL"/>
<wire x1="109.22" y1="119.38" x2="109.22" y2="121.92" width="0.1524" layer="91"/>
<wire x1="109.22" y1="121.92" x2="154.94" y2="121.92" width="0.1524" layer="91"/>
<wire x1="154.94" y1="121.92" x2="154.94" y2="99.06" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="SCK"/>
<wire x1="154.94" y1="99.06" x2="160.02" y2="99.06" width="0.1524" layer="91"/>
<wire x1="160.02" y1="99.06" x2="160.02" y2="68.58" width="0.1524" layer="91"/>
<junction x="109.22" y="119.38"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RC7/AN9/SDO"/>
<wire x1="83.82" y1="119.38" x2="83.82" y2="124.46" width="0.1524" layer="91"/>
<wire x1="83.82" y1="124.46" x2="142.24" y2="124.46" width="0.1524" layer="91"/>
<wire x1="142.24" y1="124.46" x2="142.24" y2="76.2" width="0.1524" layer="91"/>
<wire x1="142.24" y1="76.2" x2="157.48" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="MOSI"/>
<wire x1="157.48" y1="76.2" x2="157.48" y2="68.58" width="0.1524" layer="91"/>
<junction x="83.82" y="119.38"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RA3/MCLR/VPP"/>
<wire x1="124.46" y1="119.38" x2="124.46" y2="137.16" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="124.46" y1="137.16" x2="160.02" y2="137.16" width="0.1524" layer="91"/>
<wire x1="160.02" y1="137.16" x2="160.02" y2="127" width="0.1524" layer="91"/>
<junction x="124.46" y="119.38"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RC6/AN8/SS"/>
<junction x="86.36" y="119.38"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RC4/C2OUT/P1B"/>
<junction x="91.44" y="119.38"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="RC3/AN7C12IN3-/P1C"/>
<junction x="93.98" y="119.38"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VDD"/>
<wire x1="48.26" y1="101.6" x2="45.72" y2="101.6" width="0.1524" layer="91"/>
<wire x1="45.72" y1="101.6" x2="45.72" y2="127" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="RC5/CCP1/P1A"/>
<junction x="88.9" y="119.38"/>
<wire x1="45.72" y1="127" x2="88.9" y2="127" width="0.1524" layer="91"/>
<wire x1="88.9" y1="127" x2="88.9" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="DQ"/>
<wire x1="68.58" y1="101.6" x2="68.58" y2="137.16" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="RA5/T1CKI/OSC1/CLKIN"/>
<wire x1="68.58" y1="137.16" x2="119.38" y2="137.16" width="0.1524" layer="91"/>
<wire x1="119.38" y1="137.16" x2="119.38" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="104,1,172.72,68.58,U$1,GND,N$5,,,"/>
<approved hash="104,1,170.18,68.58,U$1,VDD,N$17,,,"/>
<approved hash="104,1,132.08,66.04,U$2,VSS,N$5,,,"/>
<approved hash="104,1,83.82,66.04,U$2,VDD,N$17,,,"/>
<approved hash="106,1,86.36,119.38,N$28,,,,,"/>
<approved hash="106,1,88.9,119.38,N$29,,,,,"/>
<approved hash="106,1,91.44,119.38,N$30,,,,,"/>
<approved hash="106,1,93.98,119.38,N$31,,,,,"/>
<approved hash="110,1,132.08,66.04,N$17,N$5,,,,"/>
<approved hash="111,1,170.18,67.31,N$17,,,,,"/>
<approved hash="111,1,165.1,66.04,N$17,,,,,"/>
<approved hash="111,1,162.56,66.04,N$17,,,,,"/>
<approved hash="111,1,160.02,66.04,N$17,,,,,"/>
<approved hash="111,1,157.48,66.04,N$17,,,,,"/>
<approved hash="111,1,154.94,66.04,N$17,,,,,"/>
<approved hash="111,1,152.4,66.04,N$17,,,,,"/>
<approved hash="111,1,132.08,66.04,N$17,,,,,"/>
</errors>
</schematic>
</drawing>
</eagle>
