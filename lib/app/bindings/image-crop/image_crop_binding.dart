import 'package:get/get.dart';

import '../../controllers/controllers.dart';

///
class ImageCropBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ImageCropController(),
    );
  }
}
