#include <Arduino.h>

// One 1 kOhm series resistor per LED; cathodes share ESP32 GND.
// Leave the obstacle sensor and buzzer disconnected during this test.
constexpr uint8_t RED_LED_PIN = 26;
constexpr uint8_t GREEN_LED_PIN = 25;

void setup() {
  pinMode(RED_LED_PIN, OUTPUT);
  pinMode(GREEN_LED_PIN, OUTPUT);
  digitalWrite(RED_LED_PIN, LOW);
  digitalWrite(GREEN_LED_PIN, LOW);
  Serial.begin(115200);
}

void loop() {
  digitalWrite(GREEN_LED_PIN, LOW);
  digitalWrite(RED_LED_PIN, HIGH);
  Serial.println("RED on; GREEN off");
  delay(1000);

  digitalWrite(RED_LED_PIN, LOW);
  digitalWrite(GREEN_LED_PIN, HIGH);
  Serial.println("GREEN on; RED off");
  delay(1000);

  digitalWrite(GREEN_LED_PIN, LOW);
  Serial.println("Both LEDs off");
  delay(1000);
}
