#include <EEPROM.h>
#include <avr/wdt.h>
#include <LowPower.h>
#include <RFM69.h>
#include <SPI.h>
#include <RemoteHome.h>
#include <Wire.h>
#include <LM75.h>
 

#define EEPROM_SENDING_STATUS_PERIOD 18 //Sending status period position eeprom position
#define ALIVE_AFTER_STARTUP 60000 //How long after startup the module should go to sleep period.
#define TEMP_SENSOR_POWER 6

RemoteHome remoteHome;
long interval=ALIVE_AFTER_STARTUP;
byte period = 0;
int sleepTimer = 0;
unsigned long previousMillis=0;
LM75 sensor(0x48);

void setup() {
  // initialize serial
  Serial.begin(115200);
  Wire.begin();
  Serial.println("Started");
  remoteHome.setup();
  pinMode(TEMP_SENSOR_POWER, OUTPUT);
  digitalWrite(TEMP_SENSOR_POWER, LOW);  
  period = EEPROM.read(EEPROM_SENDING_STATUS_PERIOD);
  if (period == 255) period = 0;
  delay(100);
  
}

void loop() {
  wdt_reset();
  if (remoteHome.processCommonSerialData(Serial)) {
    String lowerCaseInput = remoteHome.inputString;
    lowerCaseInput.toLowerCase();
    if (lowerCaseInput.startsWith("at+s")) {
      remoteHome.printCommonConfig(Serial);
      Serial.print("\tDevice type:TemplateBattery");
      Serial.print("\tPeriod:");
      Serial.print(period, DEC);
      Serial.print("\tBattery:");
      Serial.print(remoteHome.readVcc(), DEC);
      Serial.print("\tTemperature:");
      Serial.print(readTemperature(), 2);     
      Serial.println();
    } else if (lowerCaseInput.startsWith("at+m=")) {
      period = lowerCaseInput.substring(5).toInt();
      EEPROM.write(EEPROM_SENDING_STATUS_PERIOD, period);
      remoteHome.printOK(Serial); 
    }
    remoteHome.inputString = "";
    remoteHome.stringComplete = false;
  }
  //check and manage radio
  if (remoteHome.processCommonRadioData()) {
    if ((char)remoteHome.radio.DATA[0] == 's') {
      remoteHome.manageReceivedData();
      sendStatus();
    } else if (((char)remoteHome.radio.DATA[0] == 'm') && ((char)remoteHome.radio.DATA[1] == '=')) {
      String num = "";
      for (int i=2; i<255; i++) {
          if ((remoteHome.radio.DATA[i] == 10) || (remoteHome.radio.DATA[i] == 13)) break;
          num = num + (char)remoteHome.radio.DATA[i];
      }
      period = num.toInt();
      EEPROM.write(EEPROM_SENDING_STATUS_PERIOD, period);
      remoteHome.sendOK();
    } else {
      remoteHome.sendERROR();
    }
    remoteHome.manageReceivedData();
  }
  if ((period != 0) && (((unsigned long)(millis() - previousMillis)) >= interval)) {
    if (interval == ALIVE_AFTER_STARTUP) interval = 200; //OK it is after start, after start it is running 1 minute. After that, it is running 200 ms and then sleep again
    sleepTimer = 0;
    while (1) {
      remoteHome.radio.sleep();
      wdt_disable();
      LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);
      LowPower.powerDown(SLEEP_2S, ADC_OFF, BOD_OFF);
      wdt_enable(WDTO_4S);
      if ((period) == (++sleepTimer)) {
        sendStatus();
        remoteHome.sendRadioData();
        previousMillis = millis();
        break; //returns to the main loop
      }
    }
  }
}
void serialEvent() {
  remoteHome.manageSerialEvent(Serial);
}
float readTemperature() {
  float tmp;
  digitalWrite(TEMP_SENSOR_POWER, HIGH);
  LowPower.powerDown(SLEEP_120MS, ADC_OFF, BOD_OFF);
  tmp = sensor.temp();
  digitalWrite(TEMP_SENSOR_POWER, LOW);
  return tmp;
}
void sendStatus() {
        //Send sensor status
        remoteHome.buff[0] = '8';
        remoteHome.buff[1] = '|';
        remoteHome.buff[2] = 48 + period;
        remoteHome.buff[3] = '|';        
        int bat = remoteHome.readVcc();
        remoteHome.buff[4] = 48 + bat / 10;
        remoteHome.buff[5] = '.';
        remoteHome.buff[6] = 48 + bat % 10;
        remoteHome.buff[7] = '|';
        char array[10];
        dtostrf(readTemperature(), 2, 2, array);
        int i=0;
        while ((remoteHome.buff[8+i] = array[i]) != 0) {
          i++;
        }
        remoteHome.len = 8+i;  
}
