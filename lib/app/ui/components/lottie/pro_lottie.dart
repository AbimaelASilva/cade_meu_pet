import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProLottie extends StatelessWidget {
  const ProLottie({
    required this.lottiePath,
    this.width = 24.0,
    this.height = 24.0,
    Key? key,
  }) : super(key: key);

  final String lottiePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Lottie.asset(
        lottiePath,
      ),
    );
  }
}
