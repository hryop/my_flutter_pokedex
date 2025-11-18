// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailModel _$PokemonDetailModelFromJson(Map<String, dynamic> json) =>
    PokemonDetailModel(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      types: (json['types'] as List<dynamic>?)
          ?.map(PokemonDetailTypesModel.fromJson)
          .toList(),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map(PokemonDetailAbilitiesModel.fromJson)
          .toList(),
      moves: (json['moves'] as List<dynamic>?)
          ?.map(PokemonDetailMovesModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailModelToJson(PokemonDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'weight': instance.weight,
      'height': instance.height,
      'types': instance.types,
      'abilities': instance.abilities,
      'moves': instance.moves,
    };
