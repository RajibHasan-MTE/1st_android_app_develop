import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ProductCreateScreen extends StatefulWidget {
  @override
  _ProductCreateScreenState createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Product"),),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(onChanged: (value){},),
                  TextFormField(onChanged: (value){},),
                  TextFormField(onChanged: (value){},),
                  TextFormField(onChanged: (value){},),
                  TextFormField(onChanged: (value){},),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }



}