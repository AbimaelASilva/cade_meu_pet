import 'package:cade_meu_pet/app/models/models.dart';
import 'package:cade_meu_pet/app/providers/urls_app.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import '../../../connect/connect.dart';

class LoginProviders {
  LoginProviders(this._proDioConnect);
  final ProDioConnect _proDioConnect;

  Future<bool> getUser(UserModel user) async {
    try {
      final response = await _proDioConnect.post(
        url: UrlsApp.urlApiNodeVercel,
        ep: '/user/login',
        data: user.toPost,
      );

      if (response != null && response['token'] != 0) {
        FlavorConfig.instance.variables["token"] = response["token"];
        print('o token: ${FlavorConfig.instance.variables["token"]}');

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
