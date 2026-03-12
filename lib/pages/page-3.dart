import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveclass14/pages/page-4.dart';

class PageThreeScreen extends StatefulWidget {
  const PageThreeScreen({super.key});

  @override
  State<PageThreeScreen> createState() => _PageThreeScreenState();
}

class _PageThreeScreenState extends State<PageThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page-3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to page two"),
            ),

            const Text("Your are in page three"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_){
                        return PageFourScreen();
                      }
                  ),
                );
              },
              child: Text("Go to page Four"),
            ),
          ],
        ),
      ),
    );
  }
}
