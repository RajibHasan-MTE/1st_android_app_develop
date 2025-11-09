import 'package:flutter/material.dart';
import 'Style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sum app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return MyHomePageUI();
  }

}


class MyHomePageUI extends State<MyHomePage>{
  Map<String, double> FormValue = { "Num1" : 0, "Num2" : 0, "Num3" : 0};
  double SUM = 0;
  int countNumber = 0;
  @override
  Widget build(BuildContext context) {

    MyInputOnChange(InputKey, InputValue){
      setState(() {
        FormValue.update(InputKey, (value) => double.parse(InputValue));
      });

    }

    AddAllNumber(){
      setState(() {
        SUM = FormValue['Num1']! + FormValue['Num2']! + FormValue['Num3']!;
      });

    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Sum app'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(SUM.toString(), style: HeadTexStyle(),),
            SizedBox(height: 20,),
            TextFormField(
              onChanged: (value){
                MyInputOnChange("Num1", value);
              }, decoration: AppInputStyle("First number"),),

            SizedBox(height: 20),
            TextFormField(
              onChanged: (value){
                MyInputOnChange("Num2", value);
              }, decoration: AppInputStyle("Second number"),),

            SizedBox(height: 20),
            TextFormField(onChanged: (value){
              MyInputOnChange("Num3", value);
            }, decoration: AppInputStyle("Third number"),),

            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
              style: AppButtonStyle(),
              child: Text("Add"),
              onPressed: (){
                  AddAllNumber();
              }
              ),
            ),
          ],
        ),
      )
    );
  }

}
