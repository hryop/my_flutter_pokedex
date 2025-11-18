import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_ability_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetaiAbilityModel{
  String? name;
  String? url;

  PokemonDetaiAbilityModel({this.name, this.url});

  factory PokemonDetaiAbilityModel.fromJson(json) =>
      _$PokemonDetaiAbilityModelFromJson(json);

  toJson() => _$PokemonDetaiAbilityModelToJson(this);

  static List<PokemonDetaiAbilityModel> fromJsonList(List? json) {
    return json?.map((e) => PokemonDetaiAbilityModel.fromJson(e)).toList() ?? [];
  }

}