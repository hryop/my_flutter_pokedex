// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpeciesModel _$PokemonSpeciesModelFromJson(Map<String, dynamic> json) =>
    PokemonSpeciesModel(
      evolution_chain: json['evolution_chain'] == null
          ? null
          : PokemonSpeciesEvolModel.fromJson(json['evolution_chain']),
    );

Map<String, dynamic> _$PokemonSpeciesModelToJson(
  PokemonSpeciesModel instance,
) => <String, dynamic>{'evolution_chain': instance.evolution_chain};
