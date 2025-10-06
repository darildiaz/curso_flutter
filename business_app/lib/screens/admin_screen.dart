import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de usuarios de ejemplo
    final List<Map<String, String>> usuarios = [
      {'nombre': 'Juan Pérez', 'usuario': 'juan@email.com', 'clave': '******'},
      {'nombre': 'María López', 'usuario': 'maria@email.com', 'clave': '******'},
      {'nombre': 'Carlos Ruiz', 'usuario': 'carlos@email.com', 'clave': '******'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administración'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            usuarios[index]['nombre']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(usuarios[index]['usuario']!),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(usuarios[index]['clave']!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/agregar_empresa');
              },
              icon: const Icon(Icons.add_business),
              label: const Text('Agregar Empresa'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}