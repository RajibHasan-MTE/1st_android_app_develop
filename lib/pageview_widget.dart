
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pageview extends StatelessWidget {
  const pageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text("PageView"),),
      body: PageView.builder(
        itemCount: 10,
        // reverse: true,
        onPageChanged: (value){
            print("Page: ${value+1}");
        },
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.all(10),
            color: getReandomColor(),
            child: Text("Page ${index+1}"),
          );
        },
      ),
      
    );
  }
  Color getReandomColor(){
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
