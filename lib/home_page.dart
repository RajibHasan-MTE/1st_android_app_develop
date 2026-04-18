import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // 🔁 Repeat from 0 → 1 → 0 → 1...
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percentValue = _animation.value;

    return Scaffold(
      appBar: AppBar(title: const Text("Percent Indicator")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 20,
                percent: percentValue,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "${(percentValue * 100).toInt()}%",
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.deepPurple,
                  ),
                ),
              ),

              LinearPercentIndicator(
                lineHeight: 40,
                percent: percentValue,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
