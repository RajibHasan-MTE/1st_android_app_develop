import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/menu-outline.png"),
                      SizedBox(width: 10),
                      Text(
                        "Home",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 26,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Container(
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

                  // Image.asset("")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
