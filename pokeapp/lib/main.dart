import 'package:flutter/material.dart';
import 'screens/pokemon_list_screen.dart';

/// Punto de entrada principal de la aplicación
/// Inicializa y ejecuta la aplicación Flutter
void main() {
  runApp(MyApp());
}

/// Widget raíz de la aplicación
/// Configura el tema global y define la pantalla inicial
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación (se muestra en el switcher de aplicaciones)
      title: 'Pokédex',

      // Configuración del tema global de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue, // Color primario rojo (tema de Pokémon)
        visualDensity: VisualDensity
            .adaptivePlatformDensity, // Densidad adaptativa para diferentes plataformas
      ),

      // Pantalla inicial de la aplicación (lista de Pokémon)
      home: PokemonListScreen(),

      // Ocultar el banner de debug en la esquina superior derecha
      debugShowCheckedModeBanner: false,
    );
  }
}
