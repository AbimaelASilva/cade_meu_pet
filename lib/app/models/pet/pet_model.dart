class PetModel {
  String nome;
  String raca;
  String caracteristicas;
  String ultimaVezVisto;
  int id;
  PetModel({
    required this.nome,
    required this.raca,
    required this.caracteristicas,
    required this.ultimaVezVisto,
    required this.id,
  });

  Map<String, dynamic> get toMap {
    final result = <String, dynamic>{};

    result.addAll({'nome': nome});
    result.addAll({'raca': raca});
    result.addAll({'crt': caracteristicas});
    result.addAll({'visto': ultimaVezVisto});
    result.addAll({'id': id});

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
    );
  }
  factory PetModel.empty() {
    return PetModel(
      id: 0,
      nome: '',
      raca: '',
      caracteristicas: '',
      ultimaVezVisto: '',
    );
  }
}
