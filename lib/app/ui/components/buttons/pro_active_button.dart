// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class ProActiveButton extends StatelessWidget {
  const ProActiveButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.height,
    this.backgroundColor,
    this.textColor,
    this.borderSide,
    this.width = 50,
    this.icon,
  }) : super(key: key);

  final String buttonName;
  final double height;
  final double width;
  final Function()? onPressed;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      //  width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            alignment: icon != null ? Alignment.centerLeft : Alignment.center,
            backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? ProColors.redHigh,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: borderSide ?? BorderSide.none,
              ),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: ProSpaces.proSpaces10),
              child: icon ?? SizedBox.shrink(),
            ),
            Text(
              buttonName,
              style: TextStyle(
                color: textColor ?? ProColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
