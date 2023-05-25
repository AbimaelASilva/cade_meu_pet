import 'package:flutter_flavor/flutter_flavor.dart';

import '../../models/models.dart';
import '../urls_app.dart';

import '../../../connect/connect.dart';

class UserProviders {
  UserProviders(this._proDioConnect);
  final ProDioConnect _proDioConnect;

  Future<bool> registerUser(UserModel user) async {
    try {
      print(user.toPost);
      final response = await _proDioConnect.post(
        url: UrlsApp.urlApiNodeVercel,
        ep: '/user/cadastro/${user.email}/${user.senha}',
      );

      if (response != null && response['id_usuario'] != 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
