import 'package:app1/Style/Style.dart';
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
          ScreenBackground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){

                    }, decoration: AppInputDecoration("Product Name"),),
                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (value){

                    },decoration: AppInputDecoration("Product Code"),),
                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (value){

                    },decoration: AppInputDecoration("Product Image"),),
                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (value){

                    },decoration: AppInputDecoration("Unit Price"),),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (value){

                  },decoration: AppInputDecoration("Total Price"),),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }



}