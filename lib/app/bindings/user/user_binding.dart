import 'package:get/get.dart';

import '../../providers/providers.dart';
import '../../../connect/connect.dart';
import '../../controllers/controllers.dart';

///
class UserBindings implements Bindings {
  @override
  void dependencies() {
    final proDioConnect = ProDioConnect();
    final provier = UserProviders(proDioConnect);
    Get.lazyPut(
      () => UserController(provier),
    );
  }
}
