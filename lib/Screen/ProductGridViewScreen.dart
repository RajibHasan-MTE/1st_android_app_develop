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
        title: Text("Home"),
        leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // Text and icon color
        elevation: 20.0, // Shadow under AppBar
        shadowColor: Colors.black45,

        /*----------1.1 RoundedRectangleBorder - BorderRadius.vertical - bottom, top ------------------ */
        // shape: RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.black, width: 10),
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(50)
        //   )
        // ),

        /*----------1.2 RoundedRectangleBorder - BorderRadius.horizontal - left, right ------------------ */
        // shape: RoundedRectangleBorder(
        //     side: BorderSide(color: Colors.black, width: 10),
        //     borderRadius: BorderRadius.horizontal(
        //         right: Radius.circular(50)
        //     )
        // ),

        /*----------2.1 ContinuousRectangleBorder - BorderRadius.vertical - left, right ------------------ */
        // shape: ContinuousRectangleBorder(
        //     side: BorderSide(color: Colors.black, width: 10),
        //     borderRadius: BorderRadius.vertical(
        //         bottom: Radius.circular(50)
        //     )
        // ),

        /*----------2.2 ContinuousRectangleBorder - BorderRadius.horizontal - left, right ------------------ */
        shape: ContinuousRectangleBorder(
            side: BorderSide(color: Colors.black, width: 10),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50)
            )
        ),

      ),
      body: Center(child: Text("App Bar learned"),),
    );
  }
}
