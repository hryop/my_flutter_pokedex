import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_move_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetailMoveModel{
  String? name;
  String? url;

  PokemonDetailMoveModel({this.name, this.url});

  factory PokemonDetailMoveModel.fromJson(json) =>
      _$PokemonDetailMoveModelFromJson(json);

  toJson() => _$PokemonDetailMoveModelToJson(this);

  static List<PokemonDetailMoveModel> fromJsonList(List? json) {
    return json?.map((e) => PokemonDetailMoveModel.fromJson(e)).toList() ?? [];
  }

}