class Empresa {
  final int? id;
  final String nombre;
  final String logo;
  final String descripcion;
  final int rutaId;

  Empresa({
    this.id,
    required this.nombre,
    required this.logo,
    required this.descripcion,
    required this.rutaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'logo': logo,
      'descripcion': descripcion,
      'rutaId': rutaId,
    };
  }

  factory Empresa.fromMap(Map<String, dynamic> map) {
    return Empresa(
      id: map['id'],
      nombre: map['nombre'],
      logo: map['logo'],
      descripcion: map['descripcion'],
      rutaId: map['rutaId'],
    );
  }
}