# ESP32 Mini Parking Assistant

A simple brownbag project: detect a nearby object and switch between a green and a red LED.

- **No obstacle detected:** green LED on, red LED off.
- **Obstacle detected:** red LED on, green LED off.

The infrared obstacle avoidance module provides a digital detection signal. This project does not measure distance in centimeters. Detection depends on the object's reflectivity, lighting, and module adjustment.

## First build

Use an ESP32, an obstacle avoidance module, two LEDs, and two 1 kΩ resistors. Power the assembled project over USB after checking the wiring and module compatibility.

This project uses LEDs only. Leave the buzzer disconnected.

## Documentation

1. [Electronics list](docs/hardware/electronics-list.md)
2. [Visual wiring diagram](docs/hardware/wiring-diagram.md)
3. [Wiring instructions](docs/hardware/wiring.md)
4. [Software setup](docs/setup/getting-started.md)
5. [Brownbag session guide](docs/workshop/session-guide.md)

![Proposed Mini Parking Assistant wiring](docs/hardware/assets/mini-parking-wiring.png)

## Status

The user confirmed that the [LED test](firmware/led_test/led_test.ino) works on the assembled board. The [parking assistant sketch](firmware/parking_assistant/parking_assistant.ino) now reads the sensor and controls the LEDs; follow the [upload instructions](docs/setup/getting-started.md#run-the-parking-assistant).

The sensor photo confirms OUT/GND/VCC labels. Its operation at 3.3 V and detection polarity still need verification on the actual module. The firmware defaults to active-LOW detection and provides a polarity setting. No buzzer is used.

The parking assistant sketch compiles successfully for **ESP32 Dev Module** with Espressif board package **3.3.12**. Sensor hardware validation is pending.

This project replaces the earlier Desk Buddy idea. We are reusing the existing [GitHub repository](https://github.com/ArgeeGabrielII/ESP32-Smart-Desk-Buddy); its repository name has not changed.
