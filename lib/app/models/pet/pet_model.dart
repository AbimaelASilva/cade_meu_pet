class PetModel {
  final String nome;
  final String raca;
  final String caracteristicas;
  final String ultimaVezVisto;
  final int id;
  PetModel({
    required this.nome,
    required this.raca,
    required this.caracteristicas,
    required this.ultimaVezVisto,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nome': nome});
    result.addAll({'raca': raca});
    result.addAll({'caracteristicas': caracteristicas});
    result.addAll({'ultimaVezVisto': ultimaVezVisto});
    result.addAll({'id': id});

    return result;
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      nome: map['nome'] ?? '',
      raca: map['raca'] ?? '',
      caracteristicas: map['caracteristicas'] ?? '',
      ultimaVezVisto: map['ultimaVezVisto'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }
  factory PetModel.empty() {
    return PetModel(
      nome: '',
      raca: '',
      caracteristicas: '',
      ultimaVezVisto: '',
      id: 0,
    );
  }
}
