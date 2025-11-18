import 'package:dartz/dartz.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/core/utils/usecase/usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/repositories/abstract_pokemon_list_repo.dart';

class PokemonListFirstPageUsecase extends UseCase<PokemonListModel, String> {

  final AbstractPokemonListRepo repo;
  PokemonListFirstPageUsecase(this.repo);

  @override
  Future<Either<Failure, PokemonListModel>> call(String params) async{
    final result = await repo.getPokemonListFirstPage();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }

}