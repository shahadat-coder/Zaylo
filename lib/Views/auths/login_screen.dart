import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaylo/Routes/route_name.dart';
import '../../Widget/custom_button.dart';
import '../../Widget/custom_text_field.dart';
import '../forget_pass/forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _auth = FirebaseAuth.instance;


  String _email = '';
  String _password = '';
  String _validUser = '';
  String _validPassword = '';

  Future<void> _getUsernamePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _validUser = prefs.getString('email') ?? '';
      _validPassword = prefs.getString('password') ?? '';
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    // Add more robust email validation if needed
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    // Add password strength validation if needed
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text != _validUser) {
        Get.snackbar('Invalid email', 'The email you entered is invalid');
        Get.toNamed(RouteNames.buttonNav);
        return;
      }

      if (_passwordController.text != _validPassword) {
        Get.snackbar('Invalid password', 'Account password is incorrect. Try again!');
        return;
      }

      try {
        // Sign in with Firebase
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Show success message or navigate
        Get.snackbar('Success', 'You are now logged in!');
      } catch (e) {
        // Handle Firebase authentication errors
        Get.snackbar('Error', e.toString());
      }
    }
  }


  @override
  void initState() {
    super.initState();
    _getUsernamePassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Email',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Email',
                hintText: 'Enter the email',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300
                ),
                controller: _emailController,
                validator: _validateEmail,
                onChanged: (value) => _email = value,
              ),
              const SizedBox(height: 10),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Password',
                hintText: 'Enter the password',
                hintStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                    });
                  },
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                controller: _passwordController,
                validator: _validatePassword,
                isSecured: true,
                onChanged: (value) => _password = value,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(const ForgetPasswordScreen());
                  }, child: Text("Forget Password"),
                  // ...
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: CustomButton(
                  title: 'Login',
                  onTap: _submitForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}