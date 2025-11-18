import 'package:bloc/bloc.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_list_firstpage_usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_list_nextpage_usecase.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState>{
  final PokemonListFirstPageUsecase pokemonListFirstPageUsecase;
  final PokemonListNextPageUsecase pokemonListNextPageUsecase;

  PokemonListModel pokemonListModel = PokemonListModel();

  PokemonListBloc({required this.pokemonListFirstPageUsecase, required this.pokemonListNextPageUsecase}) : super(LoadingGetPokemonListFirstPageState()){
    on<OnGettingPokemonListFirstPageEvent>(_onGettingPokemonListFirstPageEvent);
    on<OnGettingPokemonListNextPageEvent>(_onGettingPokemonListNextPageEvent);
  }

  _onGettingPokemonListFirstPageEvent(OnGettingPokemonListFirstPageEvent event, Emitter<PokemonListState> emitter) async{
    if(event.withLoading){
      emitter(LoadingGetPokemonListFirstPageState());
    }

    final result = await pokemonListFirstPageUsecase.call("");
    result.fold(
        (left){
          if(left is CancelTokenFailure){
            emitter(LoadingGetPokemonListFirstPageState());
          }else{
            emitter(ErrorGetPokemonListFirstPageState(left.errorMessage));
          }
        },
        (right){
          pokemonListModel = right;
          emitter(SuccessGetPokemonListFirstPageState(pokemonListModel));
        });
  }

  _onGettingPokemonListNextPageEvent(OnGettingPokemonListNextPageEvent event, Emitter<PokemonListState> emitter) async{
    if(event.withLoading){
      emitter(LoadingGetPokemonListNextPageState());
    }

    final result = await pokemonListNextPageUsecase.call(event.nextPageUrl);
    result.fold(
        (left){
          if(left is CancelTokenFailure){
            emitter(LoadingGetPokemonListNextPageState());
          }else{
            emitter(ErrorGetPokemonListNextPageState(left.errorMessage));
          }
        },
        (right){
          pokemonListModel = right;
          emitter(SuccessGetPokemonListNextPageState(pokemonListModel));
        });
  }
}