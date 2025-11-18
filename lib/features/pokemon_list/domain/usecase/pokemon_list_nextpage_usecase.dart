import 'package:dartz/dartz.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/core/utils/usecase/usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/repositories/abstract_pokemon_list_repo.dart';

class PokemonListNextPageUsecase extends UseCase<PokemonListModel, String> {

  final AbstractPokemonListRepo repo;
  PokemonListNextPageUsecase(this.repo);

  @override
  Future<Either<Failure, PokemonListModel>> call(String params) async{
    final result = await repo.getPokemonListNextPage(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }

}