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
  //const HomeActivity({super.key});

  var MyItems = [
    {"img" : "https://ichibot.id/storage/products/1760494160_68ef025058ab6.png", "name" : "rajib"},
    {"img" : "https://ichibot.id/storage/products/1760494160_68ef025058ab6.png", "name" : "Ichiduino Pro"},
    {"img" : "https://ichibot.id/storage/products/1760491960_68eef9b8a7a9f.png", "name" : "Ultimate 5 Max"}
  ];

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
        title: Text("ROBOTICS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: ListView.builder(
        itemCount: MyItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              //child: Image.network(MyItems[0]["img"]!, fit: BoxFit.cover)
              child: Image.network("https://ichibot.id/storage/products/1760494160_68ef025058ab6.png"),
            ),
          );
        },
      )

    );
  }
}
