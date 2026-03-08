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
            Row(
              children: [
                Image.asset("assets/images/menu-outline.png"),
                SizedBox(width: 10,),
                Text("Home", style: GoogleFonts.playfairDisplay(
                  fontSize: 26,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.normal,
                ),)
              ],
            ),
          ],
        ),

      ),
      
    );
  }
}
