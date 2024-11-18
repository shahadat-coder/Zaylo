import 'package:flutter/material.dart';
import '../../Widget/bold_text.dart';
import '../../Widget/custom_button.dart';
import '../../Widget/small_text.dart';
import '../../utils/colors.dart';



class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String email = '';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const BoldText(title: 'Forget Password'),
            const SmallText(text: 'Enter your registered email below'),
            const SizedBox(
              height: 50,
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
            TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Eg namaemail@emailkamu.com',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black87, // Change border color here
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black87, // Change border color here
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                textAlign: TextAlign.center,
                // Add this line to center the text
                text: const TextSpan(
                  text: 'Remember the password?',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: ' Sign in',
                      style: TextStyle(
                        color: AppColors.greenColors,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                title: 'Submit',
                onTap: () {
                  if (!email.isEmpty) {
                    //Get.to(const SuccessScreen());
                  }
                },
                backgroundColor: email.isEmpty
                    ? AppColors.greenColors.withOpacity(.2)
                    : AppColors.greenColors,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}