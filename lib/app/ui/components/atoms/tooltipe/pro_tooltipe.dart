import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../radius/pro_radius.dart';
import '../../../padding/padding.dart';

class ProToolTipe extends StatelessWidget {
  const ProToolTipe({
    Key? key,
    required this.message,
    required this.child,
  }) : super(key: key);

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      margin: ProPadding.all16,
      decoration: const BoxDecoration(
          borderRadius: ProRadius.proRadiusAll16, color: ProColors.dark),
      child: child,
    );
  }
}
