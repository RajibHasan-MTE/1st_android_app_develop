import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:convert';

void main() => runApp(const MaterialApp(home: DeviceListScreen(), debugShowCheckedModeBanner: false));

// --- SCREEN 1: LIST OF DEVICES ---
class DeviceListScreen extends StatefulWidget {
  const DeviceListScreen({super.key});
  @override
  _DeviceListScreenState createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  List<ScanResult> devices = [];

  void startScan() {
    setState(() => devices.clear());
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    FlutterBluePlus.scanResults.listen((results) {
      // Filter for ESP32 devices
      setState(() => devices = results.where((r) => r.device.platformName.contains("ESP32")).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Building Devices")),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (c, i) => ListTile(
          leading: const Icon(Icons.meeting_room),
          title: Text(devices[i].device.platformName),
          subtitle: Text(devices[i].device.remoteId.toString()),
          onTap: () {
            FlutterBluePlus.stopScan();
            Navigator.push(context, MaterialPageRoute(builder: (context) => ControlPanel(device: devices[i].device)));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: startScan, child: const Icon(Icons.search)),
    );
  }
}

// --- SCREEN 2: CONTROL PANEL ---
class ControlPanel extends StatefulWidget {
  final BluetoothDevice device;
  const ControlPanel({super.key, required this.device});

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  BluetoothCharacteristic? ctrlChar;
  double temp = 0.0, humid = 0.0;
  bool lightStatus = false, fanStatus = false;

  final String sUUID = "4fafc201-0000-459e-8fcc-c5c9c331914b";
  final String dUUID = "4fafc201-0001-459e-8fcc-c5c9c331914b";
  final String cUUID = "4fafc201-0002-459e-8fcc-c5c9c331914b";

  @override
  void initState() {
    super.initState();
    connectAndDiscover();
  }

  void connectAndDiscover() async {
    await widget.device.connect();
    List<BluetoothService> services = await widget.device.discoverServices();
    for (var s in services) {
      if (s.uuid.toString().toLowerCase() == sUUID) {
        for (var c in s.characteristics) {
          String charUuid = c.uuid.toString().toLowerCase();
          if (charUuid == cUUID) ctrlChar = c;
          if (charUuid == dUUID) {
            await c.setNotifyValue(true);
            c.lastValueStream.listen((value) {
              if (value.isNotEmpty) {
                String raw = utf8.decode(value);
                Map<String, dynamic> data = jsonDecode(raw);
                setState(() {
                  temp = (data['temp'] as num).toDouble();
                  humid = (data['humid'] as num).toDouble();
                  lightStatus = data['light'] == 1;
                  fanStatus = data['fan'] == 1;
                });
              }
            });
          }
        }
      }
    }
  }

  void sendCmd(String key, int val) async {
    if (ctrlChar != null) {
      String cmd = jsonEncode({key: val});
      await ctrlChar!.write(cmd.codeUnits);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.device.platformName)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              _weatherItem("Temp", "$temp°C", Icons.thermostat, Colors.orange),
              _weatherItem("Humid", "$humid%", Icons.water_drop, Colors.blue),
            ]),
            const SizedBox(height: 40),
            SwitchListTile(
              title: const Text("Room Light"),
              value: lightStatus,
              onChanged: (v) => sendCmd("l", v ? 1 : 0),
            ),
            SwitchListTile(
              title: const Text("Room Fan"),
              value: fanStatus,
              onChanged: (v) => sendCmd("f", v ? 1 : 0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weatherItem(String label, String value, IconData icon, Color color) {
    return Column(children: [
      Icon(icon, color: color, size: 40),
      Text(label, style: const TextStyle(color: Colors.grey)),
      Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    ]);
  }
}