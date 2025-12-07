import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/chain/pokemon_evol_chain_model.dart';

part 'pokemon_evol_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonEvolModel {
  PokemonEvolChainModel? chain;
  int? id;

  PokemonEvolModel({this.chain, this.id});

  factory PokemonEvolModel.fromJson(json) => _$PokemonEvolModelFromJson(json);

  toJson() => _$PokemonEvolModelToJson(this);

}
