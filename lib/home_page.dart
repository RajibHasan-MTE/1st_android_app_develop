import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
what is your name my name is rajib
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Percent Indicator")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 20.0,
                percent: 0.8,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                circularStrokeCap: CircularStrokeCap.butt,
                center: const Text(
                  "40%",
                  style: TextStyle(fontSize: 65, color: Colors.deepPurple),
                ),

                // arcBackgroundColor: Colors.yellow,
              ),
              LinearPercentIndicator(
                lineHeight: 20.0,
                percent: 0.8,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
