// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailTypesModel _$PokemonDetailTypesModelFromJson(
  Map<String, dynamic> json,
) => PokemonDetailTypesModel(
  slot: json['slot'] as String?,
  type: json['type'] == null
      ? null
      : PokemonDetailTypeModel.fromJson(json['type']),
);

Map<String, dynamic> _$PokemonDetailTypesModelToJson(
  PokemonDetailTypesModel instance,
) => <String, dynamic>{'slot': instance.slot, 'type': instance.type};
