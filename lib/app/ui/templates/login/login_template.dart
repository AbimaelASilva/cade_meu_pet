import 'package:cade_meu_pet/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class LoginTemplate extends GetView<LoginController> {
  const LoginTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProColors.white,
      body: Center(
        child: Padding(
          padding: ProPadding.symmetricalHor16,
          child: ListView(
            shrinkWrap: true,
            children: [
              const ProLottie(
                lottiePath: LottiePath.pet,
                height: 150,
              ),
              Text(
                'label_welcome'.tr,
                style: ProTextStyles.bold22.copyWith(
                  fontSize: ProFontSizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: ProSpaces.proSpaces32),
                child: Text(
                  'label_app_name'.tr,
                  style: ProTextStyles.bold22.copyWith(
                    fontSize: ProFontSizes.size30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     vertical: ProSpaces.proSpaces16,
              //   ),
              //   child: Text(
              //     'label_access'.tr,
              //     style: ProTextStyles.bold22.copyWith(
              //         fontSize: ProFontSizes.size24,
              //         fontWeight: FontWeight.w700,
              //         color: ProColors.greenDark),
              //   ),
              // ),
              Text(
                'label_tap_email'.tr,
                style: ProTextStyles.regular12.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: ProSpaces.proSpaces4,
                  bottom: ProSpaces.proSpaces20,
                ),
                child: ProTextField(
                  backgroundColor: ProColors.gray,
                  labelStyle: ProTextStyles.regular14,
                  hintText: 'label_email'.tr,
                ),
              ),
              Text(
                'label_tap_password'.tr,
                style: ProTextStyles.regular12.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: ProSpaces.proSpaces4,
                  bottom: ProSpaces.proSpaces32,
                ),
                child: ProTextField(
                  backgroundColor: ProColors.gray,
                  labelStyle: ProTextStyles.regular14,
                  hintText: 'label_password'.tr,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.red,
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        'label_remember_my_password'.tr,
                        style: ProTextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ProColors.greenDark),
                      ),
                    ],
                  ),
                  Text(
                    'label_forgot_my_password'.tr,
                    style: ProTextStyles.regular12.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ProColors.redMedium),
                  ),
                ],
              ),
              Padding(
                padding: ProPadding.symmetricalVer16,
                child: Row(
                  children: [
                    Expanded(
                      child: ProActiveButton(
                        buttonName: 'label_register'.tr,
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
                        buttonName: 'label_to_access'.tr,
                        height: 62,
                        onPressed: () => Get.toNamed(Routes.home),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
