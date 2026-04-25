#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <ArduinoJson.h>
#include "DHT.h"

// Update these for each room
#define ROOM_NAME "ESP32_Room_1" 
#define LED_PIN 2
#define FAN_PIN 15
#define DHTPIN 4
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);

#define SERVICE_UUID "4fafc201-0000-459e-8fcc-c5c9c331914b"
#define DATA_UUID    "4fafc201-0001-459e-8fcc-c5c9c331914b" // For Temperature/Humidity
#define CTRL_UUID    "4fafc201-0002-459e-8fcc-c5c9c331914b" // For Light/Fan

BLECharacteristic *pDataChar;
bool deviceConnected = false;

void sendSensorData() {
  if (deviceConnected) {
    StaticJsonDocument<200> doc;
    float t = dht.readTemperature();
    float h = dht.readHumidity();

    doc["temp"] = isnan(t) ? 0.0 : t;
    doc["humid"] = isnan(h) ? 0.0 : h;
    doc["light"] = digitalRead(LED_PIN) == HIGH ? 1 : 0;
    doc["fan"] = digitalRead(FAN_PIN) == HIGH ? 1 : 0;

    char buffer[200];
    serializeJson(doc, buffer);
    pDataChar->setValue(buffer);
    pDataChar->notify();
  }
}

class ControlCallbacks: public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pChar) {
      String val = pChar->getValue();
      StaticJsonDocument<100> doc;
      deserializeJson(doc, val);

      if (doc.containsKey("l")) digitalWrite(LED_PIN, doc["l"] == 1 ? HIGH : LOW);
      if (doc.containsKey("f")) digitalWrite(FAN_PIN, doc["f"] == 1 ? HIGH : LOW);
      sendSensorData(); // Push update immediately
    }
};

class ServerCallbacks: public BLEServerCallbacks {
    void onConnect(BLEServer* pServer) { deviceConnected = true; }
    void onDisconnect(BLEServer* pServer) { 
      deviceConnected = false; 
      pServer->getAdvertising()->start();
    }
};

void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
  pinMode(FAN_PIN, OUTPUT);
  dht.begin();

  BLEDevice::init(ROOM_NAME);
  BLEServer *pServer = BLEDevice::createServer();
  pServer->setCallbacks(new ServerCallbacks());

  BLEService *pService = pServer->createService(SERVICE_UUID);
  pDataChar = pService->createCharacteristic(DATA_UUID, BLECharacteristic::PROPERTY_NOTIFY);
  pDataChar->addDescriptor(new BLE2902());

  BLECharacteristic *pCtrl = pService->createCharacteristic(CTRL_UUID, BLECharacteristic::PROPERTY_WRITE);
  pCtrl->setCallbacks(new ControlCallbacks());

  pService->start();
  pServer->getAdvertising()->start();
}

void loop() {
  sendSensorData();
  delay(2000);
}