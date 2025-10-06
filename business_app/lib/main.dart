import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/foundation.dart';
import 'screens/inicio_screen.dart';
import 'screens/rutas_screen.dart';
import 'screens/empresas_screen.dart';
import 'screens/lugares_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registro_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/empresa_detalle_screen.dart';
import 'screens/lugar_detalle_screen.dart';
import 'screens/agregar_empresa_screen.dart';
import 'screens/cambiar_contrasena_screen.dart';

void main() {
  // Inicializar sqflite_ffi para Windows/Linux/macOS
  if (!kIsWeb) {
    // Inicializar FFI
    sqfliteFfiInit();
    // Cambiar la factory por defecto
    databaseFactory = databaseFactoryFfi;
  }
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BusinessApp());
}

class BusinessApp extends StatelessWidget {
  const BusinessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusinessApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const InicioScreen(),
        '/rutas': (context) => const RutasScreen(),
        '/empresas': (context) => const EmpresasScreen(),
        '/lugares': (context) => const LugaresScreen(),
        '/login': (context) => const LoginScreen(),
        '/registro': (context) => const RegistroScreen(),
        '/admin': (context) => const AdminScreen(),
        '/empresa_detalle': (context) => const EmpresaDetalleScreen(),
        '/lugar_detalle': (context) => const LugarDetalleScreen(),
        '/agregar_empresa': (context) => const AgregarEmpresaScreen(),
        '/cambiar_contrasena': (context) => const CambiarContrasenaScreen(),
        '/inicio': (context) => const InicioScreen(),
      },
    );
  }
}
