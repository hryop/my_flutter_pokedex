import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_species/pokemon_species_evol_model.dart';

part 'pokemon_species_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonSpeciesModel {
  PokemonSpeciesEvolModel? evolution_chain;

  PokemonSpeciesModel({this.evolution_chain});

  factory PokemonSpeciesModel.fromJson(json) => _$PokemonSpeciesModelFromJson(json);

  toJson() => _$PokemonSpeciesModelToJson(this);

}