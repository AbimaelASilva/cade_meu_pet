import 'package:cade_meu_pet/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class FinischedRegisterPetTemplate extends GetView<HomeController> {
  const FinischedRegisterPetTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: ProPadding.symmetricalHor16,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'message_finisched_register_1'.tr,
                style: ProTextStyles.bold22.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: ProPadding.symmetricalVer32,
                child: Text(
                  'message_finisched_register_2'.tr,
                  style: ProTextStyles.bold22
                      .copyWith(fontSize: 25, color: ProColors.greenDark),
                  textAlign: TextAlign.center,
                ),
              ),
              const ProLottie(
                lottiePath: LottiePath.pet,
                height: 150,
                width: 150,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: ProSpaces.proSpaces16),
        height: 148,
        child: Column(
          children: [
            Padding(
              padding: ProPadding.symmetricalHor16
                  .copyWith(bottom: ProSpaces.proSpaces16),
              child: Row(
                children: [
                  Expanded(
                    child: ProActiveButton(
                      buttonName: 'label_start'.tr,
                      height: 50,
                      onPressed: () => Get.offAllNamed(Routes.home),
                    ),
                  ),
                ],
              ),
            ),
            const ProBottomNavigator(),
          ],
        ),
      ),
    );
  }
}
