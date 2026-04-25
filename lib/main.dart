import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:convert';

void main() => runApp(const MaterialApp(home: SmartHomeStore(), debugShowCheckedModeBanner: false));

class SmartHomeStore extends StatefulWidget {
  const SmartHomeStore({super.key});
  @override
  _SmartHomeStoreState createState() => _SmartHomeStoreState();
}

class _SmartHomeStoreState extends State<SmartHomeStore> {
  String temp = "--", humid = "--";
  bool ledStatus = false;
  BluetoothCharacteristic? ledChar;
  BluetoothDevice? targetDevice;

  final String sUUID = "4fafc201-0000-459e-8fcc-c5c9c331914b";
  final String tUUID = "4fafc201-0001-459e-8fcc-c5c9c331914b";
  final String hUUID = "4fafc201-0002-459e-8fcc-c5c9c331914b";
  final String lUUID = "4fafc201-0003-459e-8fcc-c5c9c331914b";

  void startScan() async {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult r in results) {
        if (r.device.platformName == "ESP32_Full_Station") {
          FlutterBluePlus.stopScan();
          await r.device.connect();
          setState(() => targetDevice = r.device);
          discover(r.device);
          break;
        }
      }
    });
  }

  void discover(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    for (var s in services) {
      if (s.uuid.toString().toLowerCase() == sUUID) {
        for (var c in s.characteristics) {
          String uuid = c.uuid.toString().toLowerCase();
          if (uuid == lUUID) ledChar = c;
          if (uuid == tUUID || uuid == hUUID) {
            await c.setNotifyValue(true);
            c.lastValueStream.listen((val) {
              setState(() {
                if (uuid == tUUID) temp = utf8.decode(val);
                if (uuid == hUUID) humid = utf8.decode(val);
              });
            });
          }
        }
      }
    }
  }

  void toggleLed(bool val) async {
    if (ledChar != null) {
      await ledChar!.write((val ? "1" : "0").codeUnits);
      setState(() => ledStatus = val);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ESP32 Smart Hub")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (targetDevice == null) ElevatedButton(onPressed: startScan, child: const Text("Search ESP32")),
            Text("Temp: $temp°C", style: const TextStyle(fontSize: 30)),
            Text("Humid: $humid%", style: const TextStyle(fontSize: 30)),
            const Divider(),
            const Text("LED Control"),
            Switch(value: ledStatus, onChanged: toggleLed),
          ],
        ),
      ),
    );
  }
}