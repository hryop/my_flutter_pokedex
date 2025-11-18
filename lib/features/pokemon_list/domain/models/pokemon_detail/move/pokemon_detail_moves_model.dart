import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/move/pokemon_detail_move_model.dart';

part 'pokemon_detail_moves_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetailMovesModel{
  PokemonDetailMoveModel? move;

  PokemonDetailMovesModel({this.move});

  factory PokemonDetailMovesModel.fromJson(json) =>
      _$PokemonDetailMovesModelFromJson(json);

  toJson() => _$PokemonDetailMovesModelToJson(this);

  static List<PokemonDetailMovesModel> fromJsonList(List? json) {
    return json?.map((e) => PokemonDetailMovesModel.fromJson(e)).toList() ?? [];
  }

}