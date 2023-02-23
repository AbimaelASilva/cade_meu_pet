import 'package:get/get.dart';

import '../../providers/providers.dart';
import '../../../connect/connect.dart';
import '../../controllers/controllers.dart';

///
class HomeBindings implements Bindings {
  @override
  void dependencies() {
    final proHasuraConnect = ProHasuraConnect().proHasuraConnect;
    final provier = HomeProviders(proHasuraConnect);
    Get.lazyPut(
      () => HomeController(provier),
    );
  }
}
