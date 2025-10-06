import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppTour - Administración'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Menú Administrativo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuCard(
                    context,
                    'Gestión de Rutas',
                    'Administrar rutas turísticas',
                    Icons.route,
                    '/rutas',
                  ),
                  _buildMenuCard(
                    context,
                    'Gestión de Empresas',
                    'Administrar empresas asociadas',
                    Icons.business,
                    '/empresas',
                  ),
                  _buildMenuCard(
                    context,
                    'Gestión de Lugares',
                    'Administrar lugares turísticos',
                    Icons.place,
                    '/lugares',
                  ),
                  _buildMenuCard(
                    context,
                    'Configuración',
                    'Ajustes del sistema',
                    Icons.settings,
                    '/admin',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildMenuCard(BuildContext context, String title, String subtitle, IconData icon, String route) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}