import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveclass14/pages/page-3.dart';

class PageTwoScreen extends StatefulWidget {
  const PageTwoScreen({super.key});

  @override
  State<PageTwoScreen> createState() => _PageTwoScreenState();
}

class _PageTwoScreenState extends State<PageTwoScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // final arg = ModalRoute.of(context)!.settings.arguments as String;
    final arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final name = arg["name"];
    final age = arg["age"];
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page-2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to page one"),
            ),

            Text('$name'),
            Text('$age'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_){
                        return PageThreeScreen();
                      }
                  ),
                );
              },
              child: Text("Go to page three"),
            ),
          ],
        ),
      ),
    );
  }
}
