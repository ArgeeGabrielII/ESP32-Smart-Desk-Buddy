# Hardware and wiring

See the [visual wiring diagram](wiring-diagram.md) alongside the connection table below.

## Confirm your parts

This is a proposed wiring plan, pending a physical check of your parts:

- A classic ESP32 development board with exposed GPIO 4, 21, and 22.
- A four-pin I2C OLED labeled GND, VCC, SCL, and SDA, with an SSD1306 controller and 128 × 64 resolution.
- A DHT11 breakout module with power, ground, and data pins.
- Sensor and display modules rated to operate from 3.3 V.

The supplied parts list does not confirm those details. Check labels and the seller's specifications first. If the board or modules differ, adjust this guide before connecting them. A 0.96-inch OLED may have a different controller or interface.

## Connect the first build

Unplug USB while wiring. Use the module's printed pin labels, not its physical pin order. ESP32 GPIO signals must stay at 3.3 V; do not connect a 5 V signal to a GPIO.

| Module pin | ESP32 connection |
| --- | --- |
| DHT11 VCC / + | 3V3 |
| DHT11 GND / − | GND |
| DHT11 DATA / S / OUT | GPIO 4 |
| OLED VCC | 3V3 |
| OLED GND | GND |
| OLED SDA | GPIO 21 |
| OLED SCL | GPIO 22 |

Use the breadboard to share 3V3 and GND. Check whether the power rails are split before relying on them. GPIO numbers refer to the board's GPIO labels, not a header pin's position.

Many DHT11 breakout modules include a data pull-up resistor. Check your module; if it lacks one and its documentation calls for it, use a 10 kΩ resistor between DATA and 3V3. A bare four-pin DHT11 sensor needs its own pinout and wiring check.

This plan uses GPIO 21 and 22 for I2C, matching the generic classic ESP32 defaults. Other ESP32 boards can differ. See [Espressif's I2C documentation](https://docs.espressif.com/projects/arduino-esp32/en/latest/api/i2c.html).

## Check before powering on

1. Verify the modules support 3.3 V operation and check every power and ground connection.
2. Make sure 3V3 and GND are not shorted.
3. Confirm the OLED controller and resolution. Use its documentation or an I2C scanner to find the address; do not assume the address from the screen size.
4. Reconnect USB only after the wiring checks pass.

Leave the other sensors and outputs disconnected for the first build. The assembled circuit and pin plan still need hardware validation.
