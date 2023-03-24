import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cade_meu_pet/app/ui/ui.dart';

class ProBottomNavigator extends StatelessWidget {
  const ProBottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProColors.grayLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _icon(
            icon: ProIconsFont.comment,
            label: 'label_home'.tr,
          ),
          _icon(icon: Icons.search, label: 'label_search'.tr, isSelected: true),
          _icon(icon: ProIconsFont.config, label: 'label_settings'.tr),
          _icon(icon: ProIconsFont.comment, label: 'label_chat'.tr),
          _icon(icon: ProIconsFont.person, label: 'label_account'.tr),
        ],
      ),
    );
  }

  Widget _icon({
    required IconData icon,
    required String label,
    bool? isSelected,
  }) {
    return Container(
      padding: ProPadding.symmetricalHor6,
      height: 66,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected != null ? ProColors.orange : ProColors.greenDark,
          ),
          Text(
            label,
            style: ProTextStyles.medium12.copyWith(
              color:
                  isSelected != null ? ProColors.orange : ProColors.greenDark,
            ),
          ),
        ],
      ),
    );
  }
}
