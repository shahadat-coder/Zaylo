import 'package:flutter/material.dart';
import 'package:zaylo/Widget/custom_button.dart';
import 'package:zaylo/utils/colors.dart';

import '../../Widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> globalkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an Email';
    }
    RegExp emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailReg.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  void _submitForm() {
    if (globalkey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
        child: Form(
          key: globalkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
        CustomTextField(label: 'Name', hintText: 'Enter the name',),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
        CustomTextField(label: 'Email', hintText: 'Enter the email',),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(label: 'Password', hintText: 'Enter the password',),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: CustomButton(
                  title: 'Registration',
                  onTap: name.isEmpty || email.isEmpty || password.isEmpty
                      ? null : _submitForm,
                  backgroundColor:
                  name.isEmpty || email.isEmpty || password.isEmpty
                      ? AppColors.greenColors.withOpacity(.2)
                      : AppColors.greenColors,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}