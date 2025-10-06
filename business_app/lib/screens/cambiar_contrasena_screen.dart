import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class CambiarContrasenaScreen extends StatefulWidget {
  const CambiarContrasenaScreen({super.key});

  @override
  State<CambiarContrasenaScreen> createState() => _CambiarContrasenaScreenState();
}

class _CambiarContrasenaScreenState extends State<CambiarContrasenaScreen> {
  final _nuevaContrasenaController = TextEditingController();
  final _confirmarContrasenaController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  bool _isLoading = false;
  String _errorMessage = '';
  String _username = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey('username')) {
      _username = args['username'] as String;
    }
  }

  @override
  void dispose() {
    _nuevaContrasenaController.dispose();
    _confirmarContrasenaController.dispose();
    super.dispose();
  }

  Future<void> _cambiarContrasena() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final nuevaContrasena = _nuevaContrasenaController.text.trim();
      final confirmarContrasena = _confirmarContrasenaController.text.trim();

      if (nuevaContrasena.isEmpty || confirmarContrasena.isEmpty) {
        setState(() {
          _errorMessage = 'Por favor, complete todos los campos';
          _isLoading = false;
        });
        return;
      }

      if (nuevaContrasena != confirmarContrasena) {
        setState(() {
          _errorMessage = 'Las contraseñas no coinciden';
          _isLoading = false;
        });
        return;
      }

      if (nuevaContrasena.length < 6) {
        setState(() {
          _errorMessage = 'La contraseña debe tener al menos 6 caracteres';
          _isLoading = false;
        });
        return;
      }

      await _databaseHelper.cambiarContrasena(_username, nuevaContrasena);

      if (!mounted) return;
      
      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contraseña cambiada con éxito'),
          backgroundColor: Colors.green,
        ),
      );

      // Redirigir a la pantalla de inicio
      Navigator.pushReplacementNamed(context, '/inicio');
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al cambiar la contraseña: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Contraseña'),
        automaticallyImplyLeading: false, // Deshabilitar botón de retroceso
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Es necesario cambiar su contraseña por seguridad',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _nuevaContrasenaController,
              decoration: const InputDecoration(
                labelText: 'Nueva Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmarContrasenaController,
              decoration: const InputDecoration(
                labelText: 'Confirmar Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
              obscureText: true,
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading ? null : _cambiarContrasena,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Cambiar Contraseña', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}