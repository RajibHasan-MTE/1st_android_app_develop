#include <WiFi.h>
#include <WebServer.h>
#include <Preferences.h>

#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
//adhflsdjfl
/* ---------------- Storages ---------------- */
Preferences prefs;
WebServer server(80);

/* ---------------- LED ---------------- */
#define LED_PIN 2

String ssid = "";
String password = "";

/* ---------------- BLE UUID ---------------- */
#define SERVICE_UUID        "12345678-1234-1234-1234-1234567890ab"
#define CHARACTERISTIC_UUID "abcd1234-1234-1234-1234-abcdef123456"

/* ---------------- BLE Callback ---------------- */
class CharCB : public BLECharacteristicCallbacks {
  void onWrite(BLECharacteristic *c) override {

    // ESP32 Core 3.x → returns Arduino String
    String rx = c->getValue();

    Serial.println("BLE Received: " + rx);

    int sep = rx.indexOf(',');

    if (sep > 0) {
      ssid = rx.substring(0, sep);
      password = rx.substring(sep + 1);

      Serial.println("SSID: " + ssid);
      Serial.println("PASS: " + password);

      prefs.begin("wifi", false);
      prefs.putString("ssid", ssid);
      prefs.putString("pass", password);
      prefs.end();

      Serial.println("Saved WiFi credentials. Restarting...");
      delay(1000);

      ESP.restart();
    }
  }
};

/* ---------------- WiFi Connect ---------------- */
void connectWiFi() {

  prefs.begin("wifi", true);
  ssid = prefs.getString("ssid", "");
  password = prefs.getString("pass", "");
  prefs.end();

  if (ssid == "") {
    Serial.println("No WiFi credentials found.");
    return;
  }

  WiFi.begin(ssid.c_str(), password.c_str());

  Serial.print("Connecting WiFi");

  int count = 0;
  while (WiFi.status() != WL_CONNECTED && count < 20) {
    delay(500);
    Serial.print(".");
    count++;
  }

  Serial.println("");

  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("WiFi Connected!");
    Serial.println(WiFi.localIP());
  } else {
    Serial.println("WiFi Failed");
  }
}

/* ---------------- Web Server ---------------- */
void handleRoot() {
  String html =
    "<h2>ESP32 LED Control</h2>"
    "<a href='/on'>Turn ON</a><br><br>"
    "<a href='/off'>Turn OFF</a>";

  server.send(200, "text/html", html);
}

void handleOn() {
  digitalWrite(LED_PIN, HIGH);
  server.send(200, "text/plain", "LED ON");
}

void handleOff() {
  digitalWrite(LED_PIN, LOW);
  server.send(200, "text/plain", "LED OFF");
}

/* ---------------- Setup ---------------- */
void setup() {
  Serial.begin(115200);

  pinMode(LED_PIN, OUTPUT);
  digitalWrite(LED_PIN, LOW);

  /* ---------- WiFi ---------- */
  connectWiFi();

  if (WiFi.status() == WL_CONNECTED) {
    server.on("/", handleRoot);
    server.on("/on", handleOn);
    server.on("/off", handleOff);
    server.begin();

    Serial.println("Web Server Started");
  }

  /* ---------- BLE ---------- */
  BLEDevice::init("ESP32-WIFI-SETUP");

  BLEServer *serverBLE = BLEDevice::createServer();

  BLEService *service = serverBLE->createService(SERVICE_UUID);

  BLECharacteristic *characteristic =
    service->createCharacteristic(
      CHARACTERISTIC_UUID,
      BLECharacteristic::PROPERTY_WRITE
    );

  characteristic->setCallbacks(new CharCB());

  service->start();

  BLEAdvertising *advertising = BLEDevice::getAdvertising();
  advertising->start();

  Serial.println("BLE Ready - Waiting for WiFi credentials");
}

/* ---------------- Loop ---------------- */
void loop() {
  server.handleClient();
}