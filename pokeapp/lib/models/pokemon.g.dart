// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  height: (json['height'] as num).toInt(),
  weight: (json['weight'] as num).toInt(),
  types: (json['types'] as List<dynamic>)
      .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
      .toList(),
  stats: (json['stats'] as List<dynamic>)
      .map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  abilities: (json['abilities'] as List<dynamic>)
      .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
      .toList(),
  sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'height': instance.height,
  'weight': instance.weight,
  'types': instance.types,
  'stats': instance.stats,
  'abilities': instance.abilities,
  'sprites': instance.sprites,
};

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
  slot: (json['slot'] as num).toInt(),
  type: TypeInfo.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{'slot': instance.slot, 'type': instance.type};

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) =>
    TypeInfo(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$TypeInfoToJson(TypeInfo instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
  baseStat: (json['base_stat'] as num).toInt(),
  effort: (json['effort'] as num).toInt(),
  stat: StatInfo.fromJson(json['stat'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

StatInfo _$StatInfoFromJson(Map<String, dynamic> json) =>
    StatInfo(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$StatInfoToJson(StatInfo instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      ability: AbilityInfo.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
      slot: (json['slot'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

AbilityInfo _$AbilityInfoFromJson(Map<String, dynamic> json) =>
    AbilityInfo(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$AbilityInfoToJson(AbilityInfo instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) =>
    PokemonSprites(
      frontDefault: json['front_default'] as String?,
      backDefault: json['back_default'] as String?,
    );

Map<String, dynamic> _$PokemonSpritesToJson(PokemonSprites instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'back_default': instance.backDefault,
    };
