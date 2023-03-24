class UserModel {
  String email;
  String senha;
  int id;
  UserModel({
    required this.email,
    required this.senha,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'senha': senha});
    result.addAll({'id': id});

    return result;
  }

  Map<String, dynamic> get toPost => {'email': email, 'senha': senha};

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }
  factory UserModel.empty() {
    return UserModel(
      email: '',
      senha: '',
      id: 0,
    );
  }
}
