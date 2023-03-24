import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class UserController extends GetxController {
  UserController(this._providers);

  final UserProviders _providers;

  final _user = UserModel.empty().obs;

  final _confirmPassword = ''.obs;

  UserModel get user => _user.value;

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
      await _providers.registerUser(user);
    } catch (error) {
      print('ERROR: UserController/registerUser: $error');
    }
  }
}
