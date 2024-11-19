import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isSecured;
  final Widget? trailing;
  final TextStyle? labelStyle;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Function to validate input
  final TextStyle? hintStyle;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isSecured = false, // Default to false
    this.trailing,
    this.onChanged, // Deprecated, use controller instead
    this.hintStyle,
    this.labelStyle,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Use the controller
      validator: widget.validator, // Use the validator function
      obscureText: widget.isSecured,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.5),
            width: 0.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primaryColors,
            width: 0.3,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.primaryColors,
            width: 0.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 0.3,
          ),
        ),
        labelText: widget.label,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        suffixIcon: widget.trailing,
        labelStyle: widget.labelStyle,
      ),
    );
  }
}