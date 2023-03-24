import 'package:cade_meu_pet/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class RegisterPetTemplate extends GetView<HomeController> {
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
                  imageCircle(
                    urlImage:
                        'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',
                    icon: FontAwesomeIcons.plus,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: ProSpaces.proSpaces16),
                child: Row(
                  children: [
                    Expanded(
                      child: customInput(
                          headerName: 'label_pet_name'.tr, labelName: 'Rex'),
                    ),
                    const SizedBox(
                      width: ProSpaces.proSpaces16,
                    ),
                    Expanded(
                      child: customInput(
                          headerName: 'label_breed'.tr, labelName: 'Bulldog'),
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
                          headerName: 'label_characteristics'.tr, maxLines: 2),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: customInput(
                        headerName: 'label_last_seen'.tr, maxLines: 2),
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
                    child: ProActiveButton(
                      buttonName: 'label_send'.tr,
                      height: 50,
                      onPressed: () => Get.toNamed(Routes.registerPetFinisched),
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
    return SizedBox(
      height: 105,
      // width: Get.width * 0.65,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        // separatorBuilder: (context, index) {
        //   return const Divider();
        // },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: ProSpaces.proSpaces16),
            child: imageCircle(
              urlImage:
                  'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',
            ),
          );
        },
      ),
    );
  }

  Widget imageCircle({required String urlImage, IconData? icon}) {
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
            child: Icon(
              icon ?? ProIconsFont.emptyimage,
              color: ProColors.dark,
              size: 32,
            )
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
          ),
        ),
      ],
    );
  }
}
