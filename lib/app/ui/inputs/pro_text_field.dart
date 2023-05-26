import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui.dart';

class ProTextField extends StatelessWidget {
  const ProTextField({
    this.value = '',
    this.onChanged,
    this.onTap,
    this.hintText = '',
    this.label = '',
    this.keyboardType,
    this.labelStyle,
    this.inputFormmatters,
    this.enabledInput,
    this.backgroundColor,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  final String value;
  final String hintText;
  final String label;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormmatters;
  final bool? enabledInput;
  final Color? backgroundColor;
  final int? maxLines;

//  factory ProTextField.password({
//     this.value = '',
//     this.onChanged,
//     this.onTap,
//     this.hintText = '',
//     this.label = '',
//     this.keyboardType,
//     this.labelStyle,
//     this.inputFormmatters,
//     this.enabledInput,
//     this.backgroundColor,
//     this.maxLines,
//     Key? key,
//   }) : super(key: key);

  /// Constructor for input area
  factory ProTextField.area({
    Key? key,
    Color? backgroundColor,
    bool? enabledInput,
    String hintText = '',
    List<TextInputFormatter>? inputFormmatters,
    TextInputType? keyboardType,
    String label = '',
    TextStyle? labelStyle,
    int? maxLines,
    dynamic Function(String)? onChanged,
    dynamic Function()? onTap,
    String value = '',
  }) {
    return ProTextField._(
      key: key,
      backgroundColor: backgroundColor,
      enabledInput: enabledInput,
      hintText: hintText,
      inputFormmatters: inputFormmatters,
      keyboardType: keyboardType,
      label: label,
      labelStyle: labelStyle,
      maxLines: maxLines,
      onChanged: onChanged,
      onTap: onTap,
      value: value,
    );
  }

  const ProTextField._({
    this.value = '',
    this.onChanged,
    this.onTap,
    this.hintText = '',
    this.label = '',
    this.keyboardType,
    this.labelStyle,
    this.inputFormmatters,
    this.enabledInput,
    this.backgroundColor,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabledInput,
      //  obscureText: true,
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: value,
          //  text: text,
          selection: TextSelection.collapsed(offset: value.length),
        ),
      ),
      style: labelStyle ??
          ProTextStyles.regular16.copyWith(fontWeight: FontWeight.w400),
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(8.0, 15.0, 10.0, 15.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        fillColor: backgroundColor ?? Colors.transparent,
        hintText: hintText,
        hintStyle: ProTextStyles.regular16
            .copyWith(fontWeight: FontWeight.w400, color: ProColors.grayDark),
        filled: true,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: inputFormmatters,
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
