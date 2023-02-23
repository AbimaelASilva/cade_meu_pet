import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui.dart';

class ProTextField extends StatelessWidget {
  const ProTextField({
    this.text = '',
    this.onChanged,
    this.onTap,
    this.hintText = '',
    this.label = '',
    this.keyboardType,
    this.labelStyle,
    this.inputFormmatters,
    this.enabledInput,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final String text;
  final String hintText;
  final String label;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormmatters;
  final bool? enabledInput;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabledInput,
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: text,
          //  text: text,
          selection: TextSelection.collapsed(offset: text.length),
        ),
      ),
      style: labelStyle ?? ProTextStyles.regular16,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(8.0, 10.0, 10.0, 10.0),
        border: InputBorder.none,

        fillColor: backgroundColor ?? Colors.transparent,
        // label: Text(
        //   label,
        //   style: ProTextStyles.regular16,
        // ),
        hintText: hintText,
        hintStyle: ProTextStyles.regular16,
        filled: true,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: inputFormmatters,
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
