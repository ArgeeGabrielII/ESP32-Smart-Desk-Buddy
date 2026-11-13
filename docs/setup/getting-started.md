# Getting started

## Prepare the tools

1. Install [Arduino IDE](https://www.arduino.cc/en/software/).
2. Follow [Espressif's Arduino IDE installation guide](https://docs.espressif.com/projects/arduino-esp32/en/latest/installing.html) to add ESP32 board support.
3. In Boards Manager, install **esp32 by Espressif Systems**.
4. Connect the ESP32 with a USB data cable. Select the board entry matching your board and select its port. For a generic classic ESP32 development board, **ESP32 Dev Module** may be appropriate; confirm the chip/module label first.
5. In Library Manager, install the libraries below and accept their dependencies.

| Library | Purpose |
| --- | --- |
| DHT sensor library by Adafruit | Read the DHT11. |
| Adafruit Unified Sensor | Dependency of the DHT library. |
| Adafruit SSD1306 | Drive the assumed SSD1306 OLED. |
| Adafruit GFX Library | Draw text on the OLED. |

The display libraries assume an SSD1306 controller. If your OLED uses another controller, choose its matching library before proceeding. See the [hardware checks](../hardware/wiring.md).

Library references: [DHT sensor library](https://github.com/adafruit/DHT-sensor-library), [Adafruit SSD1306](https://github.com/adafruit/Adafruit_SSD1306), and [Adafruit GFX](https://github.com/adafruit/Adafruit-GFX-Library).

## Check the connection

Before attaching modules, upload the Arduino **BareMinimum** example to confirm that the IDE can compile and upload to the board. This checks the tool connection; it does not test the sensor or display.

Disconnect USB before following the [wiring guide](../hardware/wiring.md).

## When firmware is added

The project sketch will configure the pins documented in the hardware guide, select sensor type `DHT11`, and use a Serial Monitor baud rate of `115200`. It will read the sensor about every two seconds, print readings, and update the OLED.

There is no project sketch to upload yet. Record the working IDE, ESP32 board package, and library versions after the first successful hardware run so participants can reproduce it.

## Troubleshooting

| Symptom | First checks |
| --- | --- |
| No serial port | Try a known USB data cable and another USB port. Identify the board's USB-to-serial chip before installing its manufacturer's driver, if needed. |
| Upload fails | Check the selected board and port, and close other applications using the port. Follow the board's upload instructions if it requires the BOOT button. |
| Missing library error | Install the named library and its dependencies through Library Manager. |
| OLED stays blank | Check power, SDA/SCL, controller, resolution, and I2C address. |
| Sensor reading fails | Check the module's labeled pins, common ground, configured GPIO, sensor type, and reading interval. |
