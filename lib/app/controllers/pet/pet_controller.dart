import 'dart:io';

import 'package:cade_meu_pet/app/models/models.dart';
import 'package:cade_meu_pet/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../providers/providers.dart';

class PetController extends GetxController {
  PetController(this._providers);

  final PetProviders _providers;

  final _lostPetsList = <PetModel>[].obs;

  final _pet = PetModel.empty().obs;

  List<PetModel> get lostPetsList => _lostPetsList;

  final _imagesList = <File>[].obs;

  PetModel get pet => _pet.value;

  List<File> get imagesList => _imagesList.value;

  @override
  void onInit() {
    super.onInit();
    getLostPets();
  }

  void setName(String value) {
    _pet.update((val) {
      val!.nome = value;
    });
  }

  void setCharacteristics(String value) {
    _pet.update((val) {
      val!.caracteristicas = value;
    });
  }

  void setBreed(String value) {
    _pet.update((val) {
      val!.raca = value;
    });
  }

  void setLastSee(String value) {
    _pet.update((val) {
      val!.ultimaVezVisto = value;
    });
  }

  void setSelectedPet(PetModel pet) {
    _pet.value = pet;
  }

  Future<void> getLostPets() async {
    try {
      _lostPetsList.value = await _providers.getLostPets();
    } catch (e) {}
  }

  Future<void> registerPet() async {
    try {
      return await _providers.registerPet(_pet.value);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getImage() async {
    File image = await Get.toNamed(Routes.imageCrop);
    _imagesList.add(image);
  }
}
