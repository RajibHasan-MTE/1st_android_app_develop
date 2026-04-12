import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveclass14/Screen/ProductCreateScreen.dart';

import 'Screen/ProductGridViewScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ProductCreateScreen(),
      home: ProductGridViewScreen(),
    );
  }


}

