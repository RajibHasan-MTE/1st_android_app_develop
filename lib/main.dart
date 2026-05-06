import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Input Widgets Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InputWidgetsPage(),
    );
  }
}

class InputWidgetsPage extends StatefulWidget {
  @override
  State<InputWidgetsPage> createState() => _InputWidgetsPageState();
}

class _InputWidgetsPageState extends State<InputWidgetsPage> {
  // TextField
  TextEditingController nameController = TextEditingController();

  // Checkbox
  bool isFlutter = false;
  bool isDart = false;

  // Switch
  bool darkMode = false;

  // RadioButton
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Widgets Playground"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= TEXTFIELD =================
            Text(
              "1. TextField (All Properties Demo)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              obscureText: false,
              maxLength: 20,
              maxLines: 1,
              autofocus: false,
              enabled: true,
              cursorColor: Colors.blue,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, color: Colors.black),

              decoration: InputDecoration(
                labelText: "Enter Name",
                hintText: "Type your full name",
                helperText: "This is helper text",
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.check),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              onChanged: (value) {
                print("Typing: $value");
              },

              onSubmitted: (value) {
                print("Submitted: $value");
              },
            ),

            Divider(height: 40),

            // ================= CHECKBOX =================
            Text(
              "2. Checkbox (Multi Selection)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            CheckboxListTile(
              title: Text("I like Flutter"),
              value: isFlutter,
              activeColor: Colors.green,
              checkColor: Colors.white,
              tristate: false,
              onChanged: (value) {
                setState(() {
                  isFlutter = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text("I like Dart"),
              value: isDart,
              activeColor: Colors.blue,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isDart = value!;
                });
              },
            ),

            Divider(height: 40),

            // ================= SWITCH =================
            Text(
              "3. Switch (ON/OFF Toggle)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SwitchListTile(
              title: Text("Dark Mode"),
              subtitle: Text("Enable or disable dark theme"),
              value: darkMode,
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.black26,

              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),

            Divider(height: 40),

            // ================= RADIO BUTTON =================
            Text(
              "4. RadioButton (Single Selection)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            ListTile(
              title: Text("Male"),
              leading: Radio<String>(
                value: "Male",
                groupValue: gender,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ),

            ListTile(
              title: Text("Female"),
              leading: Radio<String>(
                value: "Female",
                groupValue: gender,
                activeColor: Colors.pink,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ),

            Divider(height: 40),

            // ================= OUTPUT =================
            Text(
              "📊 Live Output",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text("Name: ${nameController.text}"),
            Text("Flutter: $isFlutter"),
            Text("Dart: $isDart"),
            Text("Dark Mode: $darkMode"),
            Text("Gender: $gender"),
          ],
        ),
      ),
    );
  }
}
