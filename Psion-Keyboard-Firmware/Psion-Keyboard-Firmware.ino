/*
	Psion-Keyboard-Firmware

	See https://github.com/RasmusB/USB-Keyboard-Adapter

	This is firmware for turning a Psion Series 5/5mx or Ericsson MC 128
	keyboard into a USB keyboard. The firmare is intended to run on an
	ATmega32U4.

*/

#include "board.h"
#include "Keyboard.h"
#include "PsionKeymapUSB.h"

#define SERIAL_ENABLED false
#define DEBUG_ENABLED false
#define KEYBOARD_ENABLED true

// Max number of scans/second
#define MAX_SCAN_RATE 1000

int keypressArrayCurrent [NROWS] [NCOLS];
int keypressArrayPrevious [NROWS] [NCOLS];

unsigned long previousTime;
unsigned int minDelay;

void setup() {

	previousTime = 0;
	minDelay = 1000 / MAX_SCAN_RATE;

	if (SERIAL_ENABLED) {
		Serial.begin(9600);
		Serial.println("Hello!");
	}

	if (KEYBOARD_ENABLED) Keyboard.begin();

	pinMode(LED_BUILTIN, OUTPUT);

	// Scanlines in high-Z (inactive) mode
	// Pin state should be initialized to LOW
	for (int i = 0; i < NROWS; i++) {
		pinMode(Rows[i], INPUT);
	}

	// Columns as inputs
	// Internal pull-up enabled
	for (int i = 0; i < NCOLS; i++) {
		pinMode(Cols[i], INPUT);
	}
}

void loop() {

	if ( (millis() - previousTime) >= minDelay ) {

		// Scan the keyboard matrix
		int nKeysPressed = scanKeyboard(keypressArrayCurrent);

		digitalWrite(LED_BUILTIN, keypressArrayCurrent[7][7]);

		if ( SERIAL_ENABLED ) {
			Serial.print("n pressed => ");
			Serial.println(nKeysPressed);
		}

		// Send the keypresses over USB
		if (KEYBOARD_ENABLED) {
			sendKeys(keypressArrayCurrent, keypressArrayPrevious);
		}

		// Remember which keys were pressed so we can release them later
		memcpy(keypressArrayPrevious, keypressArrayCurrent, sizeof(keypressArrayCurrent));

		previousTime = millis();
	}
}


int scanKeyboard ( int keyArray [] [NCOLS] ) {

	int nKeysPressed = 0;

	for (int row = 0; row < NROWS; row++) {
		if (SERIAL_ENABLED && DEBUG_ENABLED) {
			Serial.print("Scanning row ");
			Serial.println(row);
		}

		// Select a pin to sink current
		pinMode(Rows[row], OUTPUT);
		digitalWrite(Rows[row], LOW);

		for (int col = 0; col < NCOLS; col++) {
			pinMode(Cols[col], INPUT_PULLUP);
			if (SERIAL_ENABLED && DEBUG_ENABLED) {
				Serial.print("Scanning col. ");
				Serial.println(col);
			}

			// Only scan mapped buttons
			// keyScancode holds the mappings, it's not the live record of what's pressed
			// We can set the shift keys to zero here because we can check for shifts with:
			//		 ( pressedArray[0][6] > 0 || pressedArray[7][7] > 0 )
			if (keyScancode[row][col] != 0) {

				// =1 for every button NOT pressed (pull-ups enabled)
				// =0 for every button PRESSED (signal shorted to row pin)
				// This value is inverted when saved

				if ( digitalRead(Cols[col]) != HIGH ) {
					keyArray [row] [col] = 1;
					nKeysPressed++;

				} else {
					keyArray [row] [col] = 0;
				}
			}
			
			// Disable pull-up
			pinMode(Cols[col], INPUT);
			
		}

		// Return pin to high-Z (inactive) mode

		pinMode(Rows[row], INPUT);

	}

	return nKeysPressed;
}

void sendKeys ( int pressedArray [] [NCOLS], int previousArray [] [NCOLS] ) {

	int isShift = 0;

	for ( int row = 0; row < NROWS; row++ ) {
		for ( int col = 0; col < NCOLS; col++ ) {

			// Only scan mapped buttons
			if (keyScancode[row][col] != 0) {

				// If a new button is pressed
				if ( pressedArray[row][col] > previousArray[row][col] ) {

					if (SERIAL_ENABLED) {
						Serial.print("0x");
						Serial.print(keyScancode[row][col], HEX);
						Serial.println(" pressed");
					};

					// ================================

					

					// If either shift key is pressed, use the shifted mapping in keyScancodeShifted
					if ( (pressedArray[0][6] > 0) || (pressedArray[7][7] > 0) ) {
					
						// Set shift flag so we release it later
						// Maybe we just blindly release all 3 mods?

						if ( !( (row == 0) && (col == 6) ) ) {
							if ( !( (row == 7) && (col == 7) ) ) {

								Keyboard.press(keyScancodeShiftedMods[row][col]);
								Keyboard.press(keyScancodeShifted[row][col]);

								Keyboard.release(keyScancodeShifted[row][col]);
								Keyboard.release(keyScancodeShiftedMods[row][col]);
								
							}
						}

					// If FN key is pressed, use the FN mapping in keyScancodeFN
					} else if (pressedArray[6][9] > 0) {

						if ( !( (row == 6) && (col == 9) ) ) {

							Keyboard.press(keyScancodeFNMods[row][col]);
							Keyboard.press(keyScancodeFN[row][col]);

							Keyboard.release(keyScancodeFN[row][col]);
							Keyboard.release(keyScancodeFNMods[row][col]);
							
						}

					// If CTRL key is pressed, use the CTRL mapping in keyScancodeCtrl
					} else if (pressedArray[5][8] > 0) {

						if ( !( (row == 5) && (col == 8) ) ) {

							Keyboard.press(KEY_CTRL);
							Keyboard.press(keyScancodeCtrl[row][col]);

							Keyboard.release(keyScancodeCtrl[row][col]);
							Keyboard.release(KEY_CTRL);
							
						}



					// No modifiers, so just send keys via the default mapping in keyScancode
					} else {
					
						// Just use the unshifted mapping in keyScancode
						Keyboard.press(keyScancodeMods[row][col]);
						Keyboard.press(keyScancode[row][col]);

						Keyboard.release(keyScancode[row][col]);
						Keyboard.release(keyScancodeMods[row][col]);
					
					
					}

					// ================================


					// This handles the release of keys
				} else if ( pressedArray[row][col] < previousArray[row][col] ) {

					// Since we need to do the mod along with the key itself, the whole sequence will be done above
					// We can just delete this whole block, as it doesn't impact data any

					if (SERIAL_ENABLED) {
						Serial.print("0x");
						Serial.print(keyScancode[row][col], HEX);
						Serial.println(" released");
					};


				}
			}
		}
	}

}
