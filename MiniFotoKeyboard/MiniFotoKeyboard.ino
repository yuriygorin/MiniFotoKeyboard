#include "Keypad.h"
#include "Keyboard.h"


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
}


void loop(){
  char customKey = customKeypad.getKey();

  if (customKey){
Serial.println(customKey);
  }
}
/*
You pressed the button 2 times.
You pressed the button 3 times.
You pressed the button 4 times.
You pressed the button 5 times.
You pressed the button 6 times.
You pressed the button 7 times.
pressed the button 8 times.
You pressed the button 10 times.





 */
