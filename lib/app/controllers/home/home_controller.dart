import 'package:get/get.dart';

import '../../providers/providers.dart';

class HomeController extends GetxController {
  HomeController(this._providers);

  final HomeProviders _providers;

  Future<void> searchProduct({
    String searchTerm = '',
    bool scrollProductList = false,
  }) async {
    try {
      //   await _productController.searchProduct(searchTerm: _searchTerm.value);

    } catch (e) {}
  }
}
