import 'package:flutter/material.dart';
import '../models/pokemon.dart';

/// Pantalla que muestra los detalles completos de un Pokémon específico
/// Incluye imagen, tipos, estadísticas, habilidades y información básica
class PokemonDetailScreen extends StatelessWidget {
  /// Pokémon del cual se mostrarán los detalles
  final Pokemon pokemon;

  const PokemonDetailScreen({Key? key, required this.pokemon}) : super(key: key);

  /// Obtiene el color correspondiente a un tipo de Pokémon
  /// Cada tipo tiene un color característico para mejor identificación visual
  /// 
  /// [type] - Nombre del tipo de Pokémon (ej: "fire", "water", "grass")
  /// 
  /// Retorna un Color que representa visualmente el tipo
  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.yellow;
      case 'psychic':
        return Colors.pink;
      case 'ice':
        return Colors.lightBlue;
      case 'dragon':
        return Colors.indigo;
      case 'dark':
        return Colors.black87;
      case 'fairy':
        return Colors.pinkAccent;
      case 'normal':
        return Colors.grey;
      case 'fighting':
        return Colors.brown;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orange;
      case 'flying':
        return Colors.lightBlue;
      case 'bug':
        return Colors.lightGreen;
      case 'rock':
        return Colors.brown;
      case 'ghost':
        return Colors.deepPurple;
      case 'steel':
        return Colors.blueGrey;
      default:
        return Colors.grey; // Color por defecto para tipos no reconocidos
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el nombre del Pokémon
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
        backgroundColor: Colors.red, // Color temático de Pokémon
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección principal con imagen y nombre del Pokémon
            Center(
              child: Column(
                children: [
                  // Imagen del Pokémon (si está disponible)
                  if (pokemon.sprites.frontDefault != null)
                    Image.network(
                      pokemon.sprites.frontDefault!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  SizedBox(height: 16),
                  
                  // Número de Pokédex (formato: #001, #002, etc.)
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  
                  // Nombre del Pokémon en mayúsculas
                  Text(
                    pokemon.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            
            // Sección de tipos del Pokémon
            Text(
              'Tipos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8, // Espaciado entre chips
              children: pokemon.types.map((type) {
                return Chip(
                  label: Text(
                    type.type.name.toUpperCase(),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: _getTypeColor(type.type.name), // Color según el tipo
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            
            // Sección de información básica (altura y peso)
            Text(
              'Información básica',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Altura (convertida de decímetros a metros)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Altura:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('${pokemon.height / 10} m'), // Conversión: decímetros → metros
                      ],
                    ),
                    Divider(),
                    // Peso (convertido de hectogramos a kilogramos)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Peso:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('${pokemon.weight / 10} kg'), // Conversión: hectogramos → kilogramos
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            
            // Sección de estadísticas base del Pokémon
            Text(
              'Estadísticas base',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: pokemon.stats.map((stat) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          // Nombre de la estadística
                          Expanded(
                            flex: 2,
                            child: Text(
                              stat.stat.name.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Valor numérico de la estadística
                          Expanded(
                            flex: 1,
                            child: Text(
                              stat.baseStat.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // Barra de progreso visual
                          Expanded(
                            flex: 3,
                            child: LinearProgressIndicator(
                              value: stat.baseStat / 255, // Normalizar a 0-1 (máximo 255)
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                // Color de la barra según el valor
                                stat.baseStat > 100 ? Colors.green : // Verde para valores altos
                                stat.baseStat > 50 ? Colors.orange : // Naranja para valores medios
                                Colors.red, // Rojo para valores bajos
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 24),
            
            // Sección de habilidades del Pokémon
            Text(
              'Habilidades',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: pokemon.abilities.map((ability) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          // Nombre de la habilidad
                          Expanded(
                            child: Text(
                              ability.ability.name.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Indicador si la habilidad es oculta
                          if (ability.isHidden)
                            Chip(
                              label: Text(
                                'OCULTA',
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                              backgroundColor: Colors.purple, // Color distintivo para habilidades ocultas
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

