// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class ProActiveButton extends StatelessWidget {
  const ProActiveButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.height,
    this.width = 50,
    this.icon,
  }) : super(key: key);

  final String buttonName;
  final double height;
  final double width;
  final Function()? onPressed;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      //  width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            alignment: icon != null ? Alignment.centerLeft : Alignment.center,
            backgroundColor: MaterialStateProperty.all(ProColors.orange)),
        child: Text(
          buttonName,
          style: TextStyle(
            color: ProColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
