#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include "DHT.h"

// --- CONFIGURE THIS FOR EACH ROOM ---
#define ROOM_NAME "ESP32_Room_1" 
#define LED_PIN 2   // Light
#define FAN_PIN 15  // Fan
#define DHTPIN 4
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);

#define SERVICE_UUID "4fafc201-0000-459e-8fcc-c5c9c331914b"
#define DATA_UUID    "4fafc201-0001-459e-8fcc-c5c9c331914b" // Temp & Humid
#define CTRL_UUID    "4fafc201-0002-459e-8fcc-c5c9c331914b" // Fan & Light

BLECharacteristic *pDataChar;

class ControlCallbacks: public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pChar) {
      String val = pChar->getValue();
      if (val == "L_ON") digitalWrite(LED_PIN, HIGH);
      else if (val == "L_OFF") digitalWrite(LED_PIN, LOW);
      else if (val == "F_ON") digitalWrite(FAN_PIN, HIGH);
      else if (val == "F_OFF") digitalWrite(FAN_PIN, LOW);
    }
};

void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
  pinMode(FAN_PIN, OUTPUT);
  dht.begin();

  BLEDevice::init(ROOM_NAME);
  BLEServer *pServer = BLEDevice::createServer();
  BLEService *pService = pServer->createService(SERVICE_UUID);

  pDataChar = pService->createCharacteristic(DATA_UUID, BLECharacteristic::PROPERTY_NOTIFY);
  pDataChar->addDescriptor(new BLE2902());

  BLECharacteristic *pCtrl = pService->createCharacteristic(CTRL_UUID, BLECharacteristic::PROPERTY_WRITE);
  pCtrl->setCallbacks(new ControlCallbacks());

  pService->start();
  pServer->getAdvertising()->start();
}

void loop() {
  float t = dht.readTemperature();
  float h = dht.readHumidity();
  if (!isnan(t)) {
    // Send combined string "Temp,Humid"
    String data = String(t) + "," + String(h);
    pDataChar->setValue(data.c_str());
    pDataChar->notify();
  }
  delay(2000);
}