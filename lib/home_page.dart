import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveclass14/app_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset("assets/images/menu-outline.png"),
        ),
        leadingWidth: 50,
        title: Text(
          "Home",
          style: AppTextStyle.titleBlack16,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFCEC5D8).withOpacity(0.76),
                image: DecorationImage(
                  image: AssetImage("assets/images/bell.png"),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text(
                    "Today",
                    style: AppTextStyle.titleWhite16,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "1st Ramadan 4445",
                    style: AppTextStyle.titleWhite16,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Tuesday, 12 Mar 2024",
                    style: AppTextStyle.titleWhite16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
