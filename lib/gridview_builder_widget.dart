
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gridviewBuilderWidget extends StatelessWidget {
  const gridviewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Gridview builder widget"),
      ),
      body: GridView.builder(
        padding: EdgeInsetsGeometry.all(10),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: 100,
        itemBuilder: (context, index){
          return Container(
            color: Colors.red,
            child: Center(child: Text("Item: ${index+1}"),),
          );
      }
      ),
    );
  }
}
