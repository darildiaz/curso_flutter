class Lugar {
  final int? id;
  final String nombre;
  final String imagen;
  final String descripcion;
  final int empresaId;

  Lugar({
    this.id,
    required this.nombre,
    required this.imagen,
    required this.descripcion,
    required this.empresaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'imagen': imagen,
      'descripcion': descripcion,
      'empresaId': empresaId,
    };
  }

  factory Lugar.fromMap(Map<String, dynamic> map) {
    return Lugar(
      id: map['id'],
      nombre: map['nombre'],
      imagen: map['imagen'],
      descripcion: map['descripcion'],
      empresaId: map['empresaId'],
    );
  }
}