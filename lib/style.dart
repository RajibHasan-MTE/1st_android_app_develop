import 'dart:ui';
import 'package:flutter/material.dart';







TextStyle HeadLine(context){
  var width = MediaQuery.of(context).size.width;
  if(width < 700){
    //mobile
    return TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
    );
  }else{
    //desktop
    return TextStyle(
      color: Colors.green,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

  }
}