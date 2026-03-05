import 'package:flutter/material.dart';




void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }

}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Rajib Hasan"),
      ),
/* ----------------------- Start Row ------------------------------ */
    // body: Row(
    //   children: [
    //     Container(
    //       width: 100,
    //       height: 100,
    //       color: Colors.red,
    //     ),
    //     Container(
    //       width: 100,
    //       height: 100,
    //       color: Colors.blue,
    //     )
    //   ],
    // )
    //   body: Row(
    //     children: [
    //       Expanded(
    //         flex: 8,
    //         child: Container(
    //           width: 200,
    //           // height: MediaQuery.sizeOf(context).height/2,
    //           color: Colors.red,
    //
    //         ),
    //       ),
    //       Expanded(
    //         flex: 2,
    //         child: Container(
    //           width: 200,
    //           // height: MediaQuery.sizeOf(context).height/2,
    //           color: Colors.blue,
    //
    //         ),
    //       ),
    //       Expanded(
    //         child: Container(
    //           width: 200,
    //           color: Colors.yellow,
    //         ),
    //       ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.blue,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.red,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.blue,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.red,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.blue,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.red,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.blue,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.red,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.blue,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.red,
    //       //
    //       // ),
    //       // Container(
    //       //   width: 100,
    //       //   height: 100,
    //       //   color: Colors.blue,
    //       //
    //       // ),
    //     ],
    //
    //   ),

/* ----------------------- End Row ------------------------------ */

/* ----------------------- Start Row ------------------------------ */
      // body: Row(
      //   children: [
        /* -------------- before expended ------------ */
          // Container(
          //   width: 100,
          //   height: MediaQuery.sizeOf(context).height/2,
          //   color: Colors.red,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: MediaQuery.sizeOf(context).height/2,
          //   color: Colors.blue,
          //
          // ),
        /* ----------- After Expended ---------------*/
          // Expanded(
          //   flex: 8,
          //   child: Container(
          //     width: 200,
          //     // height: MediaQuery.sizeOf(context).height/2,
          //     color: Colors.red,
          //
          //   ),
          // ),
          // Expanded(
          //   flex: 2,
          //   child: Container(
          //     width: 200,
          //     // height: MediaQuery.sizeOf(context).height/2,
          //     color: Colors.blue,
          //
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: 200,
          //     color: Colors.yellow,
          //   ),
          // ),
        /* ------------- Flexible --------------- */
        //   Container(color: Colors.blue, width: 200, child: Text("Rajib Hasan"),),
        //   Flexible(
        //     // fit: FlexFit.tight,
        //     fit: FlexFit.loose,
        //     child: Text("ery very very very very very very very very very veryery very very very very very very very very very veryery very very very very very very very very very veryvery very very very very very very very very very very"),
        //   ),
        //
        // ],
        //
        // ),
/* ----------------------- End Column ------------------------------ */
/* ----------------------- Start wrap ------------------------------ */
    // body: Wrap(
    //   spacing: 8, runSpacing: 8,
    //   children: List.generate(10, (index) => Chip(label: Text("Item $index"),),),
    //
    // ),
/* ----------------------- Start mergin and padding ------------------------------ */
    // body: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     child: Column(
    //       children: [
    //         Container(
    //           margin: EdgeInsets.all(8),
    //           color: Colors.amber,
    //           height: 200,
    //         ),
    //         Container(
    //           // margin: EdgeInsets.all(8),
    //           color: Colors.red,
    //           height: 200,
    //         ),
    //         Container(
    //           // margin: EdgeInsets.all(8),
    //           color: Colors.black,
    //           height: 200,
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
/* ----------------------- Start Align ------------------------------ */
    // body: Align(
    //   alignment: Alignment(-1, 1),
    //   child: Icon(Icons.email_outlined),
    // ),
/* ----------------------- Start Align ------------------------------ */
    // body: Center(
    //   widthFactor: 2,
    //   heightFactor: 3,
    //   child: Text("Rajib Hasan"),
    // ),
/* ----------------------- Start Align ------------------------------ */
    body: Container(
      width: 100,
      height: 50,
      child: FittedBox(
        fit: BoxFit.contain, // preferable
        child: Text("Rajib Hasan sdfasdfsdf"),),
    ),
    );

  }
}


