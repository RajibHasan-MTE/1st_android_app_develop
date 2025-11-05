import 'package:app1/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';


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


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Rajib Hasan'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 12,
                child: Container(
                  height: 100,
                  color: Colors.orange,
                ),
              ),
              ResponsiveGridCol(
                xl: 3, lg: 3, md: 3, sm: 12, xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.green,
                ),
              ),
              ResponsiveGridCol(
                xl: 3, lg: 3, md: 3, sm: 12, xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.red,
                ),
              ),
              ResponsiveGridCol(
                xl: 3, lg: 3, md: 3, sm: 12, xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.black,
                ),
              ),
              ResponsiveGridCol(
                xl: 3, lg: 3, md: 3, sm: 12, xs: 12,
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                ),
              ),

            ],
          ),
        )
    );
  }
}

