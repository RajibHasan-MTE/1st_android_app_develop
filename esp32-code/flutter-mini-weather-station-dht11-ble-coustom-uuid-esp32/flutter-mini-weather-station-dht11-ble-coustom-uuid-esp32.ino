#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <Preferences.h>
#include "DHT.h"

// ================= CONFIG =================
#define LED_PIN 2
#define FAN_PIN 15
#define DHTPIN 4
#define DHTTYPE DHT11

#define SERVICE_UUID "4fafc201-0000-459e-8fcc-c5c9c331914b"
#define DATA_UUID    "4fafc201-0001-459e-8fcc-c5c9c331914b"
#define CTRL_UUID    "4fafc201-0002-459e-8fcc-c5c9c331914b"
#define CONFIG_UUID  "4fafc201-0003-459e-8fcc-c5c9c331914b"

// ================= GLOBAL =================
Preferences prefs;
DHT dht(DHTPIN, DHTTYPE);

BLECharacteristic *dataChar;
String deviceName;

// ================= CONTROL CALLBACK =================
class ControlCallbacks: public BLECharacteristicCallbacks {
  void onWrite(BLECharacteristic *c) {
    String val = c->getValue();

    if (val == "L_ON") digitalWrite(LED_PIN, HIGH);
    else if (val == "L_OFF") digitalWrite(LED_PIN, LOW);
    else if (val == "F_ON") digitalWrite(FAN_PIN, HIGH);
    else if (val == "F_OFF") digitalWrite(FAN_PIN, LOW);
  }
};

// ================= CONFIG CALLBACK (INSTALLER MODE) =================
class ConfigCallbacks: public BLECharacteristicCallbacks {
  void onWrite(BLECharacteristic *c) {
    String val = c->getValue();

    // ---------- RENAME DEVICE ----------
    if (val.startsWith("NAME:")) {
      String newName = val.substring(5);

      prefs.begin("cfg", false);
      prefs.putString("name", newName);
      prefs.end();

      Serial.println("Device renamed to: " + newName);
      delay(500);
      ESP.restart();
    }

    // ---------- FACTORY RESET ----------
    if (val == "RESET") {
      prefs.begin("cfg", false);
      prefs.clear();
      prefs.end();

      Serial.println("Factory reset done");
      delay(500);
      ESP.restart();
    }
  }
};

// ================= SETUP =================
void setup() {
  Serial.begin(115200);

  pinMode(LED_PIN, OUTPUT);
  pinMode(FAN_PIN, OUTPUT);
  dht.begin();

  // ---------- LOAD SAVED NAME ----------
  prefs.begin("cfg", true);
  deviceName = prefs.getString("name", "NEW_DEVICE");
  prefs.end();

  Serial.println("Starting BLE as: " + deviceName);

  // ---------- INIT BLE ----------
  BLEDevice::init(deviceName.c_str());

  BLEServer *server = BLEDevice::createServer();
  BLEService *service = server->createService(SERVICE_UUID);

  // ---------- SENSOR DATA ----------
  dataChar = service->createCharacteristic(
    DATA_UUID,
    BLECharacteristic::PROPERTY_NOTIFY
  );
  dataChar->addDescriptor(new BLE2902());

  // ---------- USER CONTROL ----------
  BLECharacteristic *ctrlChar = service->createCharacteristic(
    CTRL_UUID,
    BLECharacteristic::PROPERTY_WRITE
  );
  ctrlChar->setCallbacks(new ControlCallbacks());

  // ---------- INSTALLER CONFIG ----------
  BLECharacteristic *cfgChar = service->createCharacteristic(
    CONFIG_UUID,
    BLECharacteristic::PROPERTY_WRITE
  );
  cfgChar->setCallbacks(new ConfigCallbacks());

  service->start();
  server->getAdvertising()->start();

  Serial.println("BLE Ready");
}

// ================= LOOP =================
void loop() {
  float t = dht.readTemperature();
  float h = dht.readHumidity();

  if (!isnan(t) && !isnan(h)) {
    String payload = String(t) + "," + String(h);
    dataChar->setValue(payload.c_str());
    dataChar->notify();
  }

  delay(2000);
}