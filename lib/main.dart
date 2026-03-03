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
        title: Text("পাড়াতলী একতা ফাউন্ডেশন", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
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
          Padding(padding: EdgeInsets.all(10), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Name')),),
          Padding(padding: EdgeInsets.all(10), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Amount')),),
          Padding(padding: EdgeInsets.all(10), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Code')),),
          Padding(padding: EdgeInsets.all(10), child: ElevatedButton(onPressed: (){}, child: Text("Submit"), style: subButtonStyle,),),
          Image.network("https://scontent.fdac207-1.fna.fbcdn.net/v/t39.30808-6/641384200_122093283921258830_3041840157541520309_n.png?stp=dst-png_s960x960&_nc_cat=100&ccb=1-7&_nc_sid=2a1932&_nc_eui2=AeEiR919FEqeer4BuRx2wAQumMME2muy5aWYwwTaa7LlpdFjdIJjxCiUxyh5YCD6CQpb4N5f4we3VMPCQ6QQbkUe&_nc_ohc=PsQa4NbmruAQ7kNvwGaTVs5&_nc_oc=Adl33z73K1mPNy7axNiNN4zglyI3j0UOeUiJLwB3YugIYCz9LFqGskh4_cbnhPvrLUs&_nc_zt=23&_nc_ht=scontent.fdac207-1.fna&_nc_gid=GVYYl2syxsi8WSEmIJzAzw&_nc_ss=8&oh=00_Afwrhi1JUhoRvt4DIEc3UbtiEfMg8ha6kIN-BDyc5HBGpA&oe=69AC5B5C"),

        ],
      ),
    );
  }
}
