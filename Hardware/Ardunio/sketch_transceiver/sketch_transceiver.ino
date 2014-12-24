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

byte networkId;
byte nodeId;
char key[17] = "thisIsEncryptKey"; //has to be same 16 characters/bytes on all nodes, not more not less!
String inputString = "";         // a string to hold incoming data
boolean stringComplete = false;  // whether the string is complete
char previousChar = 0;
RFM69 radio;
String inputRadioData = "";
byte inputSenderId;
unsigned long keepRadioMillis = 0;
typedef void (*AppPtr_t) (void);
AppPtr_t GoToBootloader = (AppPtr_t)0x3F05; 

void setup() {
  wdt_disable();
  wdt_enable(WDTO_4S);
  // initialize serial
  Serial.begin(115200);
  Serial.println("starting...");
  nodeId = EEPROM.read(EEPROM_POSITION_NODE_ID);
  //if (nodeId == 255) nodeId = 0;
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
  // reserve 200 bytes for the inputString:
  inputString.reserve(200);
}

void loop() {
    wdt_reset();
    if (((unsigned long)(millis() - keepRadioMillis)) >= 1000) { // do not manage the same data within one second
    inputRadioData = "";
    inputSenderId = 0;
    keepRadioMillis = millis();
  }
  if (stringComplete) {
    String lowerCaseInput = inputString;
    lowerCaseInput.toLowerCase();
    if (inputString == "") {
    } else if (lowerCaseInput.startsWith("at+s")) {
      Serial.print("+Channel:");
      Serial.println(networkId, DEC);     
      Serial.print("+Password:");
      for (int i=0; i<16; i++) {
        Serial.print(key[i]);
      }
      Serial.println();
    } else if (lowerCaseInput.startsWith("at+c=")) {
      networkId = inputString.substring(5).toInt();
      EEPROM.write(EEPROM_POSITION_NETWORK_ID, networkId);
      radio.initialize(FREQUENCY,nodeId,networkId);
      printOK();
    } else if (lowerCaseInput.startsWith("at+r=")) {
      byte deviceIdToSend = inputString.substring(5).toInt();
      char buff[2];
      buff[0] = 'n';
      buff[1] = 'n';
      if (sendRadioData(deviceIdToSend,buff,2)) {
        Serial.println(radio.readRSSI(), DEC);
      }
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
    } else if (lowerCaseInput.startsWith("at+")) {
      char buff[200];
      if ((inputString.length() > 3) && (inputString.indexOf('=') != -1)) {
        int d = (inputString.substring(3, inputString.indexOf('='))).toInt();
        String dataToSend = inputString.substring(inputString.indexOf('=')+1);
        if (d > 254) {
          printERROR();
        } else {
          if (dataToSend != "=") {
            byte len = dataToSend.length();
            dataToSend.toCharArray(buff, len+1);
            sendRadioData(d, buff, len);
          } else {
            printERROR();
          }
        }
      } else {
        printERROR();
      }
    } else {
      printERROR();
    }
    // clear the string:
    inputString = "";
    stringComplete = false; 
  }
  if (radio.receiveDone()) {
    String data((const char *)radio.DATA);
    if ((data != inputRadioData) || (inputSenderId != radio.SENDERID)) {
      inputRadioData = data;
      inputSenderId = radio.SENDERID;
      keepRadioMillis = millis();
      Serial.print("+");
      Serial.print(radio.SENDERID, DEC);
      Serial.print(" ");
      for (byte i = 0; i < radio.DATALEN; i++) {
        Serial.print((char)radio.DATA[i]);
      }
      Serial.println();
    } else {
      //nothing printed
    }
    if (radio.ACK_REQUESTED) {
        radio.sendACK();
    }
  }
}
boolean sendRadioData(int dev, const void* buff, byte len) {
  int retryCnt = 0;
  while (1) {
      if (len == 0) return true;
      if (radio.sendWithRetry(dev, buff, len, 0, 30)) {
        len = 0;
        return true;
      } else {
        if (++retryCnt > 8) {
          Serial.println("ERROR [Not reachable]");
          len = 0;
          return false;
        } else {
          delay(random(50, 200));
        }
      }
  }
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
