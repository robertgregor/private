#include <EEPROM.h>
#include <RFM69.h>
#include <SPI.h>
#include <RFM69registers.h>
#include <avr/wdt.h>
#include <LowPower.h>


#define FREQUENCY RF69_433MHZ //Match this with the version of your Moteino! (others: RF69_433MHZ, RF69_868MHZ)
#define EEPROM_POSITION_NODE_ID 0 //Node Id eeprom position
#define EEPROM_POSITION_NETWORK_ID 1 //Node Id eeprom position
#define EEPROM_POSITION_KEY 2 //Node Id eeprom position
#define EEPROM_SENDING_STATUS_PERIOD 18 //Node Id eeprom position
#define EEPROM_SENSOR_ENABLED_FLAG 19 //Node Id eeprom position
#define MOTIONINT     1 //Interrupt 1 on D3
#define INPUTPIN     3 //D3

byte networkId;
byte nodeId;
char key[17] = "thisIsEncryptKey"; //has to be same 16 characters/bytes on all nodes, not more not less!
RFM69 radio;
char buff[100];
byte len;
boolean reconfigure = false;
boolean reset_flag = false;
String inputString = "";         // a string to hold incoming data
String inputRadioData = "";
byte inputSenderId;
boolean stringComplete = false;  // whether the string is complete
char previousChar = 0;
byte period = 0;
int sleepTimer = 0;
byte enabled = 0;
long interval=60000;
unsigned long keepRadioMillis = 0;
unsigned long previousMillis=0;
volatile byte motionDetected=0;
typedef void (*AppPtr_t) (void);
AppPtr_t GoToBootloader = (AppPtr_t)0x3F05; 

void setup() {
  wdt_disable();
  delay(400); //needs to be there to stabilise power supply before the radio module is initialized.
  wdt_enable(WDTO_4S);
  // initialize serial
  Serial.begin(115200);
  nodeId = EEPROM.read(EEPROM_POSITION_NODE_ID);
  if (nodeId == 255) nodeId = 0;
  networkId = EEPROM.read(EEPROM_POSITION_NETWORK_ID);
  if (networkId == 255) networkId = 1;
  //initialize radio module
  delay(100);
  radio.initialize(FREQUENCY,nodeId,networkId);
  //radio.setHighPower(); //must uncomment only for RFM69HW!
  if (EEPROM.read(EEPROM_POSITION_KEY) != 255) {
    for (int i=0; i<16; i++) {
      key[i] = EEPROM.read(i+EEPROM_POSITION_KEY);
    }
  }
  radio.encrypt(key);
  period = EEPROM.read(EEPROM_SENDING_STATUS_PERIOD);
  if (period == 255) period = 0;
  enabled = EEPROM.read(EEPROM_SENSOR_ENABLED_FLAG);
  if (enabled == 255) enabled = 0;
  pinMode(INPUTPIN, INPUT_PULLUP);
  attachInterrupt(MOTIONINT, motionIRQ, CHANGE);
}

void loop() {
  wdt_reset();
  if (((unsigned long)(millis() - keepRadioMillis)) >= 1000) { // do not manage the same data within one second
    inputRadioData = "";
    inputSenderId = 0;
    keepRadioMillis = millis();
  }
  if (radio.receiveDone()) {
    String data((const char *)radio.DATA);
    if ((data != inputRadioData) || (inputSenderId != radio.SENDERID)) {
      inputRadioData = data;
      inputSenderId = radio.SENDERID;
      keepRadioMillis = millis();
      if (((char)radio.DATA[0] == 'p') && ((char)radio.DATA[1] == 'n')) {
        sendOK();
      } else if (((char)radio.DATA[0] == 'n') && ((char)radio.DATA[1] == 'n')) {
        len = 0;
      } else if (((char)radio.DATA[0] == 'e') && ((char)radio.DATA[1] == 'n')) {
        enabled = 1;
        EEPROM.write(EEPROM_SENSOR_ENABLED_FLAG,1);
        sendOK();
      } else if (((char)radio.DATA[0] == 'd') && ((char)radio.DATA[1] == 'i')) {
        enabled = 0;
        EEPROM.write(EEPROM_SENSOR_ENABLED_FLAG,0);
        sendOK();
      } else if ((char)radio.DATA[0] == 's') {      
        sendStatus();
      } else if (((char)radio.DATA[0] == 'm') && ((char)radio.DATA[1] == '=')) {
        String num = "";
        for (int i=2; i<255; i++) {
          if ((radio.DATA[i] == 10) || (radio.DATA[i] == 13)) break;
          num = num + (char)radio.DATA[i];
        }
        period = num.toInt();
        EEPROM.write(EEPROM_SENDING_STATUS_PERIOD, period);
        sendOK();
      } else if (((char)radio.DATA[0] == 'r') && ((char)radio.DATA[1] == 'e') && ((char)radio.DATA[2] == 's')) {
        sendOK();
        reset_flag = true;
      } else {
        if (radio.DATA[0] != 0) sendERROR();
      }
    } else {
      len = 0;
    }
    if (radio.ACK_REQUESTED) {
      radio.sendACK();
    }
    if (len > 0) {
      sendRadioData();
      radio.DATA[0] = 0;   
    }
    if (reset_flag) {
      reset_flag = false;
      reset();
      clearEEPROM();
    }
  }
  if (stringComplete) {
    String lowerCaseInput = inputString;
    lowerCaseInput.toLowerCase();
    if (inputString == "") {
    } else if (lowerCaseInput.startsWith("at+s")) {
      Serial.print("+Device ID:");
      Serial.print(nodeId, DEC);     
      Serial.print("\tChannel:");
      Serial.print(networkId, DEC);     
      Serial.print("\tPassword:");
      for (int i=0; i<16; i++) {
        Serial.print(key[i]);
      }
      Serial.print("\tPeriod:");
      Serial.print(period, DEC);
      Serial.print("\tEnabled:");
      Serial.print(enabled, DEC);
      Serial.print("\tSensor:");
      Serial.print(digitalRead(INPUTPIN), DEC);
      Serial.print("\tBattery:");
      Serial.print(readVcc(), DEC);
      Serial.println();
    } else if (lowerCaseInput.startsWith("at+c=")) {
      networkId = inputString.substring(5).toInt();
      EEPROM.write(EEPROM_POSITION_NETWORK_ID, networkId);
      printOK();
      reset();
    } else if (lowerCaseInput.startsWith("at+n=")) {
      nodeId = inputString.substring(5).toInt();
      EEPROM.write(EEPROM_POSITION_NODE_ID, nodeId);
      printOK();
      reset(); 
    } else if (lowerCaseInput.startsWith("at+m=")) {
      period = inputString.substring(5).toInt();
      EEPROM.write(EEPROM_SENDING_STATUS_PERIOD, period);
      printOK();
    } else if (lowerCaseInput.startsWith("at+en")) {
      EEPROM.write(EEPROM_SENSOR_ENABLED_FLAG, 1);
      enabled = 1;
      printOK();
    } else if (lowerCaseInput.startsWith("at+di")) {
      EEPROM.write(EEPROM_SENSOR_ENABLED_FLAG, 0);
      enabled = 0;
      printOK();
    } else if (lowerCaseInput.startsWith("at+res")) {
      printOK();
      reset();
    } else if (lowerCaseInput.startsWith("at+def")) {
      clearEEPROM();
      printOK();
      reset();
    } else if (lowerCaseInput.startsWith("at+p=")) {
      String pwd = inputString.substring(5);
      if (pwd.length() == 16) {
        for (int i=0; i<16; i++) {
          key[i] = inputString.charAt(i+5);
          EEPROM.write(i+EEPROM_POSITION_KEY, key[i]);
        }
        radio.encrypt(key);
        printOK();
      } else {
        printERROR();
      }
    }
    inputString = "";
    stringComplete = false;
  }
  if ((period != 0) && (((unsigned long)(millis() - previousMillis)) >= interval)) {
    previousMillis = millis();
    if (interval == 60000) interval = 1000; //OK it is after start, after start it is running 1 minute. After that, it is running 200 ms and then sleep again
    sleepTimer = 0;
    while (1) {
      wdt_disable();
      radio.sleep();
      LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);
      LowPower.powerDown(SLEEP_2S, ADC_OFF, BOD_OFF);
      wdt_enable(WDTO_4S);
      if ((period) == (sleepTimer++)) {
        sendStatus();
        sendRadioData();
        break;
      }
    }
  }
}
void sendStatus() {
        //Send sensor status
        buff[0] = '8';
        buff[1] = '|';
        buff[2] = 48 + enabled;
        buff[3] = '|';        
        buff[4] = 48 + digitalRead(INPUTPIN);
        buff[5] = '|';        
        int bat = readVcc();
        buff[6] = 48 + bat / 10;
        buff[7] = '.';
        buff[8] = 48 + bat % 10;
        len = 9;  
}
void sendOK() {
      buff[0] = 'O';
      buff[1] = 'K';
      len = 2;
}
void sendERROR() {
      buff[0] = 'E';
      buff[1] = 'R';
      buff[2] = 'R';
      buff[3] = 'O';
      buff[4] = 'R';
      len = 5;
}
void printOK() {
  Serial.println("OK");
}
void printERROR() {
  Serial.println("ERROR");
}
void clearEEPROM() {
  for (int i=0; i<1024; i++) {
    EEPROM.write(i, 255);
  }
}
void reset() {
  wdt_disable();
  inputString = "";
  stringComplete = false;
  wdt_enable(WDTO_1S);
  while(1);    
}
void serialEvent() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read();
    if ((inChar == 32) && (previousChar == 48)) {
        noInterrupts();
        GoToBootloader();
        break;
    } 
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
    previousChar = inChar;
    if ((inChar == 10) || (inChar == 13)) {
      stringComplete = true;
    } else {
      inputString += inChar;
    }
  }
}
void motionIRQ() {
       wdt_enable(WDTO_4S);  
       byte motion = digitalRead(INPUTPIN) + 1;
       if ((enabled == 1) && (motion != motionDetected)) {
       motionDetected = motion;
        if (motionDetected == 2) {
          //Open
          buff[0] = 'O';
          buff[1] = 'P';
          buff[2] = 'E';
          buff[3] = 'N';
          buff[4] = 'E';
          buff[5] = 'D';
          len = 6;
          Serial.println("OPENED");
        } else if (motionDetected == 1) {
          //Close
          buff[0] = 'C';
          buff[1] = 'L';
          buff[2] = 'O';
          buff[3] = 'S';
          buff[4] = 'E';
          buff[5] = 'D';
          len = 6;
          Serial.println("CLOSED");
        }
        sendRadioData();
        wdt_disable();
        radio.sleep();
       }
}
boolean sendRadioData() {
  int retryCnt = 0;
  while (1) {
      if (len == 0) return true;
      boolean st = radio.sendWithRetry(255, buff, len);
      if (st) {
        len = 0;
        return true;
      } else {
        if (++retryCnt > 8) {
          Serial.println("ERROR [Not reachable]");
          len = 0;
          return false;
        } else {
          delay(random(35, 100));
        }
      }
  }
}

int readVcc() {
  // Read 1.1V reference against AVcc
  // set the reference to Vcc and the measurement to the internal 1.1V reference
  #if defined(__AVR_ATmega32U4__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
    ADMUX = _BV(REFS0) | _BV(MUX4) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1);
  #elif defined (__AVR_ATtiny24__) || defined(__AVR_ATtiny44__) || defined(__AVR_ATtiny84__)
    ADMUX = _BV(MUX5) | _BV(MUX0);
  #elif defined (__AVR_ATtiny25__) || defined(__AVR_ATtiny45__) || defined(__AVR_ATtiny85__)
    ADMUX = _BV(MUX3) | _BV(MUX2);
  #else
    ADMUX = _BV(REFS0) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1);
  #endif  
 
  delay(2); // Wait for Vref to settle
  ADCSRA |= _BV(ADSC); // Start conversion
  while (bit_is_set(ADCSRA,ADSC)); // measuring
 
  uint8_t low  = ADCL; // must read ADCL first - it then locks ADCH  
  uint8_t high = ADCH; // unlocks both
 
  long result = (high<<8) | low;
 
  result = 11253L / result; // Calculate Vcc (in mV); 1125300 = 1.1*1023*1000
  return result; // Vcc in millivolts
}
