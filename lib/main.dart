import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:convert';

void main() => runApp(const MaterialApp(home: WeatherPage()));

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String temp = "--";
  String humid = "--";
  BluetoothDevice? connectedDevice;

  final String serviceUUID = "4fafc201-0000-459e-8fcc-c5c9c331914b";
  final String tempUUID    = "4fafc201-0001-459e-8fcc-c5c9c331914b";
  final String humidUUID   = "4fafc201-0002-459e-8fcc-c5c9c331914b";

  void findAndConnect() async {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult r in results) {
        if (r.device.platformName == "ESP32_Weather_Station") {
          FlutterBluePlus.stopScan();
          await r.device.connect();
          setState(() => connectedDevice = r.device);
          setupNotifications(r.device);
          break;
        }
      }
    });
  }

  void setupNotifications(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    for (var s in services) {
      if (s.uuid.toString() == serviceUUID) {
        for (var c in s.characteristics) {
          // Subscribe to both temperature and humidity
          await c.setNotifyValue(true);
          c.lastValueStream.listen((value) {
            String data = utf8.decode(value);
            setState(() {
              if (c.uuid.toString() == tempUUID) temp = data;
              if (c.uuid.toString() == humidUUID) humid = data;
            });
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(title: const Text("ESP32 Weather Station")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (connectedDevice == null)
              ElevatedButton(onPressed: findAndConnect, child: const Text("Connect to ESP32")),

            const SizedBox(height: 40),
            _weatherTile(Icons.thermostat, "Temperature", "$temp°C", Colors.orange),
            const SizedBox(height: 20),
            _weatherTile(Icons.water_drop, "Humidity", "$humid%", Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _weatherTile(IconData icon, String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey)),
              Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}