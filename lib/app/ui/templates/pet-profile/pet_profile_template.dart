import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class PetProfileTemplate extends GetView<PetController> {
  const PetProfileTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          'label_profile'.tr,
          style: ProTextStyles.bold22,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        centerTitle: true,
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
                  '${controller.pet.nome} - ${controller.pet.raca}',
                  style: ProTextStyles.bold22,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 48),
                child: GestureDetector(
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
                      ],
                    ),
                  ),
                  onTap: () async {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${'label_characteristics'.tr}:',
                          style: ProTextStyles.semiBold16.copyWith(
                            color: ProColors.greenDark,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.pet.caracteristicas,
                            style: ProTextStyles.regular14.copyWith(
                              color: ProColors.dark,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${'label_last_seen'.tr}:',
                          style: ProTextStyles.semiBold16.copyWith(
                            color: ProColors.greenDark,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.pet.ultimaVezVisto,
                            style: ProTextStyles.regular14.copyWith(
                              color: ProColors.dark,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: SizedBox(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: ProActiveButton(
                        buttonName: 'label_report_information'.tr,
                        height: 62,
                        width: Get.width,
                        onPressed: () {},
                      ),
                    ),
                  ],
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
