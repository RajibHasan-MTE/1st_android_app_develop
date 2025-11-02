import 'package:flutter/material.dart';



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
          title: Text('Rajib Hasan'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(height: 200, width: 200, color: Colors.black),
              Container(height: 200, width: 200, color: Colors.red),
              Container(height: 200, width: 200, color: Colors.green),
              Container(height: 200, width: 200, color: Colors.orange),
              Container(height: 200, width: 200, color: Colors.black),
              Container(height: 200, width: 200, color: Colors.red),
              Container(height: 200, width: 200, color: Colors.green),
              Container(height: 200, width: 200, color: Colors.orange),
              Container(height: 200, width: 200, color: Colors.black)
            ],
          )
        )
    );
  }
}

