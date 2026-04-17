import 'package:flutter/material.dart';
import 'package:navigationbar/layout/tablet_view.dart';
import 'package:navigationbar/layout/web_view.dart';
import 'layout/mobile_view.dart';


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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Apps"),
      ),
      body: LayoutBuilder(
        builder: (context, constrains) {
          if(constrains.maxWidth < 600){
            return MobileView();
          } else if(constrains.maxWidth < 1024){
            return TabletView();
          } else{
            return WebView();
          }
        },
      ),
    );
  }
}
