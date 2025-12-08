import 'package:dartz/dartz.dart';
import 'package:my_flutter_pokedex/core/network/error/exceptions.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/data/data_sources/remote/pokemon_list_impl_api.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/chain/pokemon_evol_chain_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/pokemon_evol_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_species/pokemon_species_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/repositories/abstract_pokemon_list_repo.dart';

class PokemonListRepoImpl extends AbstractPokemonListRepo{

  final PokemonListImplApi pokemonListApi;

  PokemonListRepoImpl(this.pokemonListApi);

  @override
  Future<Either<Failure, PokemonDetailModel>> getPokemonDetail(String name) async{
    try {
      final reponse = await pokemonListApi.getPokemonDetail(name);
      return Right(reponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, PokemonEvolModel>> getPokemonEvolChain(String evolChainUrl) async{
    try {
      final reponse = await pokemonListApi.getPokemonEvolChain(evolChainUrl);
      return Right(reponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, PokemonListModel>> getPokemonListFirstPage() async{
    try {
      final reponse = await pokemonListApi.getPokemonListFirstPage();
      return Right(reponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, PokemonListModel>> getPokemonListNextPage(String nextPageUrl) async{
    try {
      final reponse = await pokemonListApi.getPokemonListNextPage(nextPageUrl);
      return Right(reponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, PokemonSpeciesModel>> getPokemonSpecies(String pokemonId) async{
    try {
      final reponse = await pokemonListApi.getPokemonSpecies(pokemonId);
      return Right(reponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

}