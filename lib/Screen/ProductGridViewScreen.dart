import 'package:flutter/material.dart';
import 'package:liveclass14/Style/Style.dart';

import '../RestAPI/RestClient.dart';



class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool Loading = true;
  
  @override
  void initState(){
    CallData();
    super.initState();
    
  }

  CallData() async{
    Loading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      Loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List view"),),
      body: Stack(
        children: [
          ScreenBackgrround(context),
          Container(
            child: Loading ? (Center(child: CircularProgressIndicator(),)) : (
            GridView.builder(
                gridDelegate: ProductGridViewStyle(),
                itemCount: ProductList.length,
                itemBuilder: (context, index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: Image.network(ProductList[index]['Img'], fit: BoxFit.fill,)),
                        // Text("Product name"),
                        // ElevatedButton(onPressed: (){}, child: Icon(Icons.delete),
                      ],
                    ),
                  );
                }
            )
            ),
          )
        ],
      ),
    );
  }
}
