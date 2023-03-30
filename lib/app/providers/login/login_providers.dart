import 'package:cade_meu_pet/config_app.dart';

import '../../../connect/connect.dart';

class LoginProviders {
  LoginProviders(this._proDioConnect);
  final ProDioConnect _proDioConnect;

  Future<bool> getLostPets() async {
    try {
      final response = await _proDioConnect.post(
        url: ConfigApp.urlServer,
        ep: '/pet',
      );

      if (response.toString() == '1') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
