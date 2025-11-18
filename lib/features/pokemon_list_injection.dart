import 'package:my_flutter_pokedex/core/network/dio_network.dart';
import 'package:my_flutter_pokedex/core/utils/injections.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/data/data_sources/remote/pokemon_list_impl_api.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/data/repositories/pokemon_list_repo_impl.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/repositories/abstract_pokemon_list_repo.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_list_firstpage_usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_list_nextpage_usecase.dart';

initPokemonListInjections(){
  sl.registerSingleton<PokemonListImplApi>(PokemonListImplApi(DioNetwork.appAPI));
  sl.registerSingleton<AbstractPokemonListRepo>(PokemonListRepoImpl(sl()));
  sl.registerSingleton<PokemonListFirstPageUsecase>(PokemonListFirstPageUsecase(sl()));
  sl.registerSingleton<PokemonListNextPageUsecase>(PokemonListNextPageUsecase(sl()));
}