import 'package:get/get.dart';

import '../../providers/providers.dart';
import '../../../connect/connect.dart';
import '../../controllers/controllers.dart';

///
class PetBindings implements Bindings {
  @override
  void dependencies() {
    final proDioConnect = ProDioConnect();
    final provier = PetProviders(proDioConnect);
    Get.lazyPut(
      () => PetController(provier),
    );
  }
}
