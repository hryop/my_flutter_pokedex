import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/type/pokemon_detail_type_model.dart';

part 'pokemon_detail_types_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetailTypesModel{
  String? slot;
  PokemonDetailTypeModel? type;

  PokemonDetailTypesModel({this.slot, this.type});

  factory PokemonDetailTypesModel.fromJson(json) =>
      _$PokemonDetailTypesModelFromJson(json);

  toJson() => _$PokemonDetailTypesModelToJson(this);

  static List<PokemonDetailTypesModel> fromJsonList(List? json) {
    return json?.map((e) => PokemonDetailTypesModel.fromJson(e)).toList() ?? [];
  }

}