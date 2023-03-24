import '../../../connect/connect.dart';

class LoginProviders {
  LoginProviders(this._proDioConnect);
  final ProDioConnect _proDioConnect;

  Future<void> getUser() async {
    try {
      final response =
          await _proDioConnect.get(url: 'http://localhost:8080', ep: '/login');
    } catch (e) {
      rethrow;
    }
  }
}
