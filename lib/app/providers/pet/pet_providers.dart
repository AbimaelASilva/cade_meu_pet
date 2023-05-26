import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';
import '../urls_app.dart';

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

  Future<bool> registerPet(PetModel pet) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${UrlsApp.urlApiNodeVercel}/pets'));
      request.fields.addAll({
        "nome": pet.nome,
        "raca": pet.raca,
        "crt": pet.caracteristicas,
        "visto": pet.ultimaVezVisto,
        "adocao": '0',
        "token": FlavorConfig.instance.variables["token"]
      });
      request.files.add(await http.MultipartFile.fromPath(
          'img_animal', pet.images.first.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(
            'RESPOSTA DO CADASTRO DO ANIMAL: ${await response.stream.bytesToString()}');
        return true;
      } else {
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
