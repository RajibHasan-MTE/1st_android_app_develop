import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          color: Colors.blue,
          child: Text("Mobile View Dashboard",
            style: TextStyle(color: Colors.white, fontSize: 20),),
        )
        ListTile(
          leading: CircleAvatar(),
          title: Text("Rajib Hasan"),
          subtitle: Text("Flutter development"),
        ),

        Expanded(child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
        itemCount: 16,
        )
      ],
    );
  }
}
