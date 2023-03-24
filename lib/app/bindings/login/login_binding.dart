import 'package:get/get.dart';

import '../../providers/providers.dart';
import '../../../connect/connect.dart';
import '../../controllers/controllers.dart';

///
class LoginBindings implements Bindings {
  @override
  void dependencies() {
    final proDioConnect = ProDioConnect();
    final provier = LoginProviders(proDioConnect);
    Get.lazyPut(
      () => LoginController(provier),
    );
  }
}
