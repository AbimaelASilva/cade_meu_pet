import 'package:cade_meu_pet/app/models/models.dart';
import 'package:cade_meu_pet/config_app.dart';

import '../../../connect/connect.dart';

class PetProviders {
  PetProviders(this._proDioConnect);
  final ProDioConnect _proDioConnect;

  Future<List<PetModel>> getLostPets() async {
    try {
      final response = await _proDioConnect.get(
        url: ConfigApp.urlServer,
        ep: '/pet',
      );

      return <Map<String, dynamic>>[...response ?? []]
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
        url: ConfigApp.urlServer,
        ep: '/pet',
        data: pet.toPostMap,
      );
    } catch (e) {
      rethrow;
    }
  }
}
