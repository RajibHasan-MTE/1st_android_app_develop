import 'package:flutter/material.dart';
import 'package:liveclass14/Style/Style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Product"),
      ),
      body: Stack(
        children: [
          // BackGround Graphics
          Container(
            child: (SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(onChanged: (value){},decoration: AppInputDecoration('Product Name'),),
                  TextFormField(onChanged: (value){},decoration: AppInputDecoration('Product Code'),),
                  TextFormField(onChanged: (value){},decoration: AppInputDecoration('Product Image'),),
                  TextFormField(onChanged: (value){},decoration: AppInputDecoration('Unit Price'),),
                  TextFormField(onChanged: (value){},decoration: AppInputDecoration('Total Price'),),

                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
