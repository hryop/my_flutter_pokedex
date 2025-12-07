import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/pokemon_evol_model.dart';

import '../../../domain/models/pokemon_detail/pokemon_detail_model.dart';
import '../../../domain/models/pokemon_list/pokemon_list_model.dart';

abstract class AbstractPokemonListApi {
  Future<PokemonListModel> getPokemonListFirstPage();
  Future<PokemonListModel> getPokemonListNextPage(String nextPageUrl);
  Future<PokemonDetailModel> getPokemonDetail(String name);
  Future<PokemonEvolModel> getPokemonEvolChain(String id);

}