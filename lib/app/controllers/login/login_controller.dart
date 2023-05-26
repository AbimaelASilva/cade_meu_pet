import 'package:cade_meu_pet/app/controllers/controllers.dart';
import 'package:cade_meu_pet/app/models/models.dart';
import 'package:cade_meu_pet/app/ui/components/pro_snack_bar.dart';
import 'package:cade_meu_pet/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../providers/providers.dart';

class LoginController extends GetxController {
  LoginController(this._providers);

  final _state = Get.find<StateController>();

  final LoginProviders _providers;

  final _user = UserModel.empty().obs;

  final _isLoading = false.obs;

  set setEmail(String value) => _user.value.email = value;

  set setPassword(String value) => _user.value.senha = value;

  UserModel get user => _user.value;

  get isLoading => _isLoading.value;

  void _clearUser() {
    _user.update((val) {
      val!.email = '';
      val.senha = '';
    });

    refresh();
  }

  Future<void> getUser({
    String searchTerm = '',
    bool scrollProductList = false,
  }) async {
    try {
      _isLoading.value = true;
      final response = await _providers.getUser(_user.value);

      if (response) {
        _clearUser();
        Get.toNamed(Routes.home);
      } else {
        proSnackBar(
          title: 'Ops!',
          message: 'Erro ao fazer login, tente novamente!!',
        );
      }
    } catch (error) {
      print('ERROR /LoginController/getUser:$error ');
    } finally {
      _isLoading.value = false;
    }
  }
}
