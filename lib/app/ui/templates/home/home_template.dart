import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
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
                      onPressed: () => Get.toNamed(Routes.lostPets),
                    ),
                  ),
                  const SizedBox(
                    width: ProSpaces.proSpaces20,
                  ),
                  Expanded(
                    child: ProActiveButton(
                      buttonName: 'label_find'.tr,
                      height: 62,
                      onPressed: () => Get.toNamed(Routes.registerPet),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ProBottomNavigator(),
    );
  }
}
