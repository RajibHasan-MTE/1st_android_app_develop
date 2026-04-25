#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include "DHT.h"

#define DHTPIN 4
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

// --- Custom UUID System ---
#define SERVICE_UUID        "4fafc201-0000-459e-8fcc-c5c9c331914b"
#define TEMP_CHAR_UUID       "4fafc201-0001-459e-8fcc-c5c9c331914b"
#define HUMID_CHAR_UUID      "4fafc201-0002-459e-8fcc-c5c9c331914b"

BLECharacteristic *pTempChar;
BLECharacteristic *pHumidChar;
bool deviceConnected = false;

class MyServerCallbacks: public BLEServerCallbacks {
    void onConnect(BLEServer* pServer) { deviceConnected = true; };
    void onDisconnect(BLEServer* pServer) { 
      deviceConnected = false; 
      pServer->getAdvertising()->start(); // Restart advertising so phone can reconnect
    }
};

void setup() {
  Serial.begin(115200);
  dht.begin();

  BLEDevice::init("ESP32_Weather_Station");
  BLEServer *pServer = BLEDevice::createServer();
  pServer->setCallbacks(new MyServerCallbacks());

  BLEService *pService = pServer->createService(SERVICE_UUID);

  // Create Temperature Characteristic
  pTempChar = pService->createCharacteristic(
                TEMP_CHAR_UUID,
                BLECharacteristic::PROPERTY_READ | BLECharacteristic::PROPERTY_NOTIFY
              );
  pTempChar->addDescriptor(new BLE2902()); // Required for Notifications

  // Create Humidity Characteristic
  pHumidChar = pService->createCharacteristic(
                HUMID_CHAR_UUID,
                BLECharacteristic::PROPERTY_READ | BLECharacteristic::PROPERTY_NOTIFY
              );
  pHumidChar->addDescriptor(new BLE2902());

  pService->start();
  pServer->getAdvertising()->start();
}

void loop() {
  if (deviceConnected) {
    float t = dht.readTemperature();
    float h = dht.readHumidity();

    if (!isnan(t) && !isnan(h)) {
      pTempChar->setValue(String(t).c_str());
      pTempChar->notify();

      pHumidChar->setValue(String(h).c_str());
      pHumidChar->notify();
      
      Serial.printf("Sent: T:%.1f H:%.1f\n", t, h);
    }
    delay(2000);
  }
}