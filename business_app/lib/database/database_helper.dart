import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../models/ruta_model.dart';
import '../models/empresa_model.dart';
import '../models/lugar_model.dart';
import '../models/usuario_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'business_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    // Tabla Rutas
    await db.execute('''
      CREATE TABLE rutas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        imagen TEXT
      )
    ''');

    // Tabla Empresas
    await db.execute('''
      CREATE TABLE empresas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        logo TEXT,
        descripcion TEXT,
        rutaId INTEGER,
        FOREIGN KEY (rutaId) REFERENCES rutas (id)
      )
    ''');

    // Tabla Lugares
    await db.execute('''
      CREATE TABLE lugares(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        imagen TEXT,
        descripcion TEXT,
        empresaId INTEGER,
        FOREIGN KEY (empresaId) REFERENCES empresas (id)
      )
    ''');

    // Tabla Usuarios
    await db.execute('''
      CREATE TABLE usuarios(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        password TEXT,
        primerInicio INTEGER DEFAULT 1
      )
    ''');

    // Insertar datos de ejemplo
    _insertSampleData(db);
  }

  Future<void> _insertSampleData(Database db) async {
    // Insertar rutas de ejemplo
    await db.insert('rutas', {'nombre': 'Ruta del Café', 'imagen': 'assets/images/ruta_cafe.jpg'});
    await db.insert('rutas', {'nombre': 'Ruta Gastronómica', 'imagen': 'assets/images/ruta_gastronomica.jpg'});
    await db.insert('rutas', {'nombre': 'Ruta Artesanal', 'imagen': 'assets/images/ruta_artesanal.jpg'});

    // Insertar empresas de ejemplo
    await db.insert('empresas', {
      'nombre': 'Café Colombiano',
      'logo': 'assets/images/cafe_colombiano.jpg',
      'descripcion': 'Empresa dedicada a la producción de café de alta calidad.',
      'rutaId': 1
    });
    await db.insert('empresas', {
      'nombre': 'Restaurante El Sabor',
      'logo': 'assets/images/restaurante.jpg',
      'descripcion': 'Restaurante con los mejores platos típicos de la región.',
      'rutaId': 2
    });
    await db.insert('empresas', {
      'nombre': 'Artesanías Típicas',
      'logo': 'assets/images/artesanias.jpg',
      'descripcion': 'Tienda de artesanías tradicionales hechas a mano.',
      'rutaId': 3
    });

    // Insertar lugares de ejemplo
    await db.insert('lugares', {
      'nombre': 'Finca Cafetera',
      'imagen': 'assets/images/finca.jpg',
      'descripcion': 'Finca donde se cultiva el mejor café de la región.',
      'empresaId': 1
    });
    await db.insert('lugares', {
      'nombre': 'Cocina Tradicional',
      'imagen': 'assets/images/cocina.jpg',
      'descripcion': 'Espacio donde se preparan los platos típicos.',
      'empresaId': 2
    });
    await db.insert('lugares', {
      'nombre': 'Taller Artesanal',
      'imagen': 'assets/images/taller.jpg',
      'descripcion': 'Taller donde se elaboran artesanías tradicionales.',
      'empresaId': 3
    });

    // Insertar usuario admin predefinido
    String passwordHash = _hashPassword('admin');
    await db.insert('usuarios', {
      'username': 'admin',
      'password': passwordHash,
      'primerInicio': 1
    });
  }

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  // CRUD para Rutas
  Future<List<Ruta>> getRutas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('rutas');
    return List.generate(maps.length, (i) => Ruta.fromMap(maps[i]));
  }

  Future<Ruta> insertRuta(Ruta ruta) async {
    final db = await database;
    final id = await db.insert('rutas', ruta.toMap());
    return Ruta(id: id, nombre: ruta.nombre, imagen: ruta.imagen);
  }

  Future<int> updateRuta(Ruta ruta) async {
    final db = await database;
    return await db.update(
      'rutas',
      ruta.toMap(),
      where: 'id = ?',
      whereArgs: [ruta.id],
    );
  }

  Future<int> deleteRuta(int id) async {
    final db = await database;
    return await db.delete(
      'rutas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD para Empresas
  Future<List<Empresa>> getEmpresas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('empresas');
    return List.generate(maps.length, (i) => Empresa.fromMap(maps[i]));
  }

  Future<List<Empresa>> getEmpresasByRuta(int rutaId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'empresas',
      where: 'rutaId = ?',
      whereArgs: [rutaId],
    );
    return List.generate(maps.length, (i) => Empresa.fromMap(maps[i]));
  }

  Future<Empresa> insertEmpresa(Empresa empresa) async {
    final db = await database;
    final id = await db.insert('empresas', empresa.toMap());
    return Empresa(
      id: id,
      nombre: empresa.nombre,
      logo: empresa.logo,
      descripcion: empresa.descripcion,
      rutaId: empresa.rutaId,
    );
  }

  Future<int> updateEmpresa(Empresa empresa) async {
    final db = await database;
    return await db.update(
      'empresas',
      empresa.toMap(),
      where: 'id = ?',
      whereArgs: [empresa.id],
    );
  }

  Future<int> deleteEmpresa(int id) async {
    final db = await database;
    return await db.delete(
      'empresas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD para Lugares
  
  // CRUD para Usuarios
  Future<Usuario?> getUsuarioByUsername(String username) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'usuarios',
      where: 'username = ?',
      whereArgs: [username],
    );
    
    if (maps.isEmpty) {
      return null;
    }
    return Usuario.fromMap(maps.first);
  }
  
  Future<bool> verificarCredenciales(String username, String password) async {
    final db = await database;
    String passwordHash = _hashPassword(password);
    
    final List<Map<String, dynamic>> maps = await db.query(
      'usuarios',
      where: 'username = ? AND password = ?',
      whereArgs: [username, passwordHash],
    );
    
    return maps.isNotEmpty;
  }
  
  Future<bool> esPrimerInicio(String username) async {
    final usuario = await getUsuarioByUsername(username);
    return usuario?.primerInicio ?? false;
  }
  
  Future<int> cambiarContrasena(String username, String nuevaContrasena) async {
    final db = await database;
    String passwordHash = _hashPassword(nuevaContrasena);
    
    return await db.update(
      'usuarios',
      {
        'password': passwordHash,
        'primerInicio': 0,
      },
      where: 'username = ?',
      whereArgs: [username],
    );
  }
  
  Future<List<Lugar>> getLugares() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('lugares');
    return List.generate(maps.length, (i) => Lugar.fromMap(maps[i]));
  }

  Future<List<Lugar>> getLugaresByEmpresa(int empresaId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'lugares',
      where: 'empresaId = ?',
      whereArgs: [empresaId],
    );
    return List.generate(maps.length, (i) => Lugar.fromMap(maps[i]));
  }

  Future<Lugar> insertLugar(Lugar lugar) async {
    final db = await database;
    final id = await db.insert('lugares', lugar.toMap());
    return Lugar(
      id: id,
      nombre: lugar.nombre,
      imagen: lugar.imagen,
      descripcion: lugar.descripcion,
      empresaId: lugar.empresaId,
    );
  }

  Future<int> updateLugar(Lugar lugar) async {
    final db = await database;
    return await db.update(
      'lugares',
      lugar.toMap(),
      where: 'id = ?',
      whereArgs: [lugar.id],
    );
  }

  Future<int> deleteLugar(int id) async {
    final db = await database;
    return await db.delete(
      'lugares',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}