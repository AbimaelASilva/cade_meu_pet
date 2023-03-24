import 'package:get/get.dart';

import '../../providers/providers.dart';

class PetController extends GetxController {
  PetController(this._providers);

  final PetProviders _providers;

  Future<void> searchProduct({
    String searchTerm = '',
    bool scrollProductList = false,
  }) async {
    try {
      //   await _productController.searchProduct(searchTerm: _searchTerm.value);

    } catch (e) {}
  }
}
