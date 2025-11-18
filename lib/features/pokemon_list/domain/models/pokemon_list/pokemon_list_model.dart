import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_item_model.dart';

part 'pokemon_list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonListModel {
  int? count;
  String? next;
  String? previous;
  List<PokemonListItemModel>? results;

  PokemonListModel({this.count, this.next, this.previous, this.results});

  factory PokemonListModel.fromJson(json) =>
      _$PokemonListModelFromJson(json);

  toJson() => _$PokemonListModelToJson(this);
}
