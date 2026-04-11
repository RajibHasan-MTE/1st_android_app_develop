import 'package:flutter/material.dart';
import 'package:liveclass14/Style/Style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, dynamic> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Product")),
      body: Stack(
        children: [
          // BackGround Graphics
          ScreenBackgrround(context),
          Container(
            child: (SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  SizedBox(height: 20),
                  AppDropDownStyle(
                    DropdownButton(
                      value: '',
                      items: [
                        DropdownMenuItem(child: Text('Select Qt'), value: ""),
                        DropdownMenuItem(child: Text('1 pcs'), value: "1 pcs"),
                        DropdownMenuItem(child: Text('2 pcs'), value: "2 Pcs"),
                        DropdownMenuItem(child: Text('3 pcs'), value: "3 Pcs"),
                        DropdownMenuItem(child: Text('4 pcs'), value: "4 pcs"),
                      ],
                      onChanged: (value) {},
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {},
                      child: SuccessButtonChild("Submit"),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
