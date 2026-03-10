import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rajib Hasan',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Show alert dialog
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you want to delete!"),
        content: Text("Once Delete can't get back"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(onPressed: () {}, child: Text("Ok")),
        ],
      ),
    );
  }

  // Simple dialog for option choose
  void showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text("Do youwant to delete!"),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context),
            child: Text("Dhaka"),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context),
            child: Text("London"),
          ),
        ],
      ),
    );
  }

  // Snack bar
  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Save Successfully"),
        //
      ),
    );
  }

  // Bottom Sheet
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(padding: EdgeInsets.all(20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Dialog")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text("Alert Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              showSimpleDialog(context);
            },
            child: Text("Simple dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              showSnackBar(context);
            },
            child: Text("show snack bar"),
          ),
          ElevatedButton(
            onPressed: () {
              showBottomSheet(context);
            },
            child: Text("show bottom sheet"),
          ),
        ],
      ),
    );
  }
}
