# Software setup

1. Install [Arduino IDE](https://www.arduino.cc/en/software/).
2. Follow [Espressif's installation guide](https://docs.espressif.com/projects/arduino-esp32/en/latest/installing.html) to install **esp32 by Espressif Systems** through Boards Manager.
3. Connect the ESP32 with a USB data cable and select its board and serial port. For the photographed classic ESP32 development board, start with **ESP32 Dev Module**.
4. With peripherals disconnected, compile and upload the Arduino **BareMinimum** example to check the tool connection.
5. Unplug USB before following the [wiring guide](../hardware/wiring.md).

The first build uses digital inputs and outputs and needs no third-party sensor or display library.

## Planned firmware

Firmware is not added yet. It will use:

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
