import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
        wordSpacing: 0.15,
        fontWeight: FontWeight.w500,
        fontSize: 25,
        color: AppColors.redColors,

      ),
    );
  }
}