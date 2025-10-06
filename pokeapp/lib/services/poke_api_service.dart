import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

/// Servicio para interactuar con la API de Pokémon (PokeAPI)
/// Proporciona métodos para obtener listas de Pokémon y detalles específicos
class PokeApiService {
  /// URL base de la API de Pokémon
  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  /// Obtiene una lista de Pokémon con paginación
  /// 
  /// [offset] - Número de Pokémon a omitir (para paginación)
  /// [limit] - Número máximo de Pokémon a obtener (por defecto 20)
  /// 
  /// Retorna una lista de objetos Pokemon con información completa
  /// 
  /// Lanza una excepción si la petición falla
  Future<List<Pokemon>> fetchPokemonList({int offset = 0, int limit = 20}) async {
    // Construir la URL con parámetros de paginación
    final response = await http.get(Uri.parse('$_baseUrl/pokemon?offset=$offset&limit=$limit'));

    // Verificar si la respuesta fue exitosa
    if (response.statusCode == 200) {
      // Decodificar el JSON de respuesta
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      
      // Lista para almacenar los Pokémon completos
      List<Pokemon> pokemonList = [];
      
      // Iterar sobre cada resultado y obtener los detalles completos
      for (var item in results) {
        // Hacer una petición individual para obtener los detalles completos del Pokémon
        final pokemonResponse = await http.get(Uri.parse(item['url']));
        
        // Solo agregar si la petición fue exitosa
        if (pokemonResponse.statusCode == 200) {
          pokemonList.add(Pokemon.fromJson(json.decode(pokemonResponse.body)));
        }
      }
      
      return pokemonList;
    } else {
      // Lanzar excepción si la petición falló
      throw Exception('Failed to load pokemon list');
    }
  }

  /// Obtiene los detalles completos de un Pokémon específico por nombre
  /// 
  /// [name] - Nombre del Pokémon a buscar (ej: "pikachu", "charizard")
  /// 
  /// Retorna un objeto Pokemon con toda su información
  /// 
  /// Lanza una excepción si el Pokémon no se encuentra o la petición falla
  Future<Pokemon> fetchPokemonDetail(String name) async {
    // Construir la URL para obtener los detalles del Pokémon específico
    final response = await http.get(Uri.parse('$_baseUrl/pokemon/$name'));

    // Verificar si la respuesta fue exitosa
    if (response.statusCode == 200) {
      // Decodificar el JSON y crear el objeto Pokemon
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      // Lanzar excepción si el Pokémon no se encontró o la petición falló
      throw Exception('Failed to load pokemon $name');
    }
  }
}


