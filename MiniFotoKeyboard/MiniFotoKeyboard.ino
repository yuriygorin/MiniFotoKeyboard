#include "Keypad.h"
#include "Keyboard.h"
#include <GyverEncoder.h>



#define CLK1 A0
#define DT1 A1
#define SW1 A2
Encoder enc1(CLK1, DT1, SW1);  // для работы c кнопкой

#define CLK2 15
#define DT2 14
//#define SW2 A2
Encoder enc2(CLK2, DT2);


const byte ROWS = 4; /* four rows */
const byte COLS = 4; /* four columns */
/* define the symbols on the buttons of the keypads */
char hexaKeys[ROWS][COLS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};
byte rowPins[ROWS] = {9, 8, 7, 6}; /* connect to the row pinouts of the keypad */
byte colPins[COLS] = {5, 4, 3, 2}; /* connect to the column pinouts of the keypad */

/* initialize an instance of class NewKeypad */
Keypad customKeypad = Keypad( makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS); 

void setup() {
  // initialize control over the keyboard:
  Keyboard.begin();
  Serial.begin(9600);

  enc1.setType(TYPE2);    // Настройка Энкодера
  enc1.setPinMode(LOW_PULL);
  enc2.setType(TYPE2);    // Настройка Энкодера
  enc2.setPinMode(LOW_PULL);
}


void loop() {
  enc1.tick();
  enc2.tick();
  
  if (enc1.isLeft()) Serial.println("enc 1 left");
  if (enc1.isRight()) Serial.println("enc 1 right");
  if (enc2.isLeft()) Serial.println("enc 2 left");
  if (enc2.isRight()) Serial.println("enc 2 right");

}

/*
void loop(){
  enc1.tick();     
  if (enc1.isRight()) {
    Keyboard.press(KEY_LEFT_CTRL);
    Keyboard.press('=');
    Keyboard.releaseAll();  
  }
  if (enc1.isLeft())  {
    Keyboard.press(KEY_LEFT_CTRL);
    Keyboard.press('-');
    Keyboard.releaseAll();      
  }
  if (enc1.isClick()) {
    Keyboard.press(KEY_LEFT_ALT);
    Keyboard.press(KEY_TAB);
    Keyboard.release(KEY_TAB);
    Keyboard.releaseAll();      
  }

  char customKey = customKeypad.getKey();

  if (customKey){
    Keyboard.press(customKey);
    Keyboard.releaseAll(); 
  }
}
*/
