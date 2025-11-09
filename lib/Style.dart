import 'package:flutter/material.dart';



InputDecoration AppInputStyle(label){

  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(),
    labelText: label
  );

}

TextStyle HeadTexStyle(){
  return TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w800,

  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(20),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
  );
}