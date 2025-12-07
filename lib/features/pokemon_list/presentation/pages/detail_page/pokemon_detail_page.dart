import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_pokedex/core/utils/constant/network_constant.dart';
import 'package:my_flutter_pokedex/core/utils/injections.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/type/pokemon_detail_types_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/pokemon_evol_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_detail_usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_evol_chain_usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/bloc/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/pages/detail_page/detail_tab/detail_about.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/pages/detail_page/detail_tab/detail_base_stats.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/pages/detail_page/detail_tab/detail_evolution.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/pages/detail_page/detail_tab/detail_moves.dart';
import 'package:my_flutter_pokedex/shared/presentation/app_loader.dart';
import 'package:my_flutter_pokedex/shared/presentation/cached_image_widget.dart';
import 'package:my_flutter_pokedex/shared/presentation/reload_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  final String pokemonId;

  const PokemonDetailPage({Key? key, required String this.pokemonId})
    : super(key: key);

  @override
  State<StatefulWidget> createState() => _PokemonDetailPage();
}

class _PokemonDetailPage extends State<PokemonDetailPage>
    with SingleTickerProviderStateMixin {
  final PokemonDetailBloc _bloc = PokemonDetailBloc(
    pokemonDetailUsecase: sl<PokemonDetailUsecase>(),
    pokemonEvolChainUsecase: sl<PokemonEvolChainUsecase>(),
  );

  PokemonDetailModel pokemonDetailModel = PokemonDetailModel();
  PokemonEvolModel pokemonEvolModel = PokemonEvolModel();

  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _tabController = TabController(length: 4, vsync: this);
    // _tabController.addListener(() {
    //   setState(() {});
    // });
    _tabController.addListener(_smoothScrollToTop);

    callPokemonDetail();
    callPokemonEvolChain();
    super.initState();
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
          title: Text("Pokemon Detail Page"),
        ),
        body: BlocConsumer<PokemonDetailBloc, PokemonDetailState>(
          bloc: _bloc,
          listener: (BuildContext context, PokemonDetailState state) {
            if (state is SuccessGetPokemonDetailState) {
              pokemonDetailModel = PokemonDetailModel();
              pokemonDetailModel = state.pokemonDetailModel;
            }

            if (state is SuccessGetPokemonEvolChainState) {
              pokemonEvolModel = PokemonEvolModel();
              pokemonEvolModel = state.pokemonEvolModel;
            }
          },
          builder: (BuildContext context, PokemonDetailState state) {
            if (state is LoadingGetPokemonDetailState) {
              return const AppLoader();
            } else if (state is ErrorGetPokemonDetailState) {
              return ReloadWidget.error(
                content: state.errorMsg,
                onPressed: () {
                  callPokemonDetail();
                  callPokemonEvolChain();
                },
              );
            }

            if (pokemonDetailModel.name == null ||
                pokemonDetailModel.name == "") {
              return ReloadWidget.empty(content: "No Data");
            }

            return pageBody();
          },
        ),
      ),
    );
  }

  Widget pageBody() {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(child: topBody()),
          SliverToBoxAdapter(
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "About"),
                Tab(text: "Base Stats"),
                Tab(text: "Evolution"),
                Tab(text: "Moves"),
              ],
            ),
          ),
        ];
      },
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: [
            DetailAbout(
              height: pokemonDetailModel.height,
              weight: pokemonDetailModel.weight,
              abilities: pokemonDetailModel.abilities ?? [],
            ),
            DetailBaseStats(stats: pokemonDetailModel.stats ?? []),
            DetailEvolution(evolChain: pokemonEvolModel,),
            DetailMoves(moves: pokemonDetailModel.moves ?? []),
          ],
        ),
      ),
    );
  }

  String getPokemonNumber() {
    int pokemonId = pokemonDetailModel.id ?? 0;

    if (pokemonId < 100) return "#" + pokemonId.toString().padLeft(3, '0');

    return "#" + pokemonId.toString();
  }

  Widget topBody() {
    return Container(
      color: Colors.lightGreenAccent,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(getPokemonNumber()),
          Text(
            (pokemonDetailModel.name ?? "").replaceFirst(
              (pokemonDetailModel.name ?? "")[0],
              (pokemonDetailModel.name ?? "")[0].toUpperCase(),
            ),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          Text(getPokemonTypeString(pokemonDetailModel.types)),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: CachedImageWidget(
              imageUrl: getPokemonArtworkPath(pokemonDetailModel.id.toString()),
              width: 200,
            ),
          ),
        ],
      ),
    );
  }

  callPokemonDetail({bool withLoading = true}) {
    _bloc.add(
      OnGettingPokemonDetailEvent(withLoading: withLoading, name: widget.pokemonId),
    );
  }

  callPokemonEvolChain({bool withLoading = true}) {
    _bloc.add(
      OnGettingPokemonEvolChainEvent(withLoading: withLoading, pokemonId: widget.pokemonId),
    );
  }

  String getPokemonTypeString(List<PokemonDetailTypesModel>? types) {
    if (types == null || types.isEmpty) return "";

    List<String> typesNewString = [];

    for (var type in types) {
      String just_type = (type.type?.name) ?? "";
      if (just_type.isNotEmpty) {
        typesNewString.add(just_type);
      }
    }

    return typesNewString.join(", ");
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }
}
