import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmotionFace extends StatelessWidget {
  final String emotionFace;
  final String emotionName;

  const EmotionFace({
    super.key,
    required this.emotionName,
    required this.emotionFace,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue[600],
          ),
          child: Text(emotionFace, style: TextStyle(fontSize: 30)),
        ),
        SizedBox(height: 5),
        Text(
          emotionName,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}
