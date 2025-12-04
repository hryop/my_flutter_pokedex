import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_item_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_list_nextpage_usecase.dart';
import 'package:my_flutter_pokedex/shared/presentation/app_loader.dart';
import 'package:my_flutter_pokedex/shared/presentation/reload_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_flutter_pokedex/core/utils/injections.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_list_firstpage_usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/bloc/pokemon_list/pokemon_list_bloc.dart';
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

  List<PokemonListItemModel> results = [];
  String nextPage = "";

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
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("My FLutter Pokedex"),
        ),
        body: BlocConsumer<PokemonListBloc, PokemonListState>(
          bloc: _bloc,
          listener: (BuildContext context, PokemonListState state) {
            if (state is SuccessGetPokemonListFirstPageState) {
              PokemonListModel pokemonListModel = state.pokemonListModel;
              results = pokemonListModel.results ?? [];
              nextPage = pokemonListModel.next ?? "";
              _refreshController.refreshCompleted(resetFooterState: true);
            }

            if (state is SuccessGetPokemonListNextPageState) {
              PokemonListModel pokemonListNextPageModel = state.pokemonListModel;
              results.addAll(pokemonListNextPageModel.results as Iterable<PokemonListItemModel>);
              nextPage = pokemonListNextPageModel.next ?? "";
              _refreshController.loadComplete();
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

            if (results.isEmpty) {
              return ReloadWidget.empty(content: "No Data");
            }

            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: _onRefresh,
              onLoading: _onLoadMore,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: results.length,
                itemBuilder: (BuildContext context, int index) {
                  return PokemonGridItemWidget(
                    index: index,
                    item: results[index],
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

  void _onLoadMore() async {
    if(nextPage == "") return;

    _refreshController.requestLoading();
    callPokemonListNextPage(
        nextPage,
        withLoading: false);
  }


}
