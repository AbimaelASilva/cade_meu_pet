import 'package:hasura_connect/hasura_connect.dart';

class LoginProviders {
  LoginProviders(this._proHasuraConnect);
  final HasuraConnect _proHasuraConnect;

  Future<void> fetchData() async {
    try {} catch (e) {
      print('Error BannersProviders / fetchBanners: $e');
    }
  }
}
