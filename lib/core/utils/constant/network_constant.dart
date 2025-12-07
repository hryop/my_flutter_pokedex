const String BASE_URL = "https://pokeapi.co/api/v2/";
const int LIMIT_VALUE = 40;

String getPokemonListPath(int offset) {
  return "${BASE_URL}pokemon/?limit=${LIMIT_VALUE}&offset=$offset";
}

String getPokemonDetailPath(String name) {
  return "${BASE_URL}pokemon/$name";
}

String getPokemonIdFromUrl(String url) {
  List<String> raw = url.split('pokemon');
  String pokemonId = raw[1].replaceAll('/', '');
  return pokemonId;
}

String getPokemonArtworkPath(String pokemonId) {
  return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png";
}

String getPokemonEvolChainPath(String pokemonId){
  return "${BASE_URL}evolution-chain/$pokemonId";
}