import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveclass14/pages/page-2.dart';

class PageFourScreen extends StatefulWidget {
  const PageFourScreen({super.key});

  @override
  State<PageFourScreen> createState() => _PageFourScreenState();
}

class _PageFourScreenState extends State<PageFourScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page-4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to page three"),
            ),

            const Text("Your are in page four"),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (_){
                //         return PageFourScreen();
                //       }
                //   ),
                // );
                // Navigator.popUntil(context, (route) => route.settings.name == "/pageTwo");
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => PageTwoScreen()), (route) => false);

              },
              child: Text("Go to page Two"),
            ),
          ],
        ),
      ),
    );
  }
}
