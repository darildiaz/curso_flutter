import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/poke_api_service.dart';
import '../widgets/pokemon_card.dart';
import 'pokemon_detail_screen.dart';

/// Pantalla principal que muestra la lista de Pokémon en formato de cuadrícula
/// Permite cargar más Pokémon y navegar a los detalles de cada uno
class PokemonListScreen extends StatefulWidget {
  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  /// Servicio para obtener datos de la API de Pokémon
  final PokeApiService _apiService = PokeApiService();

  /// Lista de Pokémon cargados actualmente
  List<Pokemon> _pokemonList = [];

  /// Indica si se está cargando información de la API
  bool _isLoading = false;

  /// Número de Pokémon a omitir para la paginación
  int _offset = 0;

  /// Número de Pokémon a cargar por cada petición
  final int _limit = 20;

  @override
  void initState() {
    super.initState();
    // Cargar los primeros Pokémon al inicializar la pantalla
    _loadPokemon();
  }

  /// Carga una nueva lista de Pokémon desde la API
  /// Utiliza paginación para cargar Pokémon adicionales
  Future<void> _loadPokemon() async {
    // Mostrar indicador de carga
    setState(() {
      _isLoading = true;
    });

    try {
      // Obtener nuevos Pokémon desde la API
      final newPokemon = await _apiService.fetchPokemonList(
        offset: _offset,
        limit: _limit,
      );

      // Agregar los nuevos Pokémon a la lista existente
      setState(() {
        _pokemonList.addAll(newPokemon);
        _offset += _limit; // Actualizar el offset para la próxima carga
      });
    } catch (e) {
      // Mostrar error al usuario si la carga falla
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error loading Pokémon: $e')));
    } finally {
      // Ocultar indicador de carga
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el título de la aplicación
      appBar: AppBar(
        title: Text('Pokédex'),
        backgroundColor: Colors.blue, // Color temático de Pokémon
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Área principal con la cuadrícula de Pokémon
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              // Configuración de la cuadrícula: 2 columnas
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columnas
                childAspectRatio: 0.8, // Proporción de las tarjetas
                crossAxisSpacing: 8.0, // Espaciado horizontal
                mainAxisSpacing: 8.0, // Espaciado vertical
              ),
              itemCount: _pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = _pokemonList[index];

                // Cada Pokémon es un GestureDetector para detectar toques
                return GestureDetector(
                  onTap: () {
                    // Navegar a la pantalla de detalles del Pokémon
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailScreen(pokemon: pokemon),
                      ),
                    );
                  },
                  child: PokemonCard(pokemon: pokemon),
                );
              },
            ),
          ),

          // Indicador de carga cuando se están obteniendo datos
          if (_isLoading)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),

          // Botón para cargar más Pokémon (solo visible cuando no está cargando)
          if (!_isLoading)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _loadPokemon, // Cargar más Pokémon al presionar
                child: Text('Cargar más Pokémon'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Color temático
                  foregroundColor: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
