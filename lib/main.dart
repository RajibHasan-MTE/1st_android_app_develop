
import 'package:flutter/material.dart';
import 'package:liveclass14/gridview-widget.dart';

import 'gridview_builder_widget.dart';




void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: gridviewBuilderWidget(),
    );
  }

}
