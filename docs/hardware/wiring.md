# Hardware and wiring

Start with the [electronics list](electronics-list.md) and [visual diagram](wiring-diagram.md).

## Confirm the obstacle module first

The ESP32 photo shows board labels D25, D26, and D27, which correspond to GPIO 25, 26, and 27.

The supplied photo confirms the obstacle module header order: with the sensor components facing you and the pins pointing down, **OUT, GND, VCC** run left to right. This plan assumes it supports **3.3 V power** and has a **3.3 V-compatible digital output**. Check its printed labels and exact product specifications before connecting power or OUT. Do not assume the order of VCC, GND, and OUT from another module's photo. If there is also an AO pin, leave AO disconnected.

Some infrared modules support 3.3–5 V, but that does not establish the rating of yours. If your module requires 5 V, stop and revise the circuit with appropriate signal interfacing; do not apply a 5 V output to the ESP32 input.

References: [Waveshare's example infrared module](https://www.waveshare.com/wiki/Infrared_Proximity_Sensor) illustrates model-specific ratings; [Espressif's ESP32 datasheet](https://documentation.espressif.com/esp32_datasheet_en.html) documents GPIO electrical limits.

## Wire with USB unplugged

1. Keep the ESP32 beside the breadboard so its headers remain accessible.
2. Connect ESP32 **3V3** to a red + rail and **GND** to a blue − rail. Use one continuous section of each rail; some rails are split. Keep the two rails separate.
3. After confirming the sensor's labels and ratings, connect it using the table below.
4. Wire each LED with its own 1 kΩ series resistor.

| Connection | Destination |
| --- | --- |
| Sensor VCC / + | Breadboard + rail (3.3 V), only after compatibility is confirmed |
| Sensor GND / − | Breadboard − rail (GND) |
| Sensor OUT / DO / DOUT | ESP32 D27 (GPIO 27) |
| ESP32 D25 (GPIO 25) | 1 kΩ resistor → green LED anode (+) |
| Green LED cathode (−) | GND rail |
| ESP32 D26 (GPIO 26) | 1 kΩ resistor → red LED anode (+) |
| Red LED cathode (−) | GND rail |

On an untrimmed typical LED, the longer lead is the anode. The shorter lead and the flat edge of the body usually identify the cathode. Check the LED's markings if its leads were trimmed.

Each five-hole group a–e in a numbered breadboard row is connected internally; f–j is a separate group. The center gap separates these groups. Put the LED's two legs in different connected groups so they are not shorted together. The resistor must be in series between the GPIO and the LED anode.

## Before connecting USB

- Verify the module's labels, voltage rating, and output compatibility.
- Trace both LED circuits and confirm there is a resistor in each.
- Check that no 3V3-to-GND short exists and all grounds are shared.
- Leave the buzzer disconnected.

After firmware is available, observe the sensor output with and without an object to establish its detection polarity. Many modules detect with LOW, but the code must match your actual module. Adjust the sensor potentiometer gently to demonstrate the detection threshold; do not treat it as a calibrated distance setting.

This is a proposed circuit. It has not been tested on the actual components.
