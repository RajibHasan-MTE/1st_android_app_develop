import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(const SmartLifeClone());
}

// ================= APP =================
class SmartLifeClone extends StatelessWidget {
  const SmartLifeClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeDashboard(),
    );
  }
}

// ================= HOME DASHBOARD =================
class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  List<BluetoothDevice> rooms = [];
  BluetoothDevice? currentDevice;
  BluetoothCharacteristic? ctrlChar, dataChar, configChar;

  String temp = "--";
  String humid = "--";
  String currentRoom = "No Room";

  bool connecting = false;

  StreamSubscription? scanSub;

  final serviceUUID = "4fafc201-0000-459e-8fcc-c5c9c331914b";

  @override
  void initState() {
    super.initState();
    startScan();
  }

  @override
  void dispose() {
    scanSub?.cancel();
    FlutterBluePlus.stopScan();
    currentDevice?.disconnect();
    super.dispose();
  }

  // ================= SCAN =================
  void startScan() {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 0));

    scanSub = FlutterBluePlus.scanResults.listen((results) {
      for (var r in results) {
        if (r.device.platformName.isNotEmpty &&
            !rooms.contains(r.device)) {
          setState(() {
            rooms.add(r.device);
          });
        }
      }
    });
  }

  // ================= CONNECT =================
  Future<void> connect(BluetoothDevice d) async {
    if (connecting) return;

    connecting = true;

    try {
      await currentDevice?.disconnect();
      await d.connect(timeout: const Duration(seconds: 5));

      currentDevice = d;
      currentRoom = d.platformName;

      var services = await d.discoverServices();

      for (var s in services) {
        if (s.uuid.toString() == serviceUUID) {
          for (var c in s.characteristics) {
            if (c.uuid.toString().contains("0002")) ctrlChar = c;

            if (c.uuid.toString().contains("0001")) {
              dataChar = c;
              await c.setNotifyValue(true);

              c.lastValueStream.listen((val) {
                String raw = utf8.decode(val);
                var parts = raw.split(",");

                if (parts.length == 2) {
                  setState(() {
                    temp = parts[0];
                    humid = parts[1];
                  });
                }
              });
            }

            if (c.uuid.toString().contains("0003")) {
              configChar = c;
            }
          }
        }
      }

      setState(() {});
    } catch (e) {
      debugPrint("Connect error: $e");
    }

    connecting = false;
  }

  // ================= COMMAND =================
  void send(String cmd) async {
    if (ctrlChar != null) {
      await ctrlChar!.write(cmd.codeUnits);
    }
  }

  // ================= RENAME =================
  void renameDialog() {
    TextEditingController ctrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Rename Room"),
        content: TextField(controller: ctrl),
        actions: [
          TextButton(
            onPressed: () async {
              if (configChar != null) {
                await configChar!.write("NAME:${ctrl.text}".codeUnits);
              }
              Navigator.pop(context);
            },
            child: const Text("Save"),
          )
        ],
      ),
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: startScan,
          )
        ],
      ),
      body: Column(
        children: [
          // CURRENT ROOM CARD
          Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: Text(currentRoom),
              subtitle: Text(currentDevice == null
                  ? "Disconnected"
                  : "Connected"),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: renameDialog,
              ),
            ),
          ),

          // SENSOR PANEL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              stat("Temp", "$temp °C"),
              stat("Humid", "$humid %"),
            ],
          ),

          const SizedBox(height: 20),

          // CONTROL PANEL
          control("Light ON", () => send("L_ON")),
          control("Light OFF", () => send("L_OFF")),
          control("Fan ON", () => send("F_ON")),
          control("Fan OFF", () => send("F_OFF")),

          const Divider(),

          const Text("Rooms"),

          // ROOM GRID
          Expanded(
            child: GridView.builder(
              itemCount: rooms.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (c, i) {
                final d = rooms[i];

                return GestureDetector(
                  onTap: () => connect(d),
                  child: Card(
                    child: Center(
                      child: Text(d.platformName.isEmpty
                          ? "Room"
                          : d.platformName),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget stat(String t, String v) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 140,
        child: Column(
          children: [
            Text(t),
            const SizedBox(height: 10),
            Text(v, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Widget control(String t, VoidCallback onTap) {
    return Card(
      child: ListTile(
        title: Text(t),
        trailing: IconButton(
          icon: const Icon(Icons.power),
          onPressed: onTap,
        ),
      ),
    );
  }
}