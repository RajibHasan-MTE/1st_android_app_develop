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

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadowColor: Color.fromRGBO(33, 191, 115, 1),
            color: Color.fromRGBO(33, 191, 115, 1),
            elevation: 10,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(child: Text('Home Activity')),
            ),
          ),
        ),
    );
  }
}


class Activity1 extends StatelessWidget {
  String msg;

  Activity1(
      this.msg,
      {super.key}
  );




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(msg),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Activity2("This is from home to activity-2")));
        }, child: Text("Go Activity-2"),),
      ),
    );
  }
}


class Activity2 extends StatelessWidget {
  String msg;

  Activity2(
      this.msg,
      {super.key}
      );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(msg),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Activity1("This is from home to activity-1")));
        }, child: Text("Go Activity-1"),),
      ),
    );
  }
}
