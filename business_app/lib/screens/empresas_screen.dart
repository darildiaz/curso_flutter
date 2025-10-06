import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/empresa_model.dart';

class EmpresasScreen extends StatefulWidget {
  const EmpresasScreen({super.key});

  @override
  State<EmpresasScreen> createState() => _EmpresasScreenState();
}

class _EmpresasScreenState extends State<EmpresasScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late Future<List<Empresa>> _empresasFuture;
  int? _rutaId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtener el ID de la ruta de los argumentos
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    _rutaId = arguments?['rutaId'];
    
    // Cargar empresas según la ruta seleccionada o todas si no hay ruta
    if (_rutaId != null) {
      _empresasFuture = _databaseHelper.getEmpresasByRuta(_rutaId!);
    } else {
      _empresasFuture = _databaseHelper.getEmpresas();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas'),
      ),
      body: FutureBuilder<List<Empresa>>(
        future: _empresasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay empresas disponibles'));
          }

          final empresas = snapshot.data!;
          
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: empresas.length,
            itemBuilder: (context, index) {
              final empresa = empresas[index];
              return Card(
                elevation: 3.0,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: InkWell(
                  onTap: () {
                    // Navegar a la pantalla de detalle de empresa
                    Navigator.pushNamed(
                      context, 
                      '/empresa_detalle',
                      arguments: {'empresaId': empresa.id},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Logo de la empresa
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: empresa.logo.startsWith('assets/')
                              ? const Icon(Icons.business, color: Colors.grey)
                              : ClipOval(
                                  child: Image.network(
                                    empresa.logo,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.business, color: Colors.grey);
                                    },
                                  ),
                                ),
                        ),
                        const SizedBox(width: 16.0),
                        // Nombre de la empresa
                        Expanded(
                          child: Text(
                            empresa.nombre,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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