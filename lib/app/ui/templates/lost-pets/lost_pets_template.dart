import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class LostPetsTemplate extends GetView<PetController> {
  const LostPetsTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          'label_you_see'.tr,
          style: ProTextStyles.semiBold16,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
      body: Padding(
        padding: ProPadding.symmetricalHor16,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'label_wanted_list'.tr,
                  style: ProTextStyles.regular14.copyWith(
                    color: ProColors.greenDark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Obx(
                  () => controller.lostPetsList.isNotEmpty
                      ? Wrap(
                          runSpacing: 10,
                          spacing: 16,
                          alignment: WrapAlignment.center,
                          children: List.generate(
                              controller.lostPetsList.length, (index) {
                            final pet = controller.lostPetsList[index];
                            return GestureDetector(
                              child: SizedBox(
                                width: 120,
                                height: 120,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const ProImageNetwork(
                                          widthImage: 120,
                                          imageUrl:
                                              'https://static.wixstatic.com/media/16c759_521d25fc4faa4a1481c1292068a88f28~mv2.jpg/v1/fill/w_280,h_280,q_90/16c759_521d25fc4faa4a1481c1292068a88f28~mv2.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      pet.nome,
                                      style: ProTextStyles.regular12
                                          .copyWith(color: ProColors.dark),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                controller.setSelectedPet(pet);
                                Get.toNamed(Routes.petProfile);
                              },
                            );
                          }),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const ProBottomNavigator(),
    );
  }
}
