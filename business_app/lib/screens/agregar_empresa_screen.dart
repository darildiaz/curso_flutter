import 'package:flutter/material.dart';

class AgregarEmpresaScreen extends StatefulWidget {
  const AgregarEmpresaScreen({super.key});

  @override
  State<AgregarEmpresaScreen> createState() => _AgregarEmpresaScreenState();
}

class _AgregarEmpresaScreenState extends State<AgregarEmpresaScreen> {
  String? rutaSeleccionada;
  final List<String> rutas = ['Ruta A', 'Ruta B', 'Ruta C', 'Ruta D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Empresa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Razón social
            const TextField(
              decoration: InputDecoration(
                labelText: 'Razón Social',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            // Descripción
            const TextField(
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            
            // Dropdown de rutas
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Ruta',
                border: OutlineInputBorder(),
              ),
              value: rutaSeleccionada,
              items: rutas.map((String ruta) {
                return DropdownMenuItem<String>(
                  value: ruta,
                  child: Text(ruta),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  rutaSeleccionada = newValue;
                });
              },
            ),
            const SizedBox(height: 30),
            
            // Logo placeholder
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.business, size: 60, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para seleccionar logo
                    },
                    child: const Text('Seleccionar Logo'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Botón enviar
            ElevatedButton(
              onPressed: () {
                // Lógica para enviar formulario
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Enviar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}