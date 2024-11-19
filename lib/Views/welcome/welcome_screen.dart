import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/bold_text.dart';
import '../../Widget/custom_button.dart';
import '../../Widget/small_text.dart';
import '../../utils/colors.dart';
import '../button_sheet/buttonsheet.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background image using a Stack
      body: Stack(
        children: [
          // Background image container with full screen size
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content container with centered and padded content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const BoldText(title: 'Welcome'),
                  const SmallText(
                    text:
                        'Before enjoying Food media services Please register first',
                  ),
                  const Spacer(),
                  CustomButton(
                    title: 'Create Account',
                    titleColor: Colors.white,
                    onTap: () {
                      Get.bottomSheet(
                        const ButtonsheetWidget(),
                        isScrollControlled: true,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'By logging in or registering, you have agreed to ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'The Terms And Conditions',
                          style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
