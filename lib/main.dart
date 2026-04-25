import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:convert';

void main() => runApp(const MaterialApp(home: MultiRoomHub(), debugShowCheckedModeBanner: false));

class MultiRoomHub extends StatefulWidget {
  const MultiRoomHub({super.key});
  @override
  _MultiRoomHubState createState() => _MultiRoomHubState();
}

class _MultiRoomHubState extends State<MultiRoomHub> {
  List<BluetoothDevice> foundRooms = [];
  BluetoothDevice? activeDevice;
  BluetoothCharacteristic? ctrlChar;
  String temp = "--", humid = "--";

  final String sUUID = "4fafc201-0000-459e-8fcc-c5c9c331914b";
  final String dUUID = "4fafc201-0001-459e-8fcc-c5c9c331914b";
  final String cUUID = "4fafc201-0002-459e-8fcc-c5c9c331914b";

  void scanForRooms() {
    setState(() => foundRooms.clear());
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult r in results) {
        // Filter for our specific room prefix
        if (r.device.platformName.startsWith("ESP32_Room") && !foundRooms.contains(r.device)) {
          setState(() => foundRooms.add(r.device));
        }
      }
    });
  }

  void connectToRoom(BluetoothDevice device) async {
    await device.connect();
    setState(() => activeDevice = device);

    List<BluetoothService> services = await device.discoverServices();
    for (var s in services) {
      if (s.uuid.toString() == sUUID) {
        for (var c in s.characteristics) {
          if (c.uuid.toString() == cUUID) ctrlChar = c;
          if (c.uuid.toString() == dUUID) {
            await c.setNotifyValue(true);
            c.lastValueStream.listen((val) {
              String raw = utf8.decode(val);
              setState(() {
                temp = raw.split(",")[0];
                humid = raw.split(",")[1];
              });
            });
          }
        }
      }
    }
  }

  void sendCmd(String cmd) async {
    if (ctrlChar != null) await ctrlChar!.write(cmd.codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Hub - MultiRoom")),
      body: activeDevice == null ? buildRoomList() : buildControlPanel(),
      floatingActionButton: activeDevice == null ? FloatingActionButton(onPressed: scanForRooms, child: const Icon(Icons.search)) : null,
    );
  }

  Widget buildRoomList() {
    return ListView.builder(
      itemCount: foundRooms.length,
      itemBuilder: (c, i) => ListTile(
        leading: const Icon(Icons.meeting_room),
        title: Text(foundRooms[i].platformName),
        onTap: () => connectToRoom(foundRooms[i]),
      ),
    );
  }

  Widget buildControlPanel() {
    return Column(
      children: [
        ListTile(
          title: Text("Connected to ${activeDevice!.platformName}"),
          trailing: TextButton(onPressed: () => setState(() => activeDevice = null), child: const Text("Exit Room")),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _statCard("Temp", "$temp°C", Colors.orange),
          _statCard("Humid", "$humid%", Colors.blue),
        ]),
        const SizedBox(height: 20),
        _controlBtn("Light", "L_ON", "L_OFF", Icons.lightbulb),
        _controlBtn("Fan", "F_ON", "F_OFF", Icons.wind_power),
      ],
    );
  }

  Widget _statCard(String label, String val, Color col) {
    return Card(child: Container(padding: const EdgeInsets.all(20), child: Column(children: [Text(label), Text(val, style: TextStyle(fontSize: 24, color: col))])));
  }

  Widget _controlBtn(String label, String on, String off, IconData icon) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(label),
      IconButton(icon: Icon(icon, color: Colors.green), onPressed: () => sendCmd(on)),
      IconButton(icon: Icon(icon, color: Colors.red), onPressed: () => sendCmd(off)),
    ]);
  }
}