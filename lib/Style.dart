import 'package:flutter/material.dart';




InputDecoration AppInputDecoration(label){

  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(),
    labelText: label,


  );
}


ButtonStyle AppButtonStyle(){

  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(23),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4))
    ),
  );
}

SizedBox SizeBox50(child){

  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: child,
    )
  );



}