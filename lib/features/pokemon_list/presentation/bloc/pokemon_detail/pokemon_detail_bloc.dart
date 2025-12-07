import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_evolution_chain/pokemon_evol_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_detail_usecase.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/usecase/pokemon_evol_chain_usecase.dart';

part 'pokemon_detail_event.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonDetailUsecase pokemonDetailUsecase;
  final PokemonEvolChainUsecase pokemonEvolChainUsecase;

  PokemonDetailModel pokemonDetailModel = PokemonDetailModel();
  PokemonEvolModel pokemonEvolModel = PokemonEvolModel();

  PokemonDetailBloc({
    required this.pokemonDetailUsecase,
    required this.pokemonEvolChainUsecase,
  }) : super(LoadingGetPokemonDetailState()) {
    on<OnGettingPokemonDetailEvent>(_onGettingPokemonDetailEvent);
    on<OnGettingPokemonEvolChainEvent>(_OnGettingPokemonEvolChainEvent);
  }

  _onGettingPokemonDetailEvent(
    OnGettingPokemonDetailEvent event,
    Emitter<PokemonDetailState> emitter,
  ) async {
    if (event.withLoading) {
      emitter(LoadingGetPokemonDetailState());
    }

    final result = await pokemonDetailUsecase.call(event.name);
    result.fold(
      (left) {
        if (left is CancelTokenFailure) {
          emitter(LoadingGetPokemonDetailState());
        } else {
          emitter(ErrorGetPokemonDetailState(left.errorMessage));
        }
      },
      (right) {
        pokemonDetailModel = right;
        emitter(SuccessGetPokemonDetailState(pokemonDetailModel));
      },
    );
  }

  _OnGettingPokemonEvolChainEvent(
      OnGettingPokemonEvolChainEvent event,
    Emitter<PokemonDetailState> emitter,
  ) async {
    if (event.withLoading) {
      emitter(LoadingGetPokemonEvolChainState());
    }

    final result = await pokemonEvolChainUsecase.call(event.pokemonId);
    result.fold(
      (left) {
        if (left is CancelTokenFailure) {
          emitter(LoadingGetPokemonEvolChainState());
        } else {
          emitter(ErrorGetPokemonEvolChainState(left.errorMessage));
        }
      },
      (right) {
        pokemonEvolModel = right;
        emitter(SuccessGetPokemonEvolChainState(pokemonEvolModel));
      },
    );
  }
}
