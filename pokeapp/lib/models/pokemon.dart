import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

/// Modelo principal que representa un Pokémon
/// Contiene toda la información básica de un Pokémon obtenida de la API
@JsonSerializable()
class Pokemon {
  /// ID único del Pokémon en la Pokédex Nacional
  final int id;
  
  /// Nombre del Pokémon
  final String name;
  
  /// Altura del Pokémon en decímetros (1 decímetro = 10 cm)
  final int height;
  
  /// Peso del Pokémon en hectogramos (1 hectogramo = 100 gramos)
  final int weight;
  
  /// Lista de tipos del Pokémon (ej: Fuego, Agua, Planta)
  final List<PokemonType> types;
  
  /// Lista de estadísticas base del Pokémon (HP, Ataque, Defensa, etc.)
  final List<PokemonStat> stats;
  
  /// Lista de habilidades que puede tener el Pokémon
  final List<PokemonAbility> abilities;
  
  /// Imágenes/sprites del Pokémon (frontal, trasera, etc.)
  final PokemonSprites sprites;

  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.sprites,
  });

  /// Constructor para crear un Pokémon desde JSON (deserialización)
  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
  
  /// Método para convertir un Pokémon a JSON (serialización)
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

/// Modelo que representa un tipo de Pokémon
/// Cada Pokémon puede tener uno o dos tipos
@JsonSerializable()
class PokemonType {
  /// Posición del tipo (1 para tipo primario, 2 para secundario)
  final int slot;
  
  /// Información detallada del tipo
  final TypeInfo type;

  PokemonType({
    required this.slot,
    required this.type,
  });

  /// Constructor para crear un tipo desde JSON
  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
  
  /// Método para convertir un tipo a JSON
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

/// Información detallada de un tipo de Pokémon
@JsonSerializable()
class TypeInfo {
  /// Nombre del tipo (ej: "fire", "water", "grass")
  final String name;
  
  /// URL de la API para obtener más información del tipo
  final String url;

  TypeInfo({
    required this.name,
    required this.url,
  });

  /// Constructor para crear información de tipo desde JSON
  factory TypeInfo.fromJson(Map<String, dynamic> json) => _$TypeInfoFromJson(json);
  
  /// Método para convertir información de tipo a JSON
  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);
}

/// Modelo que representa una estadística de un Pokémon
/// Cada Pokémon tiene 6 estadísticas base: HP, Ataque, Defensa, Ataque Especial, Defensa Especial, Velocidad
@JsonSerializable()
class PokemonStat {
  /// Valor base de la estadística (0-255)
  @JsonKey(name: 'base_stat')
  final int baseStat;
  
  /// Puntos de esfuerzo (EV) que el Pokémon gana al derrotar a este Pokémon
  final int effort;
  
  /// Información detallada de la estadística
  final StatInfo stat;

  PokemonStat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  /// Constructor para crear una estadística desde JSON
  factory PokemonStat.fromJson(Map<String, dynamic> json) => _$PokemonStatFromJson(json);
  
  /// Método para convertir una estadística a JSON
  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}

/// Información detallada de una estadística de Pokémon
@JsonSerializable()
class StatInfo {
  /// Nombre de la estadística (ej: "hp", "attack", "defense")
  final String name;
  
  /// URL de la API para obtener más información de la estadística
  final String url;

  StatInfo({
    required this.name,
    required this.url,
  });

  /// Constructor para crear información de estadística desde JSON
  factory StatInfo.fromJson(Map<String, dynamic> json) => _$StatInfoFromJson(json);
  
  /// Método para convertir información de estadística a JSON
  Map<String, dynamic> toJson() => _$StatInfoToJson(this);
}

/// Modelo que representa una habilidad de un Pokémon
/// Cada Pokémon puede tener hasta 3 habilidades (2 normales + 1 oculta)
@JsonSerializable()
class PokemonAbility {
  /// Información detallada de la habilidad
  final AbilityInfo ability;
  
  /// Indica si la habilidad es oculta (solo disponible en ciertas condiciones)
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  
  /// Posición de la habilidad (1, 2, o 3)
  final int slot;

  PokemonAbility({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  /// Constructor para crear una habilidad desde JSON
  factory PokemonAbility.fromJson(Map<String, dynamic> json) => _$PokemonAbilityFromJson(json);
  
  /// Método para convertir una habilidad a JSON
  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}

/// Información detallada de una habilidad de Pokémon
@JsonSerializable()
class AbilityInfo {
  /// Nombre de la habilidad (ej: "blaze", "overgrow")
  final String name;
  
  /// URL de la API para obtener más información de la habilidad
  final String url;

  AbilityInfo({
    required this.name,
    required this.url,
  });

  /// Constructor para crear información de habilidad desde JSON
  factory AbilityInfo.fromJson(Map<String, dynamic> json) => _$AbilityInfoFromJson(json);
  
  /// Método para convertir información de habilidad a JSON
  Map<String, dynamic> toJson() => _$AbilityInfoToJson(this);
}

/// Modelo que representa las imágenes/sprites de un Pokémon
/// Contiene URLs de las diferentes imágenes del Pokémon
@JsonSerializable()
class PokemonSprites {
  /// URL de la imagen frontal por defecto del Pokémon
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  
  /// URL de la imagen trasera por defecto del Pokémon
  @JsonKey(name: 'back_default')
  final String? backDefault;

  PokemonSprites({
    this.frontDefault,
    this.backDefault,
  });

  /// Constructor para crear sprites desde JSON
  factory PokemonSprites.fromJson(Map<String, dynamic> json) => _$PokemonSpritesFromJson(json);
  
  /// Método para convertir sprites a JSON
  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}


