import 'package:flutter/material.dart';
import 'package:liveclass14/Style/Style.dart';

import '../RestAPI/RestClient.dart';
import '../Utility/Utility.dart';

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

  InputOnChange(key, Textvalue) {
    setState(() {
      FormValues.update(key, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if (FormValues["Img"]!.isEmpty) {
      ErrorToast("Image Link Required !");
    } else if (FormValues['ProductCode']!.isEmpty) {
      ErrorToast("Product Code Required !");
    } else if (FormValues['ProductName']!.isEmpty) {
      ErrorToast("Product Name Required !");
    } else if (FormValues['Qty']!.isEmpty) {
      ErrorToast("Product Qty Required !");
    } else if (FormValues['TotalPrice']!.isEmpty) {
      ErrorToast("Product Total Price Required !");
    } else if (FormValues['UnitPrice']!.isEmpty) {
      ErrorToast("Product Unit Price Required !");
    }else{
      ErrorToast("Submitted successfully");
      await ProductCreateRequest(FormValues);
    }
  }

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
                    onChanged: (value) {
                      InputOnChange("ProductName", value);
                    },
                    decoration: AppInputDecoration('ProductName'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      InputOnChange("ProductCode", value);
                    },
                    decoration: AppInputDecoration('ProductCode'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      InputOnChange("Img", value);
                    },
                    decoration: AppInputDecoration('ProductImage'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      InputOnChange("UnitPrice", value);
                    },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      InputOnChange("TotalPrice", value);
                    },
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  SizedBox(height: 20),
                  AppDropDownStyle(
                    DropdownButton(
                      value: FormValues['Qty'],
                      items: [
                        DropdownMenuItem(child: Text('Select Qt'), value: ""),
                        DropdownMenuItem(child: Text('1 pcs'), value: "1 pcs"),
                        DropdownMenuItem(child: Text('2 pcs'), value: "2 Pcs"),
                        DropdownMenuItem(child: Text('3 pcs'), value: "3 Pcs"),
                        DropdownMenuItem(child: Text('4 pcs'), value: "4 pcs"),
                      ],
                      onChanged: (value) {
                        InputOnChange("Qty", value ?? "");
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {
                        FormOnSubmit();
                      },
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
