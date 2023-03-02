import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../radius/radius.dart';

class ProCarousel extends StatefulWidget {
  const ProCarousel({
    required this.items,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final List<Widget> items;
  final Function? onTap;

  @override
  State<ProCarousel> createState() => _ProCarouselState();
}

class _ProCarouselState extends State<ProCarousel> {
  int _current = 0;
  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.items,
          carouselController: carouselController,
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            aspectRatio: 2.9,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.items.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 26 : 14,
                height: 6,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    color: _current == entry.key
                        ? ProColors.redMedium
                        : ProColors.gray,
                    borderRadius: ProRadius.proRadiusAll6),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
