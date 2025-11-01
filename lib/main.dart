






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){

    runApp(const MyApp()); // Application entry point



}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primaryColor: Colors.black26),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
        centerTitle: true,
      ),
      body: Center(
        child: Icon(
          Icons.camera_alt,
          size: 100,
          color: Colors.black26,
        )
      ),
    );
  }

}