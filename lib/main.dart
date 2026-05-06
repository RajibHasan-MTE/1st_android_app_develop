import 'package:flutter/material.dart';

void main() {
  runApp(SettingsApp());
}

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Settings App",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // TextField
  TextEditingController nameController = TextEditingController();

  // Switches
  bool notifications = true;
  bool darkMode = false;

  // Radio
  String language = "English";

  // Checkbox
  bool flutter = false;
  bool dart = false;
  bool ai = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),

      body: ListView(
        children: [

          // ================= PROFILE =================
          sectionTitle("Profile"),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Your Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          divider(),

          // ================= GENERAL =================
          sectionTitle("General"),

          SwitchListTile(
            title: Text("Notifications"),
            subtitle: Text("Receive app notifications"),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),

          SwitchListTile(
            title: Text("Dark Mode"),
            subtitle: Text("Enable dark theme"),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),

          divider(),

          // ================= LANGUAGE =================
          sectionTitle("Language"),

          RadioListTile(
            title: Text("English"),
            value: "English",
            groupValue: language,
            onChanged: (value) {
              setState(() {
                language = value.toString();
              });
            },
          ),

          RadioListTile(
            title: Text("Bangla"),
            value: "Bangla",
            groupValue: language,
            onChanged: (value) {
              setState(() {
                language = value.toString();
              });
            },
          ),

          RadioListTile(
            title: Text("Arabic"),
            value: "Arabic",
            groupValue: language,
            onChanged: (value) {
              setState(() {
                language = value.toString();
              });
            },
          ),

          divider(),

          // ================= INTERESTS =================
          sectionTitle("Interests"),

          CheckboxListTile(
            title: Text("Flutter"),
            value: flutter,
            onChanged: (value) {
              setState(() {
                flutter = value!;
              });
            },
          ),

          CheckboxListTile(
            title: Text("Dart"),
            value: dart,
            onChanged: (value) {
              setState(() {
                dart = value!;
              });
            },
          ),

          CheckboxListTile(
            title: Text("AI / Machine Learning"),
            value: ai,
            onChanged: (value) {
              setState(() {
                ai = value!;
              });
            },
          ),

          divider(),

          // ================= SUMMARY =================
          sectionTitle("Summary"),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${nameController.text}"),
                    Text("Notifications: $notifications"),
                    Text("Dark Mode: $darkMode"),
                    Text("Language: $language"),
                    Text("Flutter: $flutter"),
                    Text("Dart: $dart"),
                    Text("AI: $ai"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= UI HELPERS =================

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(thickness: 1);
  }
}