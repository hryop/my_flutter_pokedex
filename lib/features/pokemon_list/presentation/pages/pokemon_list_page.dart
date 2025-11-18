import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_item_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_list_nextpage_usecase.dart';
import 'package:my_flutter_pokedex/shared/presentation/app_loader.dart';
import 'package:my_flutter_pokedex/shared/presentation/releod_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_flutter_pokedex/core/utils/injections.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_list_firstpage_usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/widgets/pokemon_grid_item_widget.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PokemonListPage();
}

class _PokemonListPage extends State<PokemonListPage> {
  final PokemonListBloc _bloc = PokemonListBloc(
    pokemonListFirstPageUsecase: sl<PokemonListFirstPageUsecase>(),
    pokemonListNextPageUsecase: sl<PokemonListNextPageUsecase>(),
  );

  PokemonListModel pokemonListModel = PokemonListModel();
  List<PokemonListItemModel> results = [];

  GlobalKey<ScaffoldState> _key = GlobalKey();

  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    callPokemonList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My FLutter Pokedex"),
      ),
      body: BlocConsumer<PokemonListBloc, PokemonListState>(
        bloc: _bloc,
        listener: (BuildContext context, PokemonListState state) {
          if (state is SuccessGetPokemonListFirstPageState) {
            pokemonListModel = PokemonListModel();
            pokemonListModel = state.pokemonListModel;
            _refreshController.refreshCompleted(resetFooterState: true);
          }
        },
        builder: (BuildContext context, PokemonListState state) {
          if (state is LoadingGetPokemonListFirstPageState) {
            return const AppLoader();
          } else if (state is ErrorGetPokemonListFirstPageState) {
            return ReloadWidget.error(
              content: state.errorMsg,
              onPressed: () {
                callPokemonList();
              },
            );
          }

          if (pokemonListModel.results == null ||
              pokemonListModel.results!.isEmpty) {
            return ReloadWidget.empty(content: "No Data");
          }

          return SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: false,
            onLoading: null,
            onRefresh: _onRefresh,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: pokemonListModel.results?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return PokemonGridItemWidget(
                  index: index,
                  item: pokemonListModel.results?[index],
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _refreshController.position?.animateTo(
            0.0, // The desired scroll offset (0.0 for the top)
            duration: Duration(milliseconds: 300), // Animation duration
            curve: Curves.easeOut, // Animation curve
          );
        },
        tooltip: 'Back to Top',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  callPokemonList({bool withLoading = true}) {
    _bloc.add(OnGettingPokemonListFirstPageEvent(withLoading: withLoading));
  }

  callPokemonListNextPage(String nextPageUrl, {bool withLoading = true}) {
    _bloc.add(
      OnGettingPokemonListNextPageEvent(
        withLoading: withLoading,
        nextPageUrl: nextPageUrl,
      ),
    );
  }

  void _onRefresh() async {
    _refreshController.requestRefresh();
    callPokemonList(withLoading: false);
  }
}
