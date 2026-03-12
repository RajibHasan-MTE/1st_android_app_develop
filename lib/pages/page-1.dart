import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveclass14/pages/page-2.dart';

class PageOneScreen extends StatefulWidget {
  const PageOneScreen({super.key});

  @override
  State<PageOneScreen> createState() => _PageOneScreenState();
}

class _PageOneScreenState extends State<PageOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page-1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text("Your are in page one"),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_){
                //           return PageTwoScreen();
                //         }
                //     ),
                // );
                // Navigator.pushNamed(context, "/pageTwo", arguments: "This data is passed to page two");
                Navigator.pushNamed(context, "/pageTwo", arguments: {
                  'name' : "Rajib",
                  'age' : 30,
                });
              },
              child: Text("Go to page two"),
            ),
          ],
        ),
      ),
    );
  }
}
