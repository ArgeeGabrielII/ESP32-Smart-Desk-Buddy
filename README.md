# ESP32 Smart Desk Buddy

A beginner-friendly brownbag project: build a small desk display that shows temperature and humidity using an ESP32, a DHT11 sensor, and an OLED.

## First build

Read the DHT11 about every two seconds and show temperature in Celsius and relative humidity on the OLED. Print readings to the Serial Monitor for debugging. If a reading fails, show a clear sensor error instead of a misleading value.

Example display (illustrative values):

```text
DESK BUDDY
Temp:     28 C
Humidity: 65 %
```

The first build uses USB power and runs locally. Motion sensing, light sensing, LEDs, buzzers, relays, and Wi-Fi are future extensions.

## Parts

| Part | Quantity |
| --- | --- |
| ESP32 development board | 1 |
| DHT11 temperature and humidity module | 1 |
| 0.96-inch OLED | 1 |
| 830-point breadboard | 1 |
| Jumper wires | As needed |
| Micro USB data cable | 1 |

Confirm the board model and OLED interface/controller before following the wiring guide. Screen size alone does not identify the display.

## Start here

1. Follow the [software setup guide](docs/setup/getting-started.md).
2. Check your modules and follow the [hardware guide](docs/hardware/wiring.md).
3. Use the [brownbag session guide](docs/workshop/session-guide.md).

See the [documentation index](docs/README.md) for the categories.

## Project status

Documentation comes first. Firmware, compilation checks, and physical hardware validation are still to come. The example screen describes the intended result.

Repository: [ESP32 Smart Desk Buddy](https://github.com/ArgeeGabrielII/ESP32-Smart-Desk-Buddy)
