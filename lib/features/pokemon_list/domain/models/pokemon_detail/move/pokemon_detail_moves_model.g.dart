// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_moves_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailMovesModel _$PokemonDetailMovesModelFromJson(
  Map<String, dynamic> json,
) => PokemonDetailMovesModel(
  move: json['move'] == null
      ? null
      : PokemonDetailMoveModel.fromJson(json['move']),
);

Map<String, dynamic> _$PokemonDetailMovesModelToJson(
  PokemonDetailMovesModel instance,
) => <String, dynamic>{'move': instance.move};
