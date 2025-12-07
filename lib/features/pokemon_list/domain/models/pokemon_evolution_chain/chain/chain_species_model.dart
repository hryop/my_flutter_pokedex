import 'package:json_annotation/json_annotation.dart';

part 'chain_species_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChainSpeciesModel {
  String? name;
  String? url;

  ChainSpeciesModel({this.name, this.url});

  factory ChainSpeciesModel.fromJson(json) => _$ChainSpeciesModelFromJson(json);

  toJson() => _$ChainSpeciesModelToJson(this);
}
