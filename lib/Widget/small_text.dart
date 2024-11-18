import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text( text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }
}