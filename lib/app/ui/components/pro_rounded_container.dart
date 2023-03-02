import 'package:flutter/material.dart';

import '../colors/colors.dart';

class ProRoundedContainer extends StatelessWidget {
  const ProRoundedContainer({
    required this.child,
    this.borderRadius = 16,
    this.borderWidth = 1.0,
    this.borderColor = ProColors.gray,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? ProColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: child,
    );
  }
}
