import 'package:app1/Fragment/HomeFragment.dart';
import 'package:flutter/material.dart';

import 'Fragment/AlarmFragment.dart';
import 'Fragment/BalanceFragment.dart';
import 'Fragment/ContactFragment.dart';
import 'Fragment/EmailFragment.dart';
import 'Fragment/PersonFragment.dart';
import 'Fragment/SearchFragment.dart';
import 'Fragment/SettingsFragment.dart';

void main() {
  runApp(const MyApp()); // Application entry point
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.amber),
      //color: Color.blue,
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  //const HomeActivity({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My App"),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home",),
                Tab(icon: Icon(Icons.search), text: "Search",),
                Tab(icon: Icon(Icons.settings), text: "Settings",),
                Tab(icon: Icon(Icons.email), text: "Email",),
                Tab(icon: Icon(Icons.contact_page), text: "Contact",),
                Tab(icon: Icon(Icons.person), text: "Person",),
                Tab(icon: Icon(Icons.access_alarm), text: "alarm",),
                Tab(icon: Icon(Icons.account_balance), text: "balance",),
              ],
            ),
          ),
          body: TabBarView(
              children: [
                HomeFragment(),
                SearchFragment(),
                SettingsFragment(),
                EmailFragment(),
                ContactFragment(),
                PersonFragment(),
                AlarmFragment(),
                BalanceFragment(),
              ],
          ),
        )
    );
  }
}
