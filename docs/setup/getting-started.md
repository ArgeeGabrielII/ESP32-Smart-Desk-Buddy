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

This standalone sketch uses `delay()` for simplicity and does not read GPIO 27. It has not yet been compiled with the ESP32 toolchain or tested on the physical board.

Reference: [Espressif's Arduino GPIO API](https://docs.espressif.com/projects/arduino-esp32/en/latest/api/gpio.html).

## Planned parking assistant firmware

The sensor-driven sketch is still to come. It will use:

| Setting | Value |
| --- | --- |
| Sensor input | GPIO 27 |
| Green LED output | GPIO 25 |
| Red LED output | GPIO 26 |
| Serial baud rate | 115200 |
| Detection polarity | Confirm against the actual sensor |

The program will read the sensor, select the detected/clear state, and update the two LEDs. Brief filtering can prevent flickering near the detection threshold. Record working IDE and ESP32 package versions after the first successful run.

## Troubleshooting

| Symptom | First check |
| --- | --- |
| Board port missing | Use a known USB data cable and check the board's USB-to-serial driver requirements. |
| Upload fails | Check board/port selection and the board's BOOT-button procedure. |
| LED stays dark | Check polarity, GPIO label, and resistor/LED breadboard rows. |
| States are reversed | Check the sensor's detection polarity in the firmware. |
| Sensor always detects | Check alignment, ambient light, reflective objects, and potentiometer adjustment. |
