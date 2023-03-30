// ignore_for_file: sort_child_properties_last

import 'package:cade_meu_pet/routes/app_routes.dart';
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
          _optionBottomBar(
            icon: ProIconsFont.comment,
            label: 'label_home'.tr,
            isSelected: Get.currentRoute == Routes.home,
            onTap: () => Get.toNamed(Routes.home),
          ),
          _optionBottomBar(
            icon: Icons.search,
            label: 'label_search'.tr,
            isSelected: Get.currentRoute == Routes.lostPets,
            onTap: () => Get.toNamed(Routes.lostPets),
          ),
          _optionBottomBar(
            icon: ProIconsFont.config,
            label: 'label_settings'.tr,
            isSelected: false,
          ),
          _optionBottomBar(
            icon: ProIconsFont.comment,
            label: 'label_chat'.tr,
            isSelected: false,
          ),
          _optionBottomBar(
            icon: ProIconsFont.person,
            label: 'label_account'.tr,
            isSelected: false,
          ),
        ],
      ),
    );
  }

  Widget _optionBottomBar({
    required IconData icon,
    required String label,
    required bool isSelected,
    Function()? onTap,
  }) {
    return GestureDetector(
      child: Container(
        padding: ProPadding.symmetricalHor6,
        height: 66,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? ProColors.orange : ProColors.greenDark,
            ),
            Text(
              label,
              style: ProTextStyles.medium12.copyWith(
                color: isSelected ? ProColors.orange : ProColors.greenDark,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
