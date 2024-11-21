import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({Key? key, required this.slides}) : super(key: key);

  final List<Map<String, String>> slides;

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedCarouselSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            viewportFraction: 0.8,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, _) {
              _selectedCarouselSlider.value = index;
            },
          ),
          items: widget.slides.map(
                (slide) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColors.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        slide['imageUrl'] ?? '',
                        fit: BoxFit.fitWidth, // Set BoxFit.cover for full coverage
                        height: 125,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedCarouselSlider,
          builder: (context, value, _) {
            List<Widget> carouselDotList = [];
            for (int i = 0; i < widget.slides.length; i++) {
              carouselDotList.add(Container(
                width: value == i ? 30 : 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: value == i ? AppColors.primaryColors : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(100),
                  color: value == i ? AppColors.primaryColors : null,
                ),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselDotList,
            );
          },
        )
      ],
    );
  }
}