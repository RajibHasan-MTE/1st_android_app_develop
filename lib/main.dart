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
    {"img" : "https://pal-robotics.com/wp-content/uploads/2024/04/TALOS-Robot-918x1024.webp", "name" : "KANGAROO"},
    {"img" : "https://pal-robotics.com/wp-content/uploads/2025/01/TIAGoPro_Sided1_Mobile-Manipulator_PAL-Robotics-921x1024.webp", "name" : "TIAGo Pro"},
    {"img" : "https://pal-robotics.com/wp-content/uploads/2024/04/REE-C-Robot-3-918x1024.webp", "name" : "Ultimate 5 Max", "Name" : "REEM-C"},
    {"img" : "https://pal-robotics.com/wp-content/uploads/2024/04/TALOS-Robot-918x1024.webp", "name" : "KANGAROO"},
    {"img" : "https://pal-robotics.com/wp-content/uploads/2025/01/TIAGoPro_Sided1_Mobile-Manipulator_PAL-Robotics-921x1024.webp", "name" : "TIAGo Pro"},
    {"img" : "https://pal-robotics.com/wp-content/uploads/2024/04/REE-C-Robot-3-918x1024.webp", "name" : "Ultimate 5 Max", "Name" : "REEM-C"},
    {"img" : "https://pal-robotics.com/wp-content/uploads/2024/04/TALOS-Robot-918x1024.webp", "name" : "KANGAROO"},
    {"img" : "https://pal-robotics.com/wp-content/uploads/2025/01/TIAGoPro_Sided1_Mobile-Manipulator_PAL-Robotics-921x1024.webp", "name" : "TIAGo Pro"},
    {"img" : "https://pal-robotics.com/wp-content/uploads/2024/04/REE-C-Robot-3-918x1024.webp", "name" : "Ultimate 5 Max", "Name" : "REEM-C"},

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
                    MySnackBar("Deleted Successfully", context);
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemCount: MyItems.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {MySnackBar(MyItems[i]["name"]!, context);},
            child: Container(
              margin: EdgeInsets.all(0),
              width: double.infinity,
              //height: 1000,
              child: Image.network(MyItems[i]["img"]!, fit: BoxFit.cover)
              //child: Image.network("https://pal-robotics.com/wp-content/uploads/2025/01/Kangaroo-Pro-frontal-image-PAL-Robotics-legged-humanoid-scaled-e1760631086520-703x1024.png"),
            ),
          );
        },
      )

    );
  }
}
