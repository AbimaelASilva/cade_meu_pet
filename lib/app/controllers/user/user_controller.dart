import 'package:cade_meu_pet/app/ui/components/pro_snack_bar.dart';
import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class UserController extends GetxController {
  UserController(this._providers);

  final UserProviders _providers;

  final _user = UserModel.empty().obs;

  final _confirmPassword = ''.obs;

  final _isRegistering = false.obs;

  UserModel get user => _user.value;

  bool get isRegistering => _isRegistering.value;

  String get confirmPassword => _confirmPassword.value;

  void setEmail(String value) {
    _user.update((val) {
      val!.email = value;
    });
  }

  void setPassword(String value) {
    _user.update((val) {
      val!.senha = value;
    });
  }

  void setConfirmPassword(String value) {
    _confirmPassword.value = value;
  }

  Future<void> registerUser() async {
    try {
      _isRegistering.value = true;
      final response = await _providers.registerUser(user);

      if (response) {
        Get.back();
        proSnackBar(message: 'O usuário foi cadastrado');
      }
    } catch (error) {
      print('ERROR: UserController/registerUser: $error');
    } finally {
      _isRegistering.value = false;
    }
  }
}
