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


/* ------------------------ Without SingleChildScrollView ------------------------ */
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text("Rajib Hasan"),
//         ),
//         body: Column(
//           children: [
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//
//           ],
//         )
//
//     );
//
//   }
// }




/* ------------------------ SingleChildScrollView ------------------------ */
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text("Rajib Hasan"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
//             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
//
//           ],
//         ),
//       )
//
//     );
//
//   }
// }


/* ------------------------ SingleChildScrollView - Scroll direction - horizontal ------------------------ */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Scroll Direction"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(height: 100, width: 100, color: Colors.amber,),
              Container(height: 100, width: 100, color: Colors.blue,),
              Container(height: 100, width: 100, color: Colors.red,),
              Container(height: 100, width: 100, color: Colors.amber,),
              Container(height: 100, width: 100, color: Colors.blue,),
              Container(height: 100, width: 100, color: Colors.red,),
              Container(height: 100, width: 100, color: Colors.amber,),
              Container(height: 100, width: 100, color: Colors.blue,),
              Container(height: 100, width: 100, color: Colors.red,),
              Container(height: 100, width: 100, color: Colors.amber,),
              Container(height: 100, width: 100, color: Colors.blue,),
              Container(height: 100, width: 100, color: Colors.red,),
              Container(height: 100, width: 100, color: Colors.amber,),
              Container(height: 100, width: 100, color: Colors.blue,),
              Container(height: 100, width: 100, color: Colors.red,),




            ],
          ),
        )

    );

  }
}



/* ------------------------ SingleChildScrollView ------------------------ */





/* ------------------------ SingleChildScrollView ------------------------ */