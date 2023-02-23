import 'package:flutter/material.dart';

class ProImageAssetPng extends StatelessWidget {
  const ProImageAssetPng({
    Key? key,
    this.heightImage = 0,
    required this.widthImage,
    required this.widthSizedBox,
    required this.patchImage,
    required this.fit,
  }) : super(key: key);

  final double heightImage;
  final double widthImage;
  final double widthSizedBox;
  final String patchImage;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSizedBox,
      child: Image.asset(
        'assets/images/$patchImage.png',
        height: heightImage,
        width: widthImage,
        fit: fit,
      ),
    );
  }
}
