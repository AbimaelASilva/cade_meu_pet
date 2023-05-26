import 'dart:io';

class PetModel {
  int id;
  String nome;
  String raca;
  String caracteristicas;
  String ultimaVezVisto;
  List<File> images;
  PetModel({
    required this.id,
    required this.nome,
    required this.raca,
    required this.caracteristicas,
    required this.ultimaVezVisto,
    required this.images,
  });

  Map<String, dynamic> get toMap {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nome': nome});
    result.addAll({'raca': raca});
    result.addAll({'crt': caracteristicas});
    result.addAll({'visto': ultimaVezVisto});

    return result;
  }

  Map<String, dynamic> get toPostMap {
    final result = <String, dynamic>{};

    result.addAll({'nome': nome});
    result.addAll({'raca': raca});
    result.addAll({'crt': caracteristicas});
    result.addAll({'visto': ultimaVezVisto});

    return result;
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      raca: map['raca'] ?? '',
      caracteristicas: map['crt'] ?? '',
      ultimaVezVisto: map['visto'] ?? '',
      images: map['img'] != null ? [File(map['img'])] : [],
    );
  }
  factory PetModel.empty() {
    return PetModel(
      id: 0,
      nome: '',
      raca: '',
      caracteristicas: '',
      ultimaVezVisto: '',
      images: [],
    );
  }
}
