class Usuario {
  final int? id;
  final String username;
  final String password;
  final bool primerInicio;

  Usuario({
    this.id,
    required this.username,
    required this.password,
    this.primerInicio = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'primerInicio': primerInicio ? 1 : 0,
    };
  }

  static Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      username: map['username'],
      password: map['password'],
      primerInicio: map['primerInicio'] == 1,
    );
  }
}