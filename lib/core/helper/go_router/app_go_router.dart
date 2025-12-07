import 'package:go_router/go_router.dart';
import 'package:my_flutter_pokedex/core/helper/go_router/path_go_router.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/pages/detail_page/pokemon_detail_page.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/pages/pokemon_list_page.dart';

final GoRouter appGoRouter = GoRouter(routes: [
  GoRoute(path: home_page,
      builder: (context,state) => const PokemonListPage()),
  GoRoute(path: detail_page+"/:pokemonId",
      builder: (context,state) => PokemonDetailPage(pokemonId: state.pathParameters["pokemonId"]!,
      ))

]);