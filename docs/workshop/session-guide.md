# Brownbag session guide

## Goal

Build a Mini Parking Assistant with an ESP32, an infrared obstacle module, and two LEDs. Green means no obstacle detected; red means an obstacle detected. This is a tabletop learning demo, not a vehicle safety device or a distance meter.

With one kit, use a shared live build and let participants take turns changing code. Allow 45–60 minutes, with Arduino IDE installed beforehand.

## Prepare

- Gather the [electronics](../hardware/electronics-list.md).
- Confirm the sensor model, pin labels, voltage support, and output polarity.
- Complete the [wiring checks](../hardware/wiring.md).
- Once firmware exists, test it on the actual parts and prepare starter and complete sketches.

## Agenda

| Time | Activity |
| --- | --- |
| 0–5 min | Show an object triggering the red LED. |
| 5–15 min | Explain digital inputs, outputs, LED polarity, and series resistors. |
| 15–30 min | Build the two LED circuits and verify them with firmware. |
| 30–45 min | Add the confirmed sensor and connect detection to the LED state. |
| 45–60 min | Adjust the detection threshold and try a small coding exercise. |

## Coding exercise

Read GPIO 27, interpret the sensor's actual detection polarity, then turn on exactly one LED. Add a short confirmation interval if the state flickers near the threshold. Print the state to Serial only when it changes.

## Done when

- Firmware compiles and uploads.
- Green lights when the sensor reports clear.
- Red lights when the sensor reports an obstacle.
- Removing the object restores green.
- Each LED has a separate 1 kΩ resistor.
- No unconfirmed buzzer is connected.

Discuss how surface color, angle, and lighting change detection. Consider an audible alert only after confirming the buzzer's electrical requirements and driver circuit.
