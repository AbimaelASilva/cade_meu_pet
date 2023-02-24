import 'package:get/get.dart';

import '../../providers/providers.dart';

class LoginController extends GetxController {
  LoginController(this._providers);

  final LoginProviders _providers;

  Future<void> searchProduct({
    String searchTerm = '',
    bool scrollProductList = false,
  }) async {
    try {
      //   await _productController.searchProduct(searchTerm: _searchTerm.value);

    } catch (e) {}
  }
}
