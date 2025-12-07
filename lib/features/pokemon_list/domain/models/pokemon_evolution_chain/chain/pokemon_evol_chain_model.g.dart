// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_evol_chain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonEvolChainModel _$PokemonEvolChainModelFromJson(
  Map<String, dynamic> json,
) => PokemonEvolChainModel(
  evolves_to: (json['evolves_to'] as List<dynamic>?)
      ?.map(PokemonEvolChainModel.fromJson)
      .toList(),
  is_baby: json['is_baby'] as bool?,
  species: json['species'] == null
      ? null
      : ChainSpeciesModel.fromJson(json['species']),
);

Map<String, dynamic> _$PokemonEvolChainModelToJson(
  PokemonEvolChainModel instance,
) => <String, dynamic>{
  'evolves_to': instance.evolves_to,
  'is_baby': instance.is_baby,
  'species': instance.species,
};
