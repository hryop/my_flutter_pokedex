import 'package:json_annotation/json_annotation.dart';

part 'pokemon_list_item_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonListItemModel{
  String? name;
  String? url;

  PokemonListItemModel({this.name, this.url});

  factory PokemonListItemModel.fromJson(json) =>
      _$PokemonListItemModelFromJson(json);

  toJson() => _$PokemonListItemModelToJson(this);

  static List<PokemonListItemModel> fromJsonList(List? json) {
    return json?.map((e) => PokemonListItemModel.fromJson(e)).toList() ?? [];
  }
}