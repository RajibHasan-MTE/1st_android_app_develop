import 'package:flutter/material.dart';
import 'package:liveclass14/pages/page-3.dart';
import 'package:liveclass14/pages/page-4.dart';
import 'pages/page-1.dart';
import 'pages/page-2.dart';

void main() {
  runApp(MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/pageOne' : (context) => PageOneScreen(),
        '/pageTwo' : (context) => PageTwoScreen(),
        '/pageThree' : (context) => PageThreeScreen(),
        '/pageFour' : (context) => PageFourScreen(),
      },
      initialRoute: '/pageOne',
      debugShowCheckedModeBanner: false,
      // home: PageOneScreen(),
    );
  }
}
