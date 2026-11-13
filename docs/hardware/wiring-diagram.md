# Visual wiring diagram

![Proposed Mini Parking Assistant connections](assets/mini-parking-wiring.png)

This diagram shows electrical connections, not physical header positions. D25, D26, and D27 are printed labels on the photographed ESP32 board. The supplied sensor photo confirms its pin order: **OUT, GND, VCC**, left to right with the sensor facing you and pins pointing down.

**Keep USB unplugged while wiring.** The sensor branch is conditional: confirm its VCC/GND/OUT labels, 3.3 V power support, and output compatibility before connecting it. See the [wiring guide](wiring.md).

The first build has two LEDs and no buzzer connection. Each LED has a separate 1 kΩ resistor. Use the breadboard + rail for 3.3 V and the − rail for common ground.

The drawing source is [tools/draw-wiring.swift](../../tools/draw-wiring.swift). On macOS, regenerate it from the repository root:

```sh
CLANG_MODULE_CACHE_PATH=/tmp/desk-buddy-swift-cache swift tools/draw-wiring.swift docs/hardware/assets/mini-parking-wiring.png
```
