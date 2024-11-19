
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaylo/Views/auths/login_screen.dart';
import 'package:zaylo/Views/auths/register_screens.dart';
import 'package:zaylo/utils/colors.dart';

class ButtonsheetWidget extends StatelessWidget {
  const ButtonsheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.6,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
              topRight: Radius.circular(20))
      ),
      child: ContainedTabBarView(
        tabs: const [
          Text('Create Account', style: TextStyle(color: Colors.black)),
          Text('Login', style: TextStyle(color: Colors.black))
        ],
        views: const [
          RegisterScreen(),
          LoginScreen(),
        ],
        tabBarProperties: const TabBarProperties(
          indicatorColor: AppColors.primaryColors,
          labelColor: AppColors.primaryColors,
          unselectedLabelColor: Colors.black,

        ),
        onChange: (index) => print(index),
      ),
    );
  }
}