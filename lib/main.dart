import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BLEHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BLEHomePage extends StatefulWidget {
  @override
  _BLEHomePageState createState() => _BLEHomePageState();
}

class _BLEHomePageState extends State<BLEHomePage> {
  List<ScanResult> devices = [];
  StreamSubscription? scanSubscription;

  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? characteristic;

  TextEditingController ssidController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final String serviceUUID = "12345678-1234-1234-1234-1234567890ab";
  final String charUUID = "abcd1234-1234-1234-1234-abcdef123456";

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  void requestPermissions() async {
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();
    await Permission.location.request();
  }

  /* ---------------- SCAN ---------------- */
  void startScan() {
    devices.clear();

    FlutterBluePlus.stopScan();

    FlutterBluePlus.startScan(timeout: Duration(seconds: 5));

    scanSubscription?.cancel();

    scanSubscription = FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        devices = results;
      });
    });
  }

  /* ---------------- CONNECT ---------------- */
  Future<void> connectToDevice(BluetoothDevice device) async {
    connectedDevice = device;

    await device.connect();

    List<BluetoothService> services =
    await device.discoverServices();

    for (var service in services) {
      if (service.uuid.toString() == serviceUUID) {
        for (var char in service.characteristics) {
          if (char.uuid.toString() == charUUID) {
            characteristic = char;
          }
        }
      }
    }

    setState(() {});
  }

  /* ---------------- SEND WIFI ---------------- */
  Future<void> sendWiFi() async {
    if (characteristic == null) return;

    String data =
        "${ssidController.text},${passController.text}";

    await characteristic!.write(data.codeUnits);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("WiFi Sent to ESP32")),
    );
  }

  /* ---------------- UI ---------------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ESP32 BLE WiFi Setup"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: startScan,
              child: Text("Scan ESP32"),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final device = devices[index].device;

                  return ListTile(
                    title: Text(
                      device.name.isEmpty
                          ? "Unknown Device"
                          : device.name,
                    ),
                    subtitle: Text(device.id.toString()),
                    onTap: () => connectToDevice(device),
                  );
                },
              ),
            ),

            TextField(
              controller: ssidController,
              decoration: InputDecoration(
                labelText: "WiFi SSID",
              ),
            ),

            TextField(
              controller: passController,
              decoration: InputDecoration(
                labelText: "WiFi Password",
              ),
              obscureText: true,
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: sendWiFi,
              child: Text("Send to ESP32"),
            ),

            SizedBox(height: 10),

            Text(
              connectedDevice == null
                  ? "Not connected"
                  : "Connected: ${connectedDevice!.name}",
            ),
          ],
        ),
      ),
    );
  }
}