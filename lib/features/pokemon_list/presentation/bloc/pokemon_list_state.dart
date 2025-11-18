part of 'pokemon_list_bloc.dart';

abstract class PokemonListState {
  const PokemonListState();
}

class PokemonListInitial extends PokemonListState{}

class LoadingGetPokemonListFirstPageState extends PokemonListState{}

class ErrorGetPokemonListFirstPageState extends PokemonListState{
  final String errorMsg;
  ErrorGetPokemonListFirstPageState(this.errorMsg);
}

class SuccessGetPokemonListFirstPageState extends PokemonListState {
  final PokemonListModel pokemonListModel;
  SuccessGetPokemonListFirstPageState(this.pokemonListModel);
}

class LoadingGetPokemonListNextPageState extends PokemonListState{}

class ErrorGetPokemonListNextPageState extends PokemonListState{
  final String errorMsg;
  ErrorGetPokemonListNextPageState(this.errorMsg);
}

class SuccessGetPokemonListNextPageState extends PokemonListState {
  final PokemonListModel pokemonListModel;
  SuccessGetPokemonListNextPageState(this.pokemonListModel);
}