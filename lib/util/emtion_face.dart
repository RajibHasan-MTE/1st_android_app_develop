import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmotionFace extends StatelessWidget {
  final String emotionFace;
  final String emotionName;

  const EmotionFace({
    super.key,
    required this.emotionFace,
    required this.emotionName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(emotionFace, style: TextStyle(fontSize: 28)),
          ),
        ),
        SizedBox(height: 8),
        Text(
          emotionName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
