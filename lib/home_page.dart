import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Percent Indicator")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                radius: 100,
                lineWidth: 20,
                percent: 0.4,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: const Text("40%", style: TextStyle(fontSize: 65, color: Colors.deepPurple)),
              ),
              LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                lineHeight: 40,
                percent: 0.5,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,

              )
            ],
          ),
        ),
      ),
    );
  }
}
