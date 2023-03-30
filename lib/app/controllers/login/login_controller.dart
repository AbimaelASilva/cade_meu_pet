import 'package:get/get.dart';

import '../../providers/providers.dart';

class LoginController extends GetxController {
  LoginController(this._providers);

  final LoginProviders _providers;

  Future<void> getUser({
    String searchTerm = '',
    bool scrollProductList = false,
  }) async {
    try {
      await _providers.getLostPets();
    } catch (e) {}
  }
}
