import 'package:cade_meu_pet/app/ui/assets/fonts/icons/pro_icons_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class HomeTemplate extends GetView<HomeController> {
  const HomeTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: ProPadding.symmetricalHor16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'label_where_is_my_pet'.tr,
                  style: ProTextStyles.bold22.copyWith(fontSize: 30),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                '${'label_you'.tr}...',
                style: ProTextStyles.bold22.copyWith(
                  fontSize: 24,
                  color: ProColors.greenDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              'label_want_to_find_your_pet'.tr,
              style: ProTextStyles.bold22.copyWith(
                fontSize: 16,
                color: ProColors.greenDark,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                '${'label_or'.tr}...',
                style: ProTextStyles.bold22.copyWith(
                  fontSize: 24,
                  color: ProColors.greenDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              'label_help_find_pet'.tr,
              style: ProTextStyles.bold22.copyWith(
                fontSize: 16,
                color: ProColors.greenDark,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Row(
                children: [
                  Expanded(
                    child: ProActiveButton(
                      buttonName: 'label_help'.tr,
                      backgroundColor: ProColors.gray,
                      textColor: ProColors.redMedium,
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: ProColors.redMedium,
                      ),
                      height: 62,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: ProSpaces.proSpaces20,
                  ),
                  Expanded(
                    child: ProActiveButton(
                      buttonName: 'label_find'.tr,
                      height: 62,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
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
      height: 70,
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
