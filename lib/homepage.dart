import 'package:flutter/material.dart';
import 'package:liveclass14/desktop_body.dart';
import 'package:liveclass14/mobile_body.dart';
import 'package:liveclass14/responsive_layout.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: MyMobileBody(),
          desktopBody: MyDesktopBody(),
      ),

    );
  }
}
