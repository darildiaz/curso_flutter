import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/ruta_model.dart';

class RutasScreen extends StatefulWidget {
  const RutasScreen({super.key});

  @override
  State<RutasScreen> createState() => _RutasScreenState();
}

class _RutasScreenState extends State<RutasScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late Future<List<Ruta>> _rutasFuture;

  @override
  void initState() {
    super.initState();
    _rutasFuture = _databaseHelper.getRutas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas Disponibles'),
      ),
      body: FutureBuilder<List<Ruta>>(
        future: _rutasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay rutas disponibles'));
          }

          final rutas = snapshot.data!;
          
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: rutas.length,
            itemBuilder: (context, index) {
              final ruta = rutas[index];
              return Card(
                elevation: 4.0,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: InkWell(
                  onTap: () {
                    // Navegar a la pantalla de empresas al seleccionar una ruta
                    // Pasamos el ID de la ruta seleccionada
                    Navigator.pushNamed(
                      context, 
                      '/empresas',
                      arguments: {'rutaId': ruta.id},
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Imagen de la ruta
                      Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: ruta.imagen.startsWith('assets/')
                            ? const Center(
                                child: Icon(Icons.image, size: 50, color: Colors.grey),
                              )
                            : Image.network(
                                ruta.imagen,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.error, size: 50, color: Colors.grey),
                                  );
                                },
                              ),
                      ),
                      // Nombre de la ruta
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          ruta.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}