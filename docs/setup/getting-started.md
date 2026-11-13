# Software setup

1. Install [Arduino IDE](https://www.arduino.cc/en/software/).
2. Follow [Espressif's installation guide](https://docs.espressif.com/projects/arduino-esp32/en/latest/installing.html) to install **esp32 by Espressif Systems** through Boards Manager.
3. Connect the ESP32 with a USB data cable and select its board and serial port. For the photographed classic ESP32 development board, start with **ESP32 Dev Module**.
4. With peripherals disconnected, compile and upload the Arduino **BareMinimum** example to check the tool connection.
5. Unplug USB before following the [wiring guide](../hardware/wiring.md).

The first build uses digital inputs and outputs and needs no third-party sensor or display library.

## Test the LEDs first

Use [firmware/led_test/led_test.ino](../../firmware/led_test/led_test.ino) before adding the sensor.

1. With USB unplugged, leave the sensor and buzzer disconnected. Each LED needs its own 1 kΩ resistor and a cathode connection to common GND.
2. Bridge the blue ground rail section beside the LEDs to the section connected to ESP32 GND, so a split rail cannot interrupt the return.
3. Download or pull the repository and open `firmware/led_test/led_test.ino` in Arduino IDE. Keep it in the `led_test` folder.
4. Connect USB, select **ESP32 Dev Module** and its serial port, then click **Upload**.
5. If upload stays at `Connecting...`, hold **BOOT** until writing starts, then release it. If needed after upload, press **EN** once to start the sketch.
6. Expect **red only for 1 second → green only for 1 second → both off for 1 second**, repeating.
7. Optionally open Serial Monitor at **115200 baud** for matching messages.

If a light does not match, unplug USB before adjusting wiring. Check polarity, resistor placement, GPIO labels, and common ground. Keep both series resistors installed.

This standalone sketch uses `delay()` for simplicity and does not read GPIO 27. The user confirmed that the red and green LED blink test works on the assembled board.

Reference: [Espressif's Arduino GPIO API](https://docs.espressif.com/projects/arduino-esp32/en/latest/api/gpio.html).

## Run the parking assistant

Open [firmware/parking_assistant/parking_assistant.ino](../../firmware/parking_assistant/parking_assistant.ino) instead of the LED test. Keep the file in its `parking_assistant` folder.

1. Unplug USB. Connect sensor VCC to 3V3, GND to shared ground, and OUT to D27 using the [wiring guide](../hardware/wiring.md). Keep the two LED circuits connected.
2. Reconnect USB and upload using **ESP32 Dev Module** and the same working port. No extra libraries are required.
3. Hold an object in front of the sensor: red should turn on and green should turn off. Remove the object: green should turn on and red should turn off.
4. Open Serial Monitor at **115200 baud** to see `OUT=LOW/HIGH` and the interpreted state. Messages print at startup and on stable state changes.
5. If the LEDs consistently show the opposite of the object's presence, change `OBSTACLE_LEVEL` from `LOW` to `HIGH`, then upload again.
6. If the sensor stays in one state, adjust its potentiometer gently while moving an object in and out of view. If still stuck, unplug USB and check OUT/D27, module power, and common ground. Reversing polarity will not fix an input that never changes.

The sensor sketch uses these settings:

| Setting | Value |
| --- | --- |
| Sensor input | GPIO 27 |
| Green LED output | GPIO 25 |
| Red LED output | GPIO 26 |
| Serial baud rate | 115200 |
| Detection polarity | Active LOW by default; configurable with `OBSTACLE_LEVEL` |

The program accepts a state after 50 ms of stable input, using `millis()` rather than a blocking delay. Both LEDs stay off during initial settling; then exactly one lights. A disconnected signal can appear clear because of the input pull-up; green does not diagnose sensor health. Sensor behavior on the actual hardware still needs verification. Record working IDE and ESP32 package versions after the first successful run.

Compilation passed using **esp32 by Espressif Systems 3.3.12**, board `esp32:esp32:esp32`: 272,120 bytes of program storage and 22,124 bytes of global variables. This confirms compilation; the sensor sketch has not been uploaded or physically tested by the assistant.

## Troubleshooting

| Symptom | First check |
| --- | --- |
| Board port missing | Use a known USB data cable and check the board's USB-to-serial driver requirements. |
| Upload fails | Check board/port selection and the board's BOOT-button procedure. |
| LED stays dark | Check polarity, GPIO label, and resistor/LED breadboard rows. |
| States are reversed | Check the sensor's detection polarity in the firmware. |
| Sensor always detects | Check alignment, ambient light, reflective objects, and potentiometer adjustment. |
