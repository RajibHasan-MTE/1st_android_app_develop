import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
import '../Style/Style.dart';
import '../Utility/Utility.dart';

class ProductupadateScreen extends StatefulWidget {
  final Map productItem;

  const ProductupadateScreen(this.productItem);

  @override
  State<ProductupadateScreen> createState() => _ProductupadateScreenState();
}

class _ProductupadateScreenState extends State<ProductupadateScreen> {
  Map<String, dynamic> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };
  bool Loading = false;

  @override
  void initState() {
    super.initState(); // Always call super.initState()

    // Create a list of allowed quantities
    List<String> allowedQty = ["", "1 pcs", "2 pcs", "3 pcs", "4 pcs"];
    String incomingQty = widget.productItem['Qty'].toString();

    setState(() {
      FormValues["Img"] = widget.productItem['Img'];
      FormValues["ProductCode"] = widget.productItem['ProductCode'];
      FormValues["ProductName"] = widget.productItem['ProductName'];

      // Safety check: If the incoming value isn't in our list, default to ""
      FormValues["Qty"] = allowedQty.contains(incomingQty) ? incomingQty : "";

      FormValues["TotalPrice"] = widget.productItem['TotalPrice'];
      FormValues["UnitPrice"] = widget.productItem['UnitPrice'];
    });
  }

  // @override
  // void initState() {
  //   setState(() {
  //     FormValues.update("Img", (value) => widget.productItem['Img']);
  //     FormValues.update(
  //       "ProductCode",
  //       (value) => widget.productItem['ProductCode'],
  //     );
  //     FormValues.update(
  //       "ProductName",
  //       (value) => widget.productItem['ProductName'],
  //     );
  //     FormValues.update("Qty", (value) => widget.productItem['Qty']);
  //     FormValues.update(
  //       "TotalPrice",
  //       (value) => widget.productItem['TotalPrice'],
  //     );
  //     FormValues.update(
  //       "UnitPrice",
  //       (value) => widget.productItem['UnitPrice'],
  //     );
  //   });
  // }  // @override
  //   // void initState() {
  //   //   setState(() {
  //   //     FormValues.update("Img", (value) => widget.productItem['Img']);
  //   //     FormValues.update(
  //   //       "ProductCode",
  //   //       (value) => widget.productItem['ProductCode'],
  //   //     );
  //   //     FormValues.update(
  //   //       "ProductName",
  //   //       (value) => widget.productItem['ProductName'],
  //   //     );
  //   //     FormValues.update("Qty", (value) => widget.productItem['Qty']);
  //   //     FormValues.update(
  //   //       "TotalPrice",
  //   //       (value) => widget.productItem['TotalPrice'],
  //   //     );
  //   //     FormValues.update(
  //   //       "UnitPrice",
  //   //       (value) => widget.productItem['UnitPrice'],
  //   //     );
  //   //   });
  //   // }

  InputOnChange(key, Textvalue) {
    setState(() {
      FormValues.update(key, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
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
    } else {
      setState(() {
        Loading = true;
      });
      ErrorToast("Submitted successfully");
      await ProductCreateRequest(FormValues);
      setState(() {
        Loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update product")),
      body: Stack(
        children: [
          // BackGround Graphics
          ScreenBackgrround(context),
          Container(
            child: Loading
                ? (Center(child: CircularProgressIndicator()))
                : ((SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: FormValues['ProductName'],
                          onChanged: (TextValue) {
                            InputOnChange("ProductName", TextValue);
                          },
                          decoration: AppInputDecoration('ProductName'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues['ProductCode'],
                          onChanged: (TextValue) {
                            InputOnChange("ProductCode", TextValue);
                          },
                          decoration: AppInputDecoration('Product Code'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues['Img'],
                          onChanged: (TextValue) {
                            InputOnChange("Img", TextValue);
                          },
                          decoration: AppInputDecoration('Product Image'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues['UnitPrice'],
                          onChanged: (TextValue) {
                            InputOnChange("UnitPrice", TextValue);
                          },
                          decoration: AppInputDecoration('Unit Price'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues['TotalPrice'],
                          onChanged: (TextValue) {
                            InputOnChange("TotalPrice", TextValue);
                          },
                          decoration: AppInputDecoration('Total Price'),
                        ),
                        SizedBox(height: 20),
                        AppDropDownStyle(
                          DropdownButton(
                            value: FormValues['Qty'],
                            items: [
                              DropdownMenuItem(
                                child: Text('Select Qt'),
                                value: "",
                              ),
                              DropdownMenuItem(
                                child: Text('1 pcs'),
                                value: "1 pcs",
                              ),
                              DropdownMenuItem(
                                child: Text('2 pcs'),
                                value: "2 pcs",
                              ),
                              DropdownMenuItem(
                                child: Text('3 pcs'),
                                value: "3 pcs",
                              ),
                              DropdownMenuItem(
                                child: Text('4 pcs'),
                                value: "4 pcs",
                              ),
                            ],
                            onChanged: (TextValue) {
                              InputOnChange("Qty", TextValue);
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
                  ))),
          ),
        ],
      ),
    );
  }
}
