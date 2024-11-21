import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String title;
  const MainText({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        letterSpacing: 2.2,
      ),
    );
  }
}