// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_evol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonEvolModel _$PokemonEvolModelFromJson(Map<String, dynamic> json) =>
    PokemonEvolModel(
      chain: json['chain'] == null
          ? null
          : PokemonEvolChainModel.fromJson(json['chain']),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PokemonEvolModelToJson(PokemonEvolModel instance) =>
    <String, dynamic>{'chain': instance.chain, 'id': instance.id};
