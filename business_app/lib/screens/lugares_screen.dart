import 'package:flutter/material.dart';

class LugaresScreen extends StatelessWidget {
  const LugaresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de lugares de ejemplo
    final List<Map<String, String>> lugares = [
      {'nombre': 'Lugar 1', 'imagen': 'assets/placeholder.png'},
      {'nombre': 'Lugar 2', 'imagen': 'assets/placeholder.png'},
      {'nombre': 'Lugar 3', 'imagen': 'assets/placeholder.png'},
      {'nombre': 'Lugar 4', 'imagen': 'assets/placeholder.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: lugares.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            child: InkWell(
              onTap: () {
                // Navegar a la pantalla de detalle de lugar
                Navigator.pushNamed(context, '/lugar_detalle');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagen placeholder
                  Expanded(
                    child: Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.place, size: 40, color: Colors.grey),
                      ),
                    ),
                  ),
                  // Nombre del lugar
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      lugares[index]['nombre']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}