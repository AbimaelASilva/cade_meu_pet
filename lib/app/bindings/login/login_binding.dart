import 'package:get/get.dart';

import '../../providers/providers.dart';
import '../../../connect/connect.dart';
import '../../controllers/controllers.dart';

///
class LoginBindings implements Bindings {
  @override
  void dependencies() {
    final proHasuraConnect = ProHasuraConnect().proHasuraConnect;
    final provier = LoginProviders(proHasuraConnect);
    Get.lazyPut(
      () => LoginController(provier),
    );
  }
}
