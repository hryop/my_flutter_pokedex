// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_abilities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailAbilitiesModel _$PokemonDetailAbilitiesModelFromJson(
  Map<String, dynamic> json,
) => PokemonDetailAbilitiesModel(
  move: json['move'] == null
      ? null
      : PokemonDetailMoveModel.fromJson(json['move']),
);

Map<String, dynamic> _$PokemonDetailAbilitiesModelToJson(
  PokemonDetailAbilitiesModel instance,
) => <String, dynamic>{'move': instance.move};
