import 'package:app1/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
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
          child: BootstrapContainer(
            fluid: true,
            //fluid: false,
            children: [
              BootstrapRow(
                height: 100,
                children: [
                  BootstrapCol(
                    sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                    child: Container(height: 100, color: Colors.red,),
                  ),
                  BootstrapCol(
                      sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                      child: Container(height: 100, color: Colors.black,)
                  ),
                  BootstrapCol(
                      sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                      child: Container(height: 100, color: Colors.yellow,)
                  ),
                  BootstrapCol(
                    sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                    child: Container(height: 100, color: Colors.red,),
                  ),
                  BootstrapCol(
                      sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                      child: Container(height: 100, color: Colors.black,)
                  ),
                  BootstrapCol(
                      sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                      child: Container(height: 100, color: Colors.yellow,)
                  ),
                  BootstrapCol(
                    sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                    child: Container(height: 100, color: Colors.red,),
                  ),
                  BootstrapCol(
                      sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                      child: Container(height: 100, color: Colors.black,)
                  ),
                  BootstrapCol(
                      sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                      child: Container(height: 100, color: Colors.yellow,)
                  ),
                ],
              )
            ],
          ),

        )
    );
  }
}

