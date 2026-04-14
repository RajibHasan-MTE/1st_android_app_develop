import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';







class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  _ProductGridViewScreenState createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        /* ------ 1.0 Basics title ---------- */
        // title: Text("Home"),

        /* ------ 2.0 title with Icons + Text inside children ---------- */
        // title: Row(
        //   children: [
        //     Icon(Icons.home),
        //     SizedBox(width: 8,),
        //     Text("Home"),
        //   ],
        // ),

        /* ------ 3.0 title with image logo ---------- */
        // title: Image.asset("assets/my-pic.png"),

        /* ------ 4.0 title/centerTitle: true - Alignment ---------- */
        centerTitle: false,

        /* ------ 5.0 Basics title ---------- */
        title: Text(
          "Robotics With Rajib",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),








        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // Text and icon color
        elevation: 5.0, // Shadow under AppBar
        shadowColor: Colors.red,

        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          )
        ),



      ),
      body: Center(child: Text("App Bar learned"),),
    );
  }
}
