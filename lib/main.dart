import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Application entry point
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.amber),
      //color: Color.blue,
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  MySnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  MyAlertDialog(context){
    return showDialog(context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Alert !"),
                content: Text("Are you sure you want to exit?"),
                actions: [
                  TextButton(onPressed: (){
                    MySnackBar("Delelted Successfully", context);
                    Navigator.of(context).pop();
                  }, child: Text("Yes")),

                  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
                  ]
              ),
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {

    ButtonStyle buttonStyle=ElevatedButton.styleFrom(
      padding: EdgeInsets.all(25),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
    );

    ButtonStyle subButtonStyle=OutlinedButton.styleFrom(
      minimumSize: Size(double.infinity, 60),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("ROBOTICS WITH RAJIB", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      /*
      body: Container(
        height: 250,
        width: 250,
        alignment: Alignment.topCenter,
        //margin: EdgeInsets.fromLTRB(60, 90, 10, 40),
        margin: EdgeInsets.all(30),
        //padding: EdgeInsets.fromLTRB(30, 30, 50, 50),
        padding: EdgeInsets.all(60),
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.black, width: 6),
        ),
        child: Image.network(""),
      ),
      */
      /*
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: (){MySnackBar("I am text button", context);}, child: Text("Text Button")),
          ElevatedButton(onPressed: (){MySnackBar("I am Elevated Button", context);}, child: Text("ElevatedButton"), style: buttonStyle),
          OutlinedButton(onPressed: (){MySnackBar("I am Outline Button", context);}, child: Text("OutlinedButton")),
        ],
      ),
      */
        /****************************** Alert Dialog **************************************************
         * when click
         */
        /*
      body: Center(
        child: ElevatedButton(child: Text("Click me"), onPressed: (){MyAlertDialog(context);},)
      )
         */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(10), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'First Name')),),
          Padding(padding: EdgeInsets.all(10), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Last Name')),),
          Padding(padding: EdgeInsets.all(10), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Email')),),
          Padding(padding: EdgeInsets.all(10), child: ElevatedButton(onPressed: (){}, child: Text("Submit"), style: subButtonStyle,),),
          Image.network("https://www.zxcompo.com/products-item/inductor-coil/"),

        ],
      ),
    );
  }
}
