import 'package:dartz/dartz.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/core/utils/usecase/usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/repositories/abstract_pokemon_list_repo.dart';

class PokemonDetailUsecase extends UseCase<PokemonDetailModel, String> {

  final AbstractPokemonListRepo repo;
  PokemonDetailUsecase(this.repo);

  @override
  Future<Either<Failure, PokemonDetailModel>> call(String param) async{
    final result = await repo.getPokemonDetail(param);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }

}