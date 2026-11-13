#include <Arduino.h>

constexpr uint8_t SENSOR_PIN = 27;
constexpr uint8_t GREEN_LED_PIN = 25;
constexpr uint8_t RED_LED_PIN = 26;

// Start with active-LOW detection; change to HIGH if your sensor is reversed.
constexpr uint8_t OBSTACLE_LEVEL = LOW;
constexpr unsigned long STABLE_TIME_MS = 50;

int candidateReading = HIGH;
unsigned long candidateSince = 0;
bool hasStableReading = false;
bool obstacleDetected = false;

void showState(bool detected, int rawReading) {
  // Turn the other LED off before turning this one on.
  if (detected) {
    digitalWrite(GREEN_LED_PIN, LOW);
    digitalWrite(RED_LED_PIN, HIGH);
  } else {
    digitalWrite(RED_LED_PIN, LOW);
    digitalWrite(GREEN_LED_PIN, HIGH);
  }
  Serial.print("OUT=");
  Serial.print(rawReading == LOW ? "LOW" : "HIGH");
  Serial.println(detected ? " | OBSTACLE | red on" : " | CLEAR | green on");
}

void setup() {
  pinMode(GREEN_LED_PIN, OUTPUT);
  pinMode(RED_LED_PIN, OUTPUT);
  digitalWrite(GREEN_LED_PIN, LOW);
  digitalWrite(RED_LED_PIN, LOW);
  // Pull up to the ESP32's own 3.3 V logic supply.
  pinMode(SENSOR_PIN, INPUT_PULLUP);
  Serial.begin(115200);
  Serial.println("Mini Parking Assistant: sensor D27, green D25, red D26");
  candidateReading = digitalRead(SENSOR_PIN);
  candidateSince = millis();
}

void loop() {
  const unsigned long now = millis();
  const int reading = digitalRead(SENSOR_PIN);

  if (reading != candidateReading) {
    candidateReading = reading;
    candidateSince = now;
  }

  // Accept a change only after 50 ms without another input transition.
  if (now - candidateSince >= STABLE_TIME_MS) {
    const bool detected = candidateReading == OBSTACLE_LEVEL;
    if (!hasStableReading || detected != obstacleDetected) {
      hasStableReading = true;
      obstacleDetected = detected;
      showState(detected, candidateReading);
    }
  }
}
