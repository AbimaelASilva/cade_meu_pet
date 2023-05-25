import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../assets/fonts/fonts.dart';
import '../../../controllers/controllers.dart';
import '../../colors/colors.dart';
import '../../components/components.dart';
import '../../font-sizes/pro_font_sizes.dart';
import '../../padding/padding.dart';
import '../../spaces/pro_spaces.dart';
import '../../text-styles/text_styles.dart';

class ImageCropTemplate extends GetView<ImageCropController> {
  const ImageCropTemplate({Key? key}) : super(key: key);

  //File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foto do Animal',
          style: ProTextStyles.regular16.copyWith(
            color: ProColors.dark,
          ),
        ),
        centerTitle: true,
        leading: Container(
          margin: ProPadding.all4,
          width: ProSpaces.proSpaces32,
          height: ProSpaces.proSpaces32,
          child: ProRoundedContainer(
            borderColor: ProColors.white,
            borderRadius: 16,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
                color: ProColors.redHigh,
              ),
              onPressed: Get.back,
            ),
          ),
        ),
      ),
      body: _body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: ProSpaces.proSpaces16),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (controller.pickedFilePath.isNotEmpty ||
                  controller.pickedFilePath.isNotEmpty)
                FloatingActionButton(
                  heroTag: 'Confirmar',
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    controller.sendImageFileToEditProdut();
                  },
                  tooltip: 'Confirmar',
                  child: const Icon(
                    Icons.check,
                    color: ProColors.white,
                  ),
                ),
              FloatingActionButton(
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  _proSnackBarNative(context);
                },
                heroTag: 'Imagem',
                tooltip: 'Imagem',
                child: const Icon(
                  Icons.add_a_photo,
                  color: ProColors.white,
                ),
              ),
              if (controller.pickedFilePath.isNotEmpty)
                FloatingActionButton(
                  heroTag: 'Crop',
                  tooltip: 'Crop',
                  onPressed: () {
                    _cropImage(context);
                  },
                  backgroundColor: Colors.redAccent,
                  child: const Icon(Icons.crop),
                ),
              if (controller.pickedFilePath.isNotEmpty)
                FloatingActionButton(
                  heroTag: 'Delete',
                  tooltip: 'Delete',
                  onPressed: () {
                    controller.clear();
                  },
                  backgroundColor: Colors.redAccent,
                  child: const Icon(Icons.delete),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _proSnackBarNative(BuildContext context) => proSnackBarNative(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        children: [
          _snackOption(
            label: 'Galeria',
            icon: Icons.photo_library,
            onTapPickImage: () => controller.pickImage(ImageSource.gallery),
          ),
          _snackOption(
            icon: Icons.camera_alt_outlined,
            label: 'Câmera',
            onTapPickImage: () => controller.pickImage(ImageSource.camera),
          ),
        ],
        context: context,
      );

  Widget _snackOption({
    required String label,
    required onTapPickImage,
    required IconData icon,
  }) =>
      GestureDetector(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
                onTapPickImage();
              },
              icon: FaIcon(
                icon,
                color: ProColors.redMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: ProFontSizes.size10),
              child: Text(
                label,
                style: ProTextStyles.medium12,
              ),
            ),
          ],
        ),
        onTap: () {
          Get.back();
          onTapPickImage();
        },
      );

  Widget _body(BuildContext context) {
    if (controller.croppedFile != null || controller.pickedFile != null) {
      return _image(context);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _image(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;
    return GetBuilder<ImageCropController>(
        init: controller,
        builder: (controller) {
          if (controller.croppedFile != null) {
            final path = controller.croppedFile!.path;
            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 0.8 * screenWidth,
                  maxHeight: 0.7 * screenHeight,
                ),
                child: Image.file(File(path)),
              ),
            );
          } else if (controller.pickedFile.path.isNotEmpty) {
            final path = controller.pickedFile.path;
            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 0.8 * screenWidth,
                  maxHeight: 0.7 * screenHeight,
                ),
                child: Image.file(File(path)),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    ProIconsFont.emptyimage,
                    size: 48,
                    color: ProColors.gray,
                  ),
                  Text(
                    'Sem foto selecionada!',
                    style: ProTextStyles.regular12.copyWith(
                      color: ProColors.gray,
                    ),
                  )
                ],
              ),
            );
          }
        });
  }

  Future<void> _cropImage(BuildContext context) async {
    if (controller.pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: controller.pickedFile.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Recortar imagem',
              toolbarColor: ProColors.grayLight,
              toolbarWidgetColor: ProColors.dark,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Recortar imagem',
          ),
        ],
      );
      if (croppedFile != null) {
        controller.setCroppedFile = croppedFile;
      }
    }
  }
}
