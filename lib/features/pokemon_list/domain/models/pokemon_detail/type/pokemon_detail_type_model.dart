import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetailTypeModel{
  String? name;
  String? url;

  PokemonDetailTypeModel({this.name, this.url});

  factory PokemonDetailTypeModel.fromJson(json) =>
      _$PokemonDetailTypeModelFromJson(json);

  toJson() => _$PokemonDetailTypeModelToJson(this);

  static List<PokemonDetailTypeModel> fromJsonList(List? json) {
    return json?.map((e) => PokemonDetailTypeModel.fromJson(e)).toList() ?? [];
  }

}