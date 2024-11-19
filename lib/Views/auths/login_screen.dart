import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaylo/utils/colors.dart';
import '../../Widget/custom_button.dart';
import '../../Widget/custom_text_field.dart';
import '../forget_pass/forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> globalkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String email = '';
  String pass = '';

  String validPass = '';
  String validUser = '';

  getUsernamePassword() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        validUser = value.getString('email') ?? '';
        validPass = value.getString('password') ?? '';
      });

      print('Valid user $validUser\nValid password $validPass');
    });
  }

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
    if (globalkey.currentState!.validate()) {
      if (_emailController.text != validUser) {
        Get.snackbar('Invalid email', 'The email you entered is invalid');
        return;
      }

      if (_passController.text != validPass) {
        Get.snackbar('Invalid password', 'Account password is incorrect, Try again!');
        return;
      }

      // Everything is correct now navigate to home
      // Get.to(const BottomNavBaseScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    getUsernamePassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
          child: Form(
            key: globalkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 10),
            CustomTextField(label: 'Email', hintText: 'Enter the Email',),
                const SizedBox(height: 8),
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
                const SizedBox(height: 10),
                CustomTextField(label: 'Password', hintText: 'Enter the password',),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(const ForgetPasswordScreen());
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.greenColors,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: CustomButton(
                    title: 'Login',
                    onTap: email.isEmpty || pass.isEmpty ? null : _submitForm,
                    backgroundColor: email.isEmpty || pass.isEmpty
                        ? AppColors.greenColors.withOpacity(.2)
                        : AppColors.greenColors,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
