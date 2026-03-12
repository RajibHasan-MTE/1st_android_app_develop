import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../conts/TEXT_STYLE.dart';


class CategoryCard extends StatelessWidget {
  final String categoryImage;
  final String categoryNmae;

  const CategoryCard({super.key, required this.categoryImage, required this.categoryNmae});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 85,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Image.asset(categoryImage),
          SizedBox(height: 8),
          Text(categoryNmae, style: AppTextStyle.textBlack10),
        ],
      ),
    );
  }
}
