import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final FirebaseFirestore db = FirebaseFirestore.instance;

  // 🔽 LOAD DATA FROM FIREBASE
  Future<void> loadData() async {
    try {
      var doc = await db.collection("counter").doc("value").get();

      if (doc.exists && doc.data() != null) {
        setState(() {
          counter = (doc.data()!["count"] ?? 0).toInt();
        });
        print("Loaded from Firebase: $counter");
      } else {
        print("No data found, starting from 0");
      }
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  // 🔼 SAVE DATA TO FIREBASE
  Future<void> increment() async {
    counter++;

    setState(() {});

    try {
      await db.collection("counter").doc("value").set({
        "count": counter,
        "updated_at": DateTime.now(),
      });
      print("Saved to Firebase: $counter");
    } catch (e) {
      print("Error saving data: $e");
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
        title: Text("🔥 Firebase Counter"),
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