import 'package:get/get.dart';

import '../../providers/providers.dart';
import '../../../connect/connect.dart';
import '../../controllers/controllers.dart';

///
class HomeBindings implements Bindings {
  @override
  void dependencies() {
    final proDioConnect = ProDioConnect();
    final provier = HomeProviders(proDioConnect);
    Get.lazyPut(
      () => HomeController(provier),
    );
  }
}
