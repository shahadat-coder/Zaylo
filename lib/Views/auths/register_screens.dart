import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaylo/Widget/custom_button.dart';
import '../../Widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
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
    // Add password strength validation if needed
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _auth.createUserWithEmailAndPassword(
          email: _emailController.text.toString(),
          password: _passwordController.text.toString());
         //The  massage will show!
          Get.snackbar('Good Work', 'Successfully SignUp ');

    }
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

              const SizedBox(height: 10),
              const Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
                validator: _validateEmail,
              ),
              const SizedBox(height: 8),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                validator: _validatePassword,
                isSecured: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: CustomButton(
                  title: 'Register',
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