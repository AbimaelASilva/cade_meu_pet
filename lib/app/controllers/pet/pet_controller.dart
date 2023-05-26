import 'dart:io';
import 'package:cade_meu_pet/app/ui/components/pro_snack_bar.dart';
import 'package:get/get.dart';

import '../../models/models.dart';
import '../../../routes/app_routes.dart';
import '../../providers/providers.dart';

class PetController extends GetxController {
  PetController(
    this._providers,
  );

  final PetProviders _providers;

  final _lostPetsList = <PetModel>[].obs;

  final _pet = PetModel.empty().obs;

  List<PetModel> get lostPetsList => _lostPetsList;

  PetModel get pet => _pet.value;

  final _registeringPet = false.obs;

  bool get registeringPet => _registeringPet.value;

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
      _registeringPet.value = true;
      final response = await _providers.registerPet(
        _pet.value,
      );

      if (response) {
        Get.back();
        Get.toNamed(Routes.registerPetFinisched);
        proSnackBar(message: 'O Pet foi cadastrado com sucesso!');
      }
    } catch (e) {
      rethrow;
    } finally {
      _registeringPet.value = false;
    }
  }

  Future<void> getImage() async {
    File image = await Get.toNamed(Routes.imageCrop);

    _pet.update((val) {
      val!.images.add(image);
    });
  }
}
