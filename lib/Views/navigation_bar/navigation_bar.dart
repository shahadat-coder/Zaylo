import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:zaylo/Views/Wish_list/wish_list.dart';
import 'package:zaylo/Views/category/category_screen.dart';
import 'package:zaylo/Views/home/home_screens.dart';
import 'package:zaylo/Views/profile/profile_screen.dart';

import '../../utils/colors.dart';


class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreens(),
    CategoryScreen(),
    WishListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: AppColors.greenColors,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items:  [
          SalomonBottomBarItem(
            icon: Image.asset('assets/images/home.png',width: 25,height: 25,),
            title: const Text("Home"),
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: Image.asset('assets/images/check.png',width: 25,height: 25,),
            title: const Text("Checkout"),
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: Image.asset('assets/images/heart.png',width: 25,height: 25,),
            title: const Text("Wish"),
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: Image.asset('assets/images/user.png',width: 25,height: 25,),
            title: const Text("Profile"),
            selectedColor: Colors.black,
          ),
        ],
      ),
    );
  }
}