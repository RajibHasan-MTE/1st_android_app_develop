import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(34, 197, 94, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1);
const colorYellow = Color.fromRGBO(241, 196, 15, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(18, 32, 47, 1);




ScreenBackground(context){
  return SvgPicture.asset(
    'assets/images/screen-back.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}


InputDecoration AppInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorGreen, width: 1,),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: colorWhite, width: 0,),
    ),
    border: OutlineInputBorder(),
      labelText: label
  );

}