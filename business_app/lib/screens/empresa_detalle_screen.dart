import 'package:flutter/material.dart';

class EmpresaDetalleScreen extends StatelessWidget {
  const EmpresaDetalleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de lugares asociados a la empresa
    final List<Map<String, String>> lugares = [
      {'nombre': 'Sucursal Centro', 'imagen': 'assets/placeholder.png'},
      {'nombre': 'Sucursal Norte', 'imagen': 'assets/placeholder.png'},
      {'nombre': 'Oficina Principal', 'imagen': 'assets/placeholder.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Empresa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo de la empresa
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.business, size: 60, color: Colors.grey),
                ),
              ),
            ),
            
            // Descripción de la empresa
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Descripción de la Empresa',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ),
            
            // Lugares asociados
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
              child: Text(
                'Lugares Asociados',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Lista de lugares
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lugares.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/lugar_detalle');
                    },
                    child: Row(
                      children: [
                        // Imagen placeholder
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[300],
                          child: const Icon(Icons.place, color: Colors.grey),
                        ),
                        const SizedBox(width: 16.0),
                        // Nombre del lugar
                        Text(
                          lugares[index]['nombre']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}