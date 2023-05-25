import 'package:cade_meu_pet/app/ui/colors/colors.dart';
import 'package:flutter/material.dart';

proSnackBarNative({
  required List<Widget> children,
  Color? backgroundColor,
  double? height,
  EdgeInsets? padding,
  CrossAxisAlignment? crossAxisAlignment,
  BorderRadius? borderRadius,
  required BuildContext context,
}) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ProSnackBarNative(
          children: children,
          backgroundColor: backgroundColor,
          height: height,
          padding: padding,
          crossAxisAlignment: crossAxisAlignment,
          borderRadius: borderRadius,
        );
      });
}

class ProSnackBarNative extends StatelessWidget {
  ///
  const ProSnackBarNative({
    Key? key,
    required this.children,
    this.backgroundColor,
    this.height,
    this.padding,
    this.crossAxisAlignment,
    this.borderRadius,
  }) : super(key: key);

  ///
  final Color? backgroundColor;

  ///
  final List<Widget> children;

  /// Maximum height. Default value 136.0.
  final double? height;

  ///
  final EdgeInsets? padding;

  /// Cross axis alignment. [CrossAxisAlignment.start] default value.
  final CrossAxisAlignment? crossAxisAlignment;

  ///
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 40,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? ProColors.white,
        borderRadius: borderRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
      ),
      padding: padding ?? const EdgeInsets.all(8).copyWith(top: 8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
