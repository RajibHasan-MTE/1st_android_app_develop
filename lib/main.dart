import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  // 🔥 Realtime Database reference
  final DatabaseReference dbRef =
  FirebaseDatabase.instance.ref("counter");

  // 🔽 LOAD DATA FROM FIREBASE
  Future<void> loadData() async {
    try {
      final snapshot = await dbRef.get();

      if (snapshot.exists && snapshot.value != null) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);

        setState(() {
          counter = data["count"] ?? 0;
        });

        print("Loaded from Firebase: $counter");
      } else {
        print("No data found, starting from 0");
      }
    } catch (e) {
      print("Error loading: $e");
    }
  }

  // 🔼 SAVE DATA TO FIREBASE
  Future<void> increment() async {
    counter++;

    setState(() {});

    try {
      await dbRef.set({
        "count": counter,
      });

      print("Saved to Firebase: $counter");
    } catch (e) {
      print("Error saving: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadData(); // load when app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("📡 Firebase + ESP32 Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Count: $counter",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Icon(Icons.add),
      ),
    );
  }
}