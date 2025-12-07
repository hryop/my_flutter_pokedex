import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/chain/chain_species_model.dart';

part 'pokemon_evol_chain_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonEvolChainModel {
  List<PokemonEvolChainModel>? evolves_to;
  bool? is_baby;
  ChainSpeciesModel? species;

  PokemonEvolChainModel({this.evolves_to, this.is_baby, this.species});


  factory PokemonEvolChainModel.fromJson(json) =>
      _$PokemonEvolChainModelFromJson(json);

  toJson() => _$PokemonEvolChainModelToJson(this);

  static List<PokemonEvolChainModel> fromJsonList(List? json) {
    return json?.map((e) => PokemonEvolChainModel.fromJson(e)).toList() ?? [];
  }

}
