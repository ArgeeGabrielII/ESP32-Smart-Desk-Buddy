# Brownbag session guide

## Goal

Build an ESP32 desk display that reads temperature and humidity from a DHT11 and shows them on an OLED.

Audience: beginners who can follow basic code and breadboard connections. Allow 60 minutes, with software installed beforehand. With the listed single set of parts, run one shared live build and let participants suggest or take turns making code changes.

## Before the session

- Complete [software setup](../setup/getting-started.md) and confirm the [hardware](../hardware/wiring.md).
- Once firmware exists, compile, upload, and run the complete demo on the actual parts.
- Record working software versions and the confirmed OLED controller, resolution, and address.
- Prepare a starter sketch with imports and pin definitions, plus the complete sketch for reference. These are planned deliverables and have not been added yet.

## Agenda

| Time | Activity | Outcome |
| --- | --- | --- |
| 0–5 min | Show the working Desk Buddy. | Participants see the target. |
| 5–15 min | Explain GPIO, sensor readings, I2C, `setup()`, and `loop()`. | Participants understand the data path. |
| 15–25 min | Wire the DHT11 and print readings to Serial Monitor. | Confirm the sensor works. |
| 25–40 min | Wire and initialize the OLED, then display the readings. | Complete the first build. |
| 40–50 min | Add a text status and handle failed readings. | Turn values into useful feedback. |
| 50–60 min | Try an exercise, check the result, and discuss extensions. | Reinforce the main ideas. |

## Coding steps

1. Define the sensor pin, I2C pins, and confirmed OLED settings.
2. In `setup()`, start Serial at `115200`, initialize the sensor, and initialize the display. Report a display initialization failure through Serial.
3. In `loop()`, use `millis()` to schedule a sensor read about every two seconds.
4. Check for failed readings. Display `Sensor error` if the read fails, and try again at the next interval.
5. For a successful read, print temperature and humidity to Serial and draw them on the OLED.

Explain the flow as **read → check → display**. Keep the first sketch in one file.

## Small exercise

Add a configurable temperature threshold and display `Warm` when the reading reaches it. Choose a threshold near the current room reading to demonstrate both states. This is a programming exercise, not a health or safety threshold.

If time remains, add Fahrenheit alongside Celsius using `F = C × 9 / 5 + 32`.

## Done when

- The sketch compiles and uploads to the actual ESP32.
- Serial and OLED show matching temperature and humidity readings.
- Readings refresh about every two seconds.
- A failed sensor read shows an error instead of a numeric reading, and normal display resumes after recovery. Unplug USB before changing wiring to test a disconnected sensor.
- The threshold exercise changes the text as expected.

After this works, choose one extension for another session: a light sensor, a motion indicator, or an LED status output.
