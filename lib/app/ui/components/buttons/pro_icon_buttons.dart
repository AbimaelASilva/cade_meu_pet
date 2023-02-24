import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../colors/colors.dart';

class ProIconButton extends StatelessWidget {
  const ProIconButton({
    required this.icon,
    this.onPressed,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final Function()? onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        icon,
        color: iconColor ?? ProColors.redHigh,
      ),
      onPressed: onPressed,
    );
  }
}
