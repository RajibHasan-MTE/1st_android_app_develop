import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

void main() => runApp(const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));

// --- HOME PAGE (MAIN DASHBOARD) ---
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> savedRooms = [];
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? ctrlChar;
  Map<String, dynamic> status = {"t": 0, "h": 0, "l": 0, "f": 0};

  @override
  void initState() {
    super.initState();
    loadSavedRooms();
  }

  Future<void> loadSavedRooms() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> raw = prefs.getStringList('rooms') ?? [];
    setState(() {
      savedRooms = raw.map((s) => Map<String, String>.from(jsonDecode(s))).toList();
    });
  }

  void connect(String id) async {
    try {
      BluetoothDevice device = BluetoothDevice.fromId(id);
      await device.connect();
      setState(() => connectedDevice = device);

      List<BluetoothService> services = await device.discoverServices();
      for (var s in services) {
        if (s.uuid.toString().contains("0000")) { // Service
          for (var c in s.characteristics) {
            if (c.uuid.toString().contains("0002")) ctrlChar = c; // Control
            if (c.uuid.toString().contains("0001")) { // Data
              await c.setNotifyValue(true);
              c.lastValueStream.listen((val) {
                if (val.isNotEmpty && mounted) {
                  setState(() => status = jsonDecode(utf8.decode(val)));
                }
              });
            }
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Could not connect!")));
    }
  }

  void toggle(String key, int val) async {
    if (ctrlChar != null) await ctrlChar!.write(jsonEncode({key: val}).codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Smart Building"), actions: [
        IconButton(icon: const Icon(Icons.add_box), onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (c) => const AddRoomPage())).then((_) => loadSavedRooms()))
      ]),
      body: Column(children: [
        if (connectedDevice != null) _buildLiveControl(),
        const Padding(padding: EdgeInsets.all(10), child: Text("Your Configured Rooms", style: TextStyle(color: Colors.grey))),
        Expanded(child: ListView.builder(
          itemCount: savedRooms.length,
          itemBuilder: (c, i) => ListTile(
            leading: const Icon(Icons.home),
            title: Text(savedRooms[i]['name']!),
            subtitle: Text(savedRooms[i]['id']!),
            onTap: () => connect(savedRooms[i]['id']!),
          ),
        ))
      ]),
    );
  }

  Widget _buildLiveControl() {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.blue[50],
      child: Column(children: [
        ListTile(title: Text("Controlling: ${connectedDevice!.platformName}"), trailing: const Icon(Icons.bluetooth_connected, color: Colors.blue)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text("${status['t']}°C", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text("${status['h']}% Humid", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ]),
        ButtonBar(alignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () => toggle("l", status['l'] == 1 ? 0 : 1), child: Text(status['l'] == 1 ? "Light OFF" : "Light ON")),
          ElevatedButton(onPressed: () => toggle("f", status['f'] == 1 ? 0 : 1), child: Text(status['f'] == 1 ? "Fan OFF" : "Fan ON")),
        ])
      ]),
    );
  }
}

// --- SCAN & ADD PAGE ---
class AddRoomPage extends StatefulWidget {
  const AddRoomPage({super.key});
  @override
  _AddRoomPageState createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<AddRoomPage> {
  List<ScanResult> results = [];
  final TextEditingController _nameController = TextEditingController();
  StreamSubscription? _scanSub;

  @override
  void dispose() {
    _scanSub?.cancel();
    FlutterBluePlus.stopScan();
    super.dispose();
  }

  void startScan() async {
    setState(() => results.clear());
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
    _scanSub = FlutterBluePlus.scanResults.listen((res) {
      if (mounted) {
        setState(() => results = res.where((r) => r.device.platformName.toUpperCase().contains("ESP32")).toList());
      }
    });
  }

  void saveRoom(BluetoothDevice d) async {
    if (_nameController.text.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    List<String> raw = prefs.getStringList('rooms') ?? [];

    // Save locally
    raw.add(jsonEncode({'name': _nameController.text, 'id': d.remoteId.toString()}));
    await prefs.setStringList('rooms', raw);

    // Optional: Send name change command to ESP32
    try {
      await d.connect();
      var services = await d.discoverServices();
      for (var s in services) {
        for (var c in s.characteristics) {
          if (c.uuid.toString().contains("0002")) {
            await c.write(jsonEncode({"name": _nameController.text}).codeUnits);
          }
        }
      }
    } catch (e) { /* silent fail */ }

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Device Configuration")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Set Room Name (e.g. Living Room)")),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: startScan, child: const Text("Scan for Nearby ESP32s")),
          const Divider(),
          Expanded(child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (c, i) => ListTile(
              title: Text(results[i].device.platformName),
              subtitle: Text(results[i].device.remoteId.toString()),
              trailing: const Icon(Icons.add_circle_outline),
              onTap: () => saveRoom(results[i].device),
            ),
          ))
        ]),
      ),
    );
  }
}