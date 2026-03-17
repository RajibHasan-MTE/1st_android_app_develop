import 'package:flutter/material.dart';
import 'package:navigationbar/person_screen.dart';
import 'package:navigationbar/setting_screen.dart';

import 'home_screen.dart';
import 'notification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: DrawerPge(),
    );
  }
}

/* --------------- Tab bar page ------------------ */
class DrawerPge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer"),),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Menu")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.notifications_on),
              title: Text("Notification"),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.notifications_on),
              title: Text("Notification"),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }

}


/* --------------- Tab bar page ------------------ */
class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab bar"),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.home),),
            Tab(icon: Icon(Icons.settings),),
            Tab(icon: Icon(Icons.person),),
            Tab(icon: Icon(Icons.notifications),),
          ]),
        ),
        body: TabBarView(
            children: [
              HomeScreen(),
              SettingScreen(),
              PersonScreen(),
              NotificationScreen(),
            ]),
      ),
    );
  }
}


/* --------------- Bottom Navigation bar ------------------ */
class BottomNavigationBarPage extends StatefulWidget {
  @override
  State<BottomNavigationBarPage> createState() =>
      BottomNavigationBarPageState();
}

class BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  @override
  int index = 0;
  final screens = [
    HomeScreen(),
    SettingScreen(),
    PersonScreen(),
    NotificationScreen(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_on),
            label: "Notification",
          ),
        ],
      ),
    );
  }
}
