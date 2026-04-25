#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include "DHT.h"

#define DHTPIN 4
#define DHTTYPE DHT11
#define LED_PIN 2 // Internal LED on most ESP32s

DHT dht(DHTPIN, DHTTYPE);

#define SERVICE_UUID   "4fafc201-0000-459e-8fcc-c5c9c331914b"
#define TEMP_UUID      "4fafc201-0001-459e-8fcc-c5c9c331914b"
#define HUMID_UUID     "4fafc201-0002-459e-8fcc-c5c9c331914b"
#define LED_UUID       "4fafc201-0003-459e-8fcc-c5c9c331914b"

BLECharacteristic *pTempChar, *pHumidChar, *pLedChar;
bool deviceConnected = false;

// CALLBACK: Runs when Flutter writes to the LED UUID
class LedCallbacks: public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pCharacteristic) {
      // Use String (capital S) instead of std::string
      String value = pCharacteristic->getValue(); 

      if (value.length() > 0) {
        Serial.print("Received Value: ");
        Serial.println(value);

        if (value == "1") {
          digitalWrite(LED_PIN, HIGH);
        } else if (value == "0") {
          digitalWrite(LED_PIN, LOW);
        }
      }
    }
};

void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
  dht.begin();

  BLEDevice::init("ESP32_Full_Station");
  BLEServer *pServer = BLEDevice::createServer();
  BLEService *pService = pServer->createService(SERVICE_UUID);

  // Weather Characteristics (Notify)
  pTempChar = pService->createCharacteristic(TEMP_UUID, BLECharacteristic::PROPERTY_NOTIFY);
  pTempChar->addDescriptor(new BLE2902());
  
  pHumidChar = pService->createCharacteristic(HUMID_UUID, BLECharacteristic::PROPERTY_NOTIFY);
  pHumidChar->addDescriptor(new BLE2902());

  // LED Characteristic (Write)
  pLedChar = pService->createCharacteristic(LED_UUID, BLECharacteristic::PROPERTY_WRITE);
  pLedChar->setCallbacks(new LedCallbacks()); // Attach the listener here!

  pService->start();
  pServer->getAdvertising()->start();
}

void loop() {
  float t = dht.readTemperature();
  float h = dht.readHumidity();
  if (!isnan(t) && !isnan(h)) {
    pTempChar->setValue(String(t).c_str());
    pTempChar->notify();
    pHumidChar->setValue(String(h).c_str());
    pHumidChar->notify();
  }
  delay(2000);
}