import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class RegisterPetTemplate extends GetView<PetController> {
  const RegisterPetTemplate({Key? key}) : super(key: key);

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'label_insert_data'.tr,
                    style: ProTextStyles.bold22.copyWith(fontSize: 30),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Text(
                      'label_pet_photos'.tr,
                      style: ProTextStyles.bold22.copyWith(
                        fontSize: 16,
                        color: ProColors.greenDark,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: circleList()),
                  GestureDetector(
                    child: imageCircle(
                      icon: FontAwesomeIcons.plus,
                    ),
                    onTap: () => controller.getImage(),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: ProSpaces.proSpaces16),
                child: Row(
                  children: [
                    Expanded(
                      child: customInput(
                        headerName: 'label_pet_name'.tr,
                        labelName: 'Rex',
                        onChanged: (value) => controller.setName(value),
                      ),
                    ),
                    const SizedBox(
                      width: ProSpaces.proSpaces16,
                    ),
                    Expanded(
                      child: customInput(
                        headerName: 'label_breed'.tr,
                        labelName: 'Bulldog',
                        onChanged: (value) => controller.setBreed(value),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: ProPadding.symmetricalVer16,
                child: Row(
                  children: [
                    Expanded(
                      child: customInput(
                        headerName: 'label_characteristics'.tr,
                        maxLines: 2,
                        onChanged: (value) =>
                            controller.setCharacteristics(value),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: customInput(
                      headerName: 'label_last_seen'.tr,
                      maxLines: 2,
                      onChanged: (value) => controller.setLastSee(value),
                    ),
                  ),
                ],
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
                    child: Obx(
                      () => ProActiveButton(
                        icon: controller.registeringPet
                            ? const SizedBox(
                                height: 32,
                                width: 32,
                                child: CircularProgressIndicator(
                                    color: ProColors.white),
                              )
                            : null,
                        backgroundColor:
                            controller.registeringPet ? ProColors.gray : null,
                        buttonName: controller.registeringPet
                            ? 'Registrando Pet...'
                            : 'label_send'.tr,
                        height: 50,
                        onPressed: controller.registeringPet
                            ? null
                            : () async {
                                await controller.registerPet();
                              },
                      ),
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

  Widget circleList() {
    return Obx(
      () => SizedBox(
        height: 105,
        // width: Get.width * 0.65,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:
              controller.pet.images.isEmpty ? 2 : controller.pet.images.length,
          itemBuilder: (context, index) {
            final file = controller.pet.images.isNotEmpty
                ? controller.pet.images[index]
                : null;
            return Padding(
              padding: const EdgeInsets.only(right: ProSpaces.proSpaces16),
              child: imageCircle(file: file),
            );
          },
        ),
      ),
    );
  }

  Widget imageCircle({File? file, IconData? icon}) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ProRoundedContainer(
        backgroundColor: ProColors.gray,
        borderWidth: ProSpaces.proSpaces6,
        borderColor: ProColors.gray,
        borderRadius: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: file == null
                ? Icon(
                    icon ?? ProIconsFont.emptyimage,
                    color: ProColors.dark,
                    size: 32,
                  )
                : ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 60,
                      maxHeight: 60,
                    ),
                    child: Image.file(
                      file,
                      fit: BoxFit.cover,
                    ))
            // ProImageNetwork(
            //   widthImage: 90,
            //   imageUrl: urlImage,
            //   fit: BoxFit.contain,
            // ),

            ),
      ),
    );
  }

  Widget customInput({
    String? headerName,
    String? labelName,
    int? maxLines,
    Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerName ?? '',
          style: ProTextStyles.regular12.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: ProSpaces.proSpaces6,
          ),
          child: ProTextField(
            backgroundColor: ProColors.gray,
            labelStyle: ProTextStyles.regular14,
            hintText: labelName ?? '',
            maxLines: maxLines,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
