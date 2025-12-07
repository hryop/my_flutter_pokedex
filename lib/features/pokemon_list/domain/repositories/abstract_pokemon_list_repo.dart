import 'package:dartz/dartz.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/pokemon_evol_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';

abstract class AbstractPokemonListRepo {
  Future<Either<Failure, PokemonListModel>> getPokemonListFirstPage();
  Future<Either<Failure, PokemonListModel>> getPokemonListNextPage(String nextPageUrl);
  Future<Either<Failure, PokemonDetailModel>> getPokemonDetail(String name);
  Future<Either<Failure, PokemonEvolModel>> getPokemonEvolChain(String pokemonId);
}