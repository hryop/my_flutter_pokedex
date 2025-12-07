part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailState{
  const PokemonDetailState();
}

class PokemonDetailInitial extends PokemonDetailState{}

class LoadingGetPokemonDetailState extends PokemonDetailState{}

class ErrorGetPokemonDetailState extends PokemonDetailState{
  final String errorMsg;
  ErrorGetPokemonDetailState(this.errorMsg);
}

class SuccessGetPokemonDetailState extends PokemonDetailState {
  final PokemonDetailModel pokemonDetailModel;
  SuccessGetPokemonDetailState(this.pokemonDetailModel);
}

class LoadingGetPokemonEvolChainState extends PokemonDetailState{}

class ErrorGetPokemonEvolChainState extends PokemonDetailState{
  final String errorMsg;
  ErrorGetPokemonEvolChainState(this.errorMsg);
}

class SuccessGetPokemonEvolChainState extends PokemonDetailState {
  final PokemonEvolModel pokemonEvolModel;
  SuccessGetPokemonEvolChainState(this.pokemonEvolModel);
}
