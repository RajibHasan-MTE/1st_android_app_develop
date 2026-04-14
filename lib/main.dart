import 'package:flutter/material.dart';
import 'package:liveclass14/pages/home_page.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ProductCreateScreen(),
      home: HomePage(),
    );
  }


}

