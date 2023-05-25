
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class RegisterUserTemplate extends GetView<UserController> {
  const RegisterUserTemplate({Key? key}) : super(key: key);

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
                lottiePath: LottiePath.register,
                height: 150,
              ),
              Text(
                'label_register_user'.tr,
                style: ProTextStyles.bold22.copyWith(
                  fontSize: ProFontSizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: ProSpaces.proSpaces16),
                child: Text(
                  'label_email'.tr,
                  style: ProTextStyles.regular12.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: ProSpaces.proSpaces4,
                  bottom: ProSpaces.proSpaces20,
                ),
                child: ProTextField(
                  value: controller.user.email,
                  backgroundColor: ProColors.gray,
                  labelStyle: ProTextStyles.regular14,
                  hintText: 'label_email'.tr,
                  onChanged: (value) => controller.setEmail(value),
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
                  value: controller.user.senha,
                  backgroundColor: ProColors.gray,
                  labelStyle: ProTextStyles.regular14,
                  hintText: 'label_password'.tr,
                  onChanged: (value) => controller.setPassword(value),
                ),
              ),
              Text(
                'label_confirm_password'.tr,
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
                  value: controller.confirmPassword,
                  backgroundColor: ProColors.gray,
                  labelStyle: ProTextStyles.regular14,
                  hintText: 'label_confirm_password'.tr,
                  onChanged: (value) => controller.setConfirmPassword(value),
                ),
              ),
              Padding(
                padding: ProPadding.symmetricalVer16,
                child: Row(
                  children: [
                    Expanded(
                      child: ProActiveButton(
                        buttonName: 'label_return'.tr,
                        backgroundColor: ProColors.gray,
                        textColor: ProColors.redMedium,
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: ProColors.redMedium,
                        ),
                        height: 62,
                        onPressed: Get.back,
                      ),
                    ),
                    const SizedBox(
                      width: ProSpaces.proSpaces20,
                    ),
                    Expanded(
                      child: ProActiveButton(
                        buttonName: 'label_register'.tr,
                        height: 62,
                        onPressed: () => controller.registerUser(),
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
