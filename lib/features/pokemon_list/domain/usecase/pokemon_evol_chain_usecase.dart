import 'package:dartz/dartz.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/core/utils/usecase/usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/pokemon_evol_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/repositories/abstract_pokemon_list_repo.dart';

class PokemonEvolChainUsecase extends UseCase<PokemonEvolModel, String> {

  final AbstractPokemonListRepo repo;
  PokemonEvolChainUsecase(this.repo);

  @override
  Future<Either<Failure, PokemonEvolModel>> call(String pokemonId) async{
    final result = await repo.getPokemonEvolChain(pokemonId);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }

}