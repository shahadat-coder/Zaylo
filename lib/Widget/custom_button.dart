import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.titleColor,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? titleColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 5, // Adjust elevation as needed
        backgroundColor: widget.backgroundColor ?? Colors.blue, // Default color
        shadowColor: Colors.grey.withOpacity(0.5),
        minimumSize: const Size.fromHeight(60), // Button height
      ),
      child: Text(
        widget.title,
        style: TextStyle(
          color: widget.titleColor ?? Colors.white, // Default text color
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
