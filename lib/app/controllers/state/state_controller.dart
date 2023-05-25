import 'package:get/get.dart';

class StateController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set changeIsLoading(bool value) => _isLoading.value;
}
