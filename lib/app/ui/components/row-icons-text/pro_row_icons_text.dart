import 'package:flutter/material.dart';

import '../../colors/colors.dart';

import '../components.dart';
import '../../padding/pro_padding.dart';

class ProRowIconsText extends StatelessWidget {
  const ProRowIconsText({
    this.leftIcon,
    required this.textLabel,
    this.rightIcon,
    this.style,
    this.radiusLeftIcon,
    this.backgroundColor,
    this.borderColorLeftIcon,
    this.borderWidth = 1.0,
    this.paddingLeftIcon = ProPadding.all8,
    Key? key,
  }) : super(key: key);

  final Widget? leftIcon;
  final String textLabel;
  final Widget? rightIcon;
  final TextStyle? style;
  final double? radiusLeftIcon;
  final Color? backgroundColor;
  final Color? borderColorLeftIcon;
  final double borderWidth;
  final EdgeInsetsGeometry paddingLeftIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              if (leftIcon != null)
                ProRoundedContainer(
                  borderRadius: radiusLeftIcon ?? 16,
                  backgroundColor: backgroundColor,
                  borderColor: borderColorLeftIcon ?? ProColors.gray,
                  borderWidth: borderWidth,
                  child: Padding(
                    padding: paddingLeftIcon,
                    child: leftIcon,
                  ),
                ),
              Expanded(
                child: Text(
                  textLabel,
                  style: style,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        rightIcon ?? const SizedBox.shrink()
      ],
    );
  }
}
