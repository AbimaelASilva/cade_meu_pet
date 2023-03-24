import 'dart:convert';

import 'package:cade_meu_pet/app/models/models.dart';
import 'package:cade_meu_pet/config_app.dart';

import '../../../connect/connect.dart';

class UserProviders {
  UserProviders(this._proDioConnect);
  final ProDioConnect _proDioConnect;

  Future<bool> registerUser(UserModel user) async {
    try {
      final response = await _proDioConnect.post(
        url: ConfigApp.urlServer,
        ep: '/login',
        data: user.toPost,
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
