#include <EEPROM.h>
#include <RFM69.h>
#include <SPI.h>
#include <RFM69registers.h>
#include <avr/wdt.h>

#define FREQUENCY RF69_433MHZ //Match this with the version of your Moteino! (others: RF69_433MHZ, RF69_868MHZ)

byte networkId;
byte nodeId;
char key[17] = "thisIsEncryptKey"; //has to be same 16 characters/bytes on all nodes, not more not less!
RFM69 radio;
char buff[100];
byte len;
boolean reconfigure = false;
boolean reset_flag = false;
int timer1_counter;
String inputString = "";         // a string to hold incoming data
boolean stringComplete = false;  // whether the string is complete

void setup() {
  Serial.begin(115200);
  Serial.println("Starting...");
  noInterrupts();           // disable all interrupts
  TCCR1A = 0;
  TCCR1B = 0;
  timer1_counter = 34286;
  TCNT1 = timer1_counter;   // preload timer
  TCCR1B |= (1 << CS12);    // 256 prescaler
  TIMSK1 |= (1 << TOIE1);   // enable timer overflow interrupt
  interrupts();             // enable all interrupts  
  nodeId = EEPROM.read(0);
  if (nodeId == 255) nodeId = 0;
  networkId = EEPROM.read(1);
  if (networkId == 255) networkId = 1;
  //initialize radio module
  delay(100);
  radio.initialize(FREQUENCY,nodeId,networkId);
  //radio.setHighPower(); //must uncomment only for RFM69HW!
  if (EEPROM.read(2) != 255) {
    for (int i=0; i<16; i++) {
      key[i] = EEPROM.read(i+2);
    }
  }
  radio.encrypt(key);
}

void loop() {
  if (radio.receiveDone()) {
    if (((char)radio.DATA[0] == 'p') && ((char)radio.DATA[1] == 'n')) {
      sendOK();
    } else if (((char)radio.DATA[0] == 'n') && ((char)radio.DATA[1] == 'n')) {
      len = 0;
    } else if (((char)radio.DATA[0] == 'r') && ((char)radio.DATA[1] == 'e') && ((char)radio.DATA[2] == 's')) {
      sendOK();
      reset_flag = true;
    } else {
      sendERROR();
    }
    if (radio.ACK_REQUESTED) {
      radio.sendACK();
    }
    if (len != 0) {
      radio.sendWithRetry(255, buff, len, 10, 10);
      len = 0;
    }
    if (reset_flag) {
      clearEEPROM();
      wdt_enable(WDTO_15MS);
      while(1);
    }
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
      EEPROM.write(1, networkId);
      radio.initialize(FREQUENCY,nodeId,networkId);
      printOK();
    } else if (lowerCaseInput.startsWith("at+res")) {
      wdt_enable(WDTO_15MS);
      while(1);
    } else if (lowerCaseInput.startsWith("at+def")) {
      clearEEPROM();
      wdt_enable(WDTO_15MS);
      while(1);
    } else if (lowerCaseInput.startsWith("at+p=")) {
      String pwd = inputString.substring(5);
      if (pwd.length() == 16) {
        for (int i=0; i<16; i++) {
          key[i] = inputString.charAt(i+5);
          EEPROM.write(i+2, key[i]);
        }
        radio.encrypt(key);
        printOK();
      } else {
        printERROR();
      }
    }
    inputString = "";
    stringComplete = false;
  } else if (inputString.length() == 6) {
    if ((inputString.charAt(0) == '0') && (inputString.charAt(2) == '0') && (inputString.charAt(4) == '0')) {
      //OK, it is STK500 synchro bytes, reset the system
      wdt_enable(WDTO_15MS);
      while(1);
    }
  }
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
ISR(TIMER1_OVF_vect)        // interrupt service routine 
{
  TCNT1 = timer1_counter;   // preload timer
}
void clearEEPROM() {
  for (int i=0; i<511; i++) {
    EEPROM.write(i, 255);
  }
}
void serialEvent() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read(); 
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
    if ((inChar == 10) || (inChar == 13)) {
      stringComplete = true;
    } else {
      inputString += inChar;
    }
  }
}
