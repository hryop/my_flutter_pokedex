// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListModel _$PokemonListModelFromJson(Map<String, dynamic> json) =>
    PokemonListModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map(PokemonListItemModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$PokemonListModelToJson(PokemonListModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
