import '../../../connect/connect.dart';

class HomeProviders {
  HomeProviders(this._proDioConnect);
  final ProDioConnect _proDioConnect;

  Future<void> fetchData() async {
    try {} catch (e) {
      print('Error BannersProviders / fetchBanners: $e');
    }
  }
}
