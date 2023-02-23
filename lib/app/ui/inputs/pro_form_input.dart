import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inputs.dart';
import '../padding/pro_padding.dart';
import '../components/components.dart';
import '../colors/colors.dart';
import '../text-styles/pro_text_styles.dart';

class ProFormInput extends StatelessWidget {
  const ProFormInput({
    Key? key,
    this.labelHeader = '',
    this.inputText = '',
    this.enabledInput,
    this.onChanged,
  }) : super(key: key);

  final String labelHeader;
  final String inputText;
  final bool? enabledInput;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelHeader,
          style: ProTextStyles.semiBold16
              .copyWith(color: ProColors.dark, fontWeight: FontWeight.w500),
        ),
        ProRoundedContainer(
          borderRadius: 8,
          borderColor: ProColors.grayOne,
          backgroundColor: ProColors.grayOne,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: ProPadding.all4,
                  child: ProTextField(
                    enabledInput: enabledInput,
                    text: inputText,
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
