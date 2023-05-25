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

  UserModel _user = UserModel.empty();

  set setEmail(String value) => _user.email = value;

  set setPassword(String value) => _user.senha = value;

  get isLoading => _state.isLoading;

  Future<void> getUser({
    String searchTerm = '',
    bool scrollProductList = false,
  }) async {
    try {
      final response = await _providers.getUser(_user);

      if (response) {
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
      _state.changeIsLoading = false;
    }
  }
}
