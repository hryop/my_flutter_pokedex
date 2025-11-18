part of 'pokemon_list_bloc.dart';

class PokemonListEvent {
  const PokemonListEvent();
}

class OnGettingPokemonListFirstPageEvent extends PokemonListEvent{
  final bool withLoading;
  OnGettingPokemonListFirstPageEvent({this.withLoading = true});
}

class OnGettingPokemonListNextPageEvent extends PokemonListEvent{
  final bool withLoading;
  final String nextPageUrl;
  OnGettingPokemonListNextPageEvent({this.withLoading = true, required this.nextPageUrl});
}