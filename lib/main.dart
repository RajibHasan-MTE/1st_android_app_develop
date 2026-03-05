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

/* ----------------------- End Row ------------------------------ */

/* ----------------------- Start Row ------------------------------ */
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,

          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,

          ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.red,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.blue,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.red,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.blue,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.red,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.blue,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.red,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.blue,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.red,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.blue,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.red,
          //
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.blue,
          //
          // ),
        ],

        ),
/* ----------------------- End Column ------------------------------ */
    );

  }
}


