class Ruta {
  final int? id;
  final String nombre;
  final String imagen;

  Ruta({
    this.id,
    required this.nombre,
    required this.imagen,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'imagen': imagen,
    };
  }

  factory Ruta.fromMap(Map<String, dynamic> map) {
    return Ruta(
      id: map['id'],
      nombre: map['nombre'],
      imagen: map['imagen'],
    );
  }
}