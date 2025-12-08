import 'package:json_annotation/json_annotation.dart';

part 'pokemon_species_evol_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonSpeciesEvolModel {
  String? url;

  PokemonSpeciesEvolModel({this.url});

  factory PokemonSpeciesEvolModel.fromJson(json) => _$PokemonSpeciesEvolModelFromJson(json);

  toJson() => _$PokemonSpeciesEvolModelToJson(this);

}