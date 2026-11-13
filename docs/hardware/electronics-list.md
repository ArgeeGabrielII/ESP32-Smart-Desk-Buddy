# Electronics list

## Required for the first build

All required components are in the supplied kit, provided the obstacle module supports 3.3 V operation and ESP32-compatible output levels.

| Component | Quantity | Purpose |
| --- | --- | --- |
| ESP32 development board | 1 | Read the sensor and control the LEDs. |
| Obstacle avoidance module | 1 | Detect an object using its digital output. |
| Green LED | 1 | Indicate no obstacle detected. |
| Red LED | 1 | Indicate an obstacle detected. |
| 1 kΩ resistor | 2 | Limit LED current; one resistor per LED. |
| 830-point breadboard | 1 | Hold the LED circuits and share power/ground. |
| Micro USB data cable | 1 | Power the board and upload code. |
| Jumper wires | About 12 | Connect headers, breadboard rows, and rails. |

Use female-to-male jumpers for male board/module headers to breadboard connections and male-to-male jumpers within the breadboard. Female-to-female jumpers can connect male headers directly. The exact mix depends on placement.

Use the 1 kΩ resistors for this first build. Resistors have no polarity. Every LED needs its own series resistor.

## Parts not used

The project uses LEDs only. Leave both buzzers disconnected.

The OLED, DHT11, PIR sensor, relays, and remaining kit parts are not needed for this build.

Next: [visual wiring diagram](wiring-diagram.md).
