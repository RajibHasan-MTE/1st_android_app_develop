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
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 0.3,
            child: Container(
              color: Colors.green,
            ),
          ),
        )
    );
  }
}

