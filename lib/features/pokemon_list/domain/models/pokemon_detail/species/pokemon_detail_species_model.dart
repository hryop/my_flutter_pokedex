import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_species_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetailSpeciesModel{
  String? name;
  String? url;

  PokemonDetailSpeciesModel({this.name, this.url});

  factory PokemonDetailSpeciesModel.fromJson(json) =>
      _$PokemonDetailSpeciesModelFromJson(json);

  toJson() => _$PokemonDetailSpeciesModelToJson(this);

}