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
      appBar: AppBar(title: Text("Paratuli Unity Foundation - পাড়াতলী একতা ফাউন্ডেশন"),),
      // body: Center(
      //   // child: Text("Hello", style: TextStyle(fontSize: 40, color: Colors.blue),),
      //   // child: Icon(Icons.home, size: 52, color: Colors.blue,),
      //   // child: Image.network("https://scontent.fdac207-1.fna.fbcdn.net/v/t39.30808-6/599945758_122232331940148641_6473163017677059390_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=1d70fc&_nc_eui2=AeE6MPQzn_ZNAaHdVEZPL11qsAXl7h0k2qKwBeXuHSTaourDogXLEjEWR5HF4u-7Jnu3hsd5Yi5FmOLYMi7wTXvp&_nc_ohc=4ZAiE8easrEQ7kNvwGzY1vN&_nc_oc=AdkBdUdx9YhalQlRx8T2dCvRohryiKpXTqil_E-wZ_0DEFGPaMIk4o2KZQwaA1Y_fN0&_nc_zt=23&_nc_ht=scontent.fdac207-1.fna&_nc_gid=vY_Mt-ttKwTZRHLrSOEaQQ&_nc_ss=8&oh=00_AfzNpFUr9gSy9v0b9nfBaP04JjjyfM55oaa0m-E8Cc8vxg&oe=69AC52DE", height: 500, width: 500,),
      //
      // ),
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Divider(height: 4,),
      //     Icon(Icons.home),
      //     Divider(height: 4,),
      //     Icon(Icons.message),
      //     Icon(Icons.phone),
      //     Icon(Icons.contact_support_outlined),
      //     Icon(Icons.home),
      //     Icon(Icons.message),
      //     Icon(Icons.phone),
      //     Icon(Icons.contact_support_outlined),
      //   ],
      //
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(height: 4,),
          SizedBox(height: 30,),
          Icon(Icons.home),
          SizedBox(height: 30,),
          Divider(height: 4,),
          SizedBox(height: 30,),
          Icon(Icons.message),
          SizedBox(height: 30,),
          Divider(height: 4,),
          SizedBox(height: 30,),
          Icon(Icons.phone),
          SizedBox(height: 30,),
          Divider(height: 4,),
          SizedBox(height: 30,),
          Icon(Icons.contact_support_outlined),
          SizedBox(height: 30,),
          Divider(height: 4,),
          SizedBox(height: 30,),
          Icon(Icons.home),
          SizedBox(height: 30,),
          Divider(height: 4,),
          SizedBox(height: 30,),
          Icon(Icons.message),
          SizedBox(height: 30,),
          Divider(height: 4,),
          SizedBox(height: 30,),
          Icon(Icons.phone),
          SizedBox(height: 30,),
          Divider(height: 4,),
          SizedBox(height: 30,),
          Icon(Icons.contact_support_outlined),
          SizedBox(height: 30,),
          Divider(height: 4,),
          SizedBox(height: 30,),
        ],

      ),

    );
  }
}


