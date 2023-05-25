import 'package:cade_meu_pet/app/models/models.dart';
import 'package:cade_meu_pet/app/providers/urls_app.dart';

import '../../../connect/connect.dart';

class PetProviders {
  PetProviders(this._proDioConnect);
  final ProDioConnect _proDioConnect;

  Future<List<PetModel>> getLostPets() async {
    try {
      final response = await _proDioConnect.get(
        url: UrlsApp.urlApiNodeVercel,
        ep: '/pets',
      );

      return <Map<String, dynamic>>[...response['posts'] ?? []]
          .map(PetModel.fromMap)
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> registerPet(PetModel pet) async {
    try {
      print(pet.toPostMap);
      final response = await _proDioConnect.post(
        url: UrlsApp.urlApiNodeVercel,
        ep: '/pet',
        data: pet.toPostMap,
      );
    } catch (e) {
      rethrow;
    }
  }
}
