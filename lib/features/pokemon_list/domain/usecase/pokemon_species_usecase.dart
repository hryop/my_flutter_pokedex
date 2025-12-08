import 'package:dartz/dartz.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/core/utils/usecase/usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/pokemon_evol_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_species/pokemon_species_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/repositories/abstract_pokemon_list_repo.dart';

class PokemonSpeciesUsecase extends UseCase<PokemonSpeciesModel, String> {

  final AbstractPokemonListRepo repo;
  PokemonSpeciesUsecase(this.repo);

  @override
  Future<Either<Failure, PokemonSpeciesModel>> call(String pokemonId) async{
    final result = await repo.getPokemonSpecies(pokemonId);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }

}