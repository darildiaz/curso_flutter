import 'package:flutter/material.dart';
import '../models/pokemon.dart';

/// Widget que representa una tarjeta individual de Pokémon
/// Muestra información básica del Pokémon en formato de tarjeta para la cuadrícula
class PokemonCard extends StatelessWidget {
  /// Pokémon que se mostrará en la tarjeta
  final Pokemon pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  /// Obtiene el color correspondiente a un tipo de Pokémon
  /// Utiliza la misma lógica que en la pantalla de detalles para consistencia
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
    return Card(
      elevation: 4, // Sombra sutil para dar profundidad
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Esquinas redondeadas
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // Gradiente basado en el tipo primario del Pokémon
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // Color del tipo primario con transparencia
              pokemon.types.isNotEmpty 
                ? _getTypeColor(pokemon.types[0].type.name).withOpacity(0.3)
                : Colors.grey.withOpacity(0.3),
              Colors.white, // Fondo blanco
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Número de Pokédex (formato: #001, #002, etc.)
              Text(
                '#${pokemon.id.toString().padLeft(3, '0')}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8),
              
              // Imagen del Pokémon (si está disponible)
              if (pokemon.sprites.frontDefault != null)
                Expanded(
                  child: Image.network(
                    pokemon.sprites.frontDefault!,
                    fit: BoxFit.contain, // Mantener proporciones
                    errorBuilder: (context, error, stackTrace) {
                      // Mostrar ícono de error si la imagen no se puede cargar
                      return Icon(
                        Icons.image_not_supported,
                        size: 60,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              SizedBox(height: 8),
              
              // Nombre del Pokémon en mayúsculas
              Text(
                pokemon.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1, // Una sola línea
                overflow: TextOverflow.ellipsis, // Puntos suspensivos si es muy largo
              ),
              SizedBox(height: 8),
              
              // Chips de tipos del Pokémon (máximo 2 para no sobrecargar la tarjeta)
              Wrap(
                spacing: 4, // Espaciado entre chips
                children: pokemon.types.take(2).map((type) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: _getTypeColor(type.type.name), // Color según el tipo
                      borderRadius: BorderRadius.circular(12), // Esquinas redondeadas
                    ),
                    child: Text(
                      type.type.name.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

