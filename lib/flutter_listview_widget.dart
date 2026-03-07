//
// import 'package:flutter/material.dart';
//
//
//
//
// void main(){
//   runApp(myApp());
// }
//
// class myApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: HomePage()
//     );
//   }
//
// }
//
//
// /* ------------------------ Without SingleChildScrollView ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //           title: Text("Rajib Hasan"),
// //         ),
// //         body: Column(
// //           children: [
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //
// //           ],
// //         )
// //
// //     );
// //
// //   }
// // }
//
//
//
//
// /* ------------------------ SingleChildScrollView ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         title: Text("Rajib Hasan"),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.amber,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.blue,),
// //             Container(height: 100, width: MediaQuery.sizeOf(context).width, color: Colors.red,),
// //
// //           ],
// //         ),
// //       )
// //
// //     );
// //
// //   }
// // }
//
//
// /* ------------------------ SingleChildScrollView - Scroll direction - horizontal ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //           title: Text("Scroll Direction"),
// //         ),
// //         body: SingleChildScrollView(
// //           scrollDirection: Axis.horizontal,
// //           child: Row(
// //             children: [
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //
// //
// //
// //
// //             ],
// //           ),
// //         )
// //
// //     );
// //
// //   }
// // }
//
// /* ------------------------ SingleChildScrollView - Scroll direction - horizontal - padding: EdgeInsetsGeometry ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //           title: Text("Scroll Direction"),
// //         ),
// //         body: SingleChildScrollView(
// //           scrollDirection: Axis.horizontal,
// //           padding: EdgeInsets.symmetric(
// //             horizontal: 10,
// //             vertical: 10,
// //           ),
// //           child: Row(
// //             children: [
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //
// //
// //
// //
// //             ],
// //           ),
// //         )
// //
// //     );
// //
// //   }
// // }
//
// /* ------------------------ Column: SingleChildScrollView - Scroll direction.vertical - padding: EdgeInsetsGeometry ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //           title: Text("Scroll Direction"),
// //         ),
// //         body: SingleChildScrollView(
// //           scrollDirection: Axis.vertical,
// //           padding: EdgeInsets.symmetric(
// //             horizontal: 10,
// //             vertical: 10,
// //           ),
// //           child: Column(
// //             children: [
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //
// //
// //
// //
// //             ],
// //           ),
// //         )
// //
// //     );
// //
// //   }
// // }
//
//
//
// /* ------------------------ padding: EdgeInsetsGeometry - physics: NeverScrollableScroll ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //           title: Text("Scroll Direction"),
// //         ),
// //         body: SingleChildScrollView(
// //           scrollDirection: Axis.vertical,
// //           physics: NeverScrollableScrollPhysics(),
// //           padding: EdgeInsets.symmetric(
// //             horizontal: 10,
// //             vertical: 10,
// //           ),
// //           child: Column(
// //             children: [
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //
// //
// //
// //
// //             ],
// //           ),
// //         )
// //
// //     );
// //
// //   }
// // }
//
//
//
// /* ------------------------ padding: EdgeInsetsGeometry - physics: BouncingScrollPhysics ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //           title: Text("Scroll Direction"),
// //         ),
// //         body: SingleChildScrollView(
// //           scrollDirection: Axis.vertical,
// //           physics: BouncingScrollPhysics(),
// //           padding: EdgeInsets.symmetric(
// //             horizontal: 10,
// //             vertical: 10,
// //           ),
// //           child: Column(
// //             children: [
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //               Container(height: 100, width: 100, color: Colors.amber,),
// //               Container(height: 100, width: 100, color: Colors.blue,),
// //               Container(height: 100, width: 100, color: Colors.red,),
// //
// //
// //
// //
// //             ],
// //           ),
// //         )
// //
// //     );
// //
// //   }
// // }
//
//
//
// /* ------------------------ Listview widget ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.red,
// //         title: Text("List view widget"),
// //       ),
// //       // body: Column is a static not dynamic.
// //       body: ListView(
// //         physics: BouncingScrollPhysics(),
// //         padding: EdgeInsetsGeometry.all(10),
// //         children: [
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               title: Text("Name"),
// //               subtitle: Text("Student"),
// //               leading: Icon(Icons.supervised_user_circle),
// //               trailing: Icon(Icons.add),
// //             ),
// //           ),
// //
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// /* ------------------------ Listview widget - scrollDirection ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.red,
// //         title: Text("List view widget"),
// //       ),
// //       // body: Column is a static not dynamic.
// //       body: Container(
// //         height: 200,
// //         // width: 500,
// //         width: MediaQuery.sizeOf(context).width,
// //         child: ListView(
// //           physics: BouncingScrollPhysics(),
// //           padding: EdgeInsetsGeometry.all(10),
// //           children: [
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //             Card(
// //               child: ListTile(
// //                 title: Text("Name"),
// //                 subtitle: Text("Student"),
// //                 leading: Icon(Icons.supervised_user_circle),
// //                 trailing: Icon(Icons.add),
// //               ),
// //             ),
// //
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // /* ------------------------ Listview,builder widget ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.red,
// //         title: Text("List view widget"),
// //       ),
// //       // body: Column is a static not dynamic.
// //       body: ListView.builder(
// //         physics: BouncingScrollPhysics(),
// //         padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 30),
// //         itemCount: 600,
// //         shrinkWrap: true,
// //         // reverse: true,
// //         itemBuilder: (context, index) {
// //           return _cardW(index);
// //         },
// //       ),
// //     );
// //   }
// //
// //   Widget _cardW(int index){
// //     return Card(
// //         child: ListTile(
// //           title: Text("name ${index+1}"),
// //           subtitle: Text("Student"),
// //           leading: Icon(Icons.supervised_user_circle),
// //           trailing: Icon(Icons.add),
// //         ),
// //     );
// //   }
// //   }
//
//
// // /* ------------------------ Listview,builder widget ------------------------ */
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.red,
// //         title: Text("List view widget"),
// //       ),
// //       // body: Column is a static not dynamic.
// //       body: ListView.builder(
// //         physics: BouncingScrollPhysics(),
// //         padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 30),
// //         itemCount: 600,
// //         shrinkWrap: true,
// //         // reverse: true,
// //         itemBuilder: (context, index) {
// //           if(index % 2 == 0){
// //             return _textW(index: index, context: context);
// //           } else {
// //             return _photoW(index: index, context: context);
// //           }
// //         },
// //       ),
// //     );
// //   }
// //
// //   Widget _textW({required int index, required BuildContext context}){
// //     return Card(
// //       child: ListTile(
// //         onTap: (){
// //           print("Name: ${index+1}");
// //         },
// //         title: Text("name ${index+1}"),
// //         subtitle: Text("Text widget"),
// //         leading: Icon(Icons.supervised_user_circle),
// //         trailing: Icon(Icons.add),
// //       ),
// //     );
// //   }
// //   Widget _photoW({required int index, required BuildContext context}){
// //     return Card(
// //       color: Colors.black26,
// //       child: ListTile(
// //         title: Text("name ${index+1}"),
// //         subtitle: Text("photo widget"),
// //         leading: Icon(Icons.supervised_user_circle),
// //         trailing: Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
//
// /* ------------------------ Gridview widget ------------------------ */
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Text("List view widget"),
//       ),
//       // body: Column is a static not dynamic.
//       body: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 30),
//         itemCount: 600,
//         shrinkWrap: true,
//         // reverse: true,
//         itemBuilder: (context, index) {
//           if(index % 2 == 0){
//             return _textW(index: index, context: context);
//           } else {
//             return _photoW(index: index, context: context);
//           }
//         },
//       ),
//     );
//   }
// }
//
//
//
// /* ------------------------ SingleChildScrollView ------------------------ */
//
//
//
//
//
// /* ------------------------ SingleChildScrollView ------------------------ */