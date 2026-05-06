import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // global theme state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Light Theme
      theme: ThemeData.light(),

      // Dark Theme
      darkTheme: ThemeData.dark(),

      // 🔥 THIS CONTROLS THEME
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: SettingsPage(
        isDarkMode: isDarkMode,
        onToggle: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}


class SettingsPage extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onToggle;

  const SettingsPage({
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),

      body: ListView(
        children: [
          SwitchListTile(
            title: Text("Dark Mode"),
            subtitle: Text("Enable dark theme"),
            value: isDarkMode,

            onChanged: (value) {
              onToggle(value); // 🔥 update theme
            },
          ),
        ],
      ),
    );
  }
}