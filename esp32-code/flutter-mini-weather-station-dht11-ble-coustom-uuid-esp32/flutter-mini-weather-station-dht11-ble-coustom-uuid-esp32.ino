#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <ArduinoJson.h>
#include <Preferences.h>
#include "DHT.h"

#define LED_PIN 2
#define FAN_PIN 15
#define DHTPIN 4
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);
Preferences prefs;
String roomName;

#define SERVICE_UUID "4fafc201-0000-459e-8fcc-c5c9c331914b"
#define DATA_UUID "4fafc201-0001-459e-8fcc-c5c9c331914b"
#define CTRL_UUID "4fafc201-0002-459e-8fcc-c5c9c331914b"

BLECharacteristic *pDataChar;
bool deviceConnected = false;

class MyCallbacks : public BLECharacteristicCallbacks {
  void onWrite(BLECharacteristic *pChar) {
    String val = pChar->getValue();
    StaticJsonDocument<200> doc;
    deserializeJson(doc, val);

    if (doc.containsKey("name")) {
      prefs.begin("settings", false);
      prefs.putString("room", doc["name"].as<String>());
      prefs.end();
      ESP.restart();
    }
    if (doc.containsKey("l")) digitalWrite(LED_PIN, doc["l"] == 1 ? HIGH : LOW);
    if (doc.containsKey("f")) digitalWrite(FAN_PIN, doc["f"] == 1 ? HIGH : LOW);
  }
};

class ServerCallbacks : public BLEServerCallbacks {
  void onConnect(BLEServer *pS) {
    deviceConnected = true;
  }
  void onDisconnect(BLEServer *pS) {
    deviceConnected = false;
    pS->getAdvertising()->start();
  }
};

void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
  pinMode(FAN_PIN, OUTPUT);
  dht.begin();

  prefs.begin("settings", true);
  roomName = prefs.getString("room", "New_ESP32_Device");
  prefs.end();

  BLEDevice::init(roomName.c_str());
  BLEServer *pServer = BLEDevice::createServer();
  pServer->setCallbacks(new ServerCallbacks());

  BLEService *pService = pServer->createService(SERVICE_UUID);
  pDataChar = pService->createCharacteristic(DATA_UUID, BLECharacteristic::PROPERTY_NOTIFY);
  pDataChar->addDescriptor(new BLE2902());

  BLECharacteristic *pCtrl = pService->createCharacteristic(CTRL_UUID, BLECharacteristic::PROPERTY_WRITE);
  pCtrl->setCallbacks(new MyCallbacks());

  pService->start();
  pServer->getAdvertising()->start();
}

void loop() {
  if (deviceConnected) {
    StaticJsonDocument<128> doc;
    doc["t"] = dht.readTemperature();
    doc["h"] = dht.readHumidity();
    doc["l"] = digitalRead(LED_PIN);
    doc["f"] = digitalRead(FAN_PIN);
    char buf[128];
    serializeJson(doc, buf);
    pDataChar->setValue(buf);
    pDataChar->notify();
  }
  delay(2000);
}