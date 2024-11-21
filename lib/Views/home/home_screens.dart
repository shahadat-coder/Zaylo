import 'package:flutter/material.dart';
import 'package:zaylo/Widget/carousel_slider.dart';
import 'package:zaylo/Widget/custom_text_field.dart';
import 'package:zaylo/utils/colors.dart';

import '../../Widget/MainText.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/zaylo.png',width: 110,height: 100,),
                      const CircleAvatar(
                        backgroundColor: AppColors.primaryColors,
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                              'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    hintText: "Search Here",
                    hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      color: Colors.black54
                    ),
                    trailing: Icon(Icons.search_outlined),
                  )),
              const SizedBox(height: 25,),
                  const HomeCarouselSlider(slides: [
                    {'imageUrl': 'https://i.pinimg.com/736x/e4/25/85/e42585cb7105ecaedca8ec998199b63e.jpg',},
                    {'imageUrl': 'https://img.freepik.com/premium-vector/fashion-sale-social-media-facebook-cover-banner-template_614249-236.jpg',},
                    {'imageUrl': 'https://img.freepik.com/premium-vector/creative-fashion-sale-social-media-facebook-cover-banner-web-banner-template_551826-406.jpg',},
                    {'imageUrl': 'https://img.freepik.com/premium-psd/fashion-sale-facebook-social-media-banner-template_1119004-55.jpg',},
                  ],),
                  const SizedBox(height: 15,),
                  const MainText(title: 'All Items',),


                ],
              ),
            ),
          )),
    );
  }
}


