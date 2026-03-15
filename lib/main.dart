import 'package:basics_counter_app/HomeScreen.dart';
import 'package:basics_counter_app/NotificationSreen.dart';
import 'package:basics_counter_app/PersonScreen.dart';
import 'package:basics_counter_app/SettingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      // home: BottomNavigationBarPage(),
      // home: TabBarPage(),
      home: TabBarPage(),
    );
  }
}

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      endDrawer: Drawer(
        // drawer: Drawer(
        child: ListView(
          children: [
            // DrawerHeader(child: Text("Menu"),),
            DrawerHeader(child: Text("Menu")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home"),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab bar"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.notifications_active_rounded)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            SettingScreen(),
            PersonScreen(),
            NotificationScreen(),
          ],
        ),
      ),
    );
  }
}

/* ------------------ Bottom Navigation bar ------------------ */

class BottomNavigationBarPage extends StatefulWidget {
  @override
  State<BottomNavigationBarPage> createState() =>
      BottomNavigationBarPageState();
}

class BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int index = 0;

  final screens = [
    HomeScreen(),
    SettingScreen(),
    PersonScreen(),
    NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purpleAccent,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.grey),
        unselectedLabelStyle: TextStyle(color: Colors.black),

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: "Notification",
          ),
        ],
      ),
    );
  }
}
