import 'package:dio/dio.dart';
import 'package:my_flutter_pokedex/core/network/error/dio_error_handler.dart';
import 'package:my_flutter_pokedex/core/network/error/exceptions.dart';
import 'package:my_flutter_pokedex/core/utils/constant/network_constant.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/data/data_sources/remote/abstract_pokemon_list_api.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/domain/models/pokemon_list/pokemon_list_model.dart';

class PokemonListImplApi extends AbstractPokemonListApi {
  final Dio dio;

  PokemonListImplApi(this.dio);

  @override
  Future<PokemonDetailModel> getPokemonDetail(String name) async{
    try {
      final result = (await dio.get(getPokemonDetailPath(name)));

      if (result.data == null)
        throw ServerException("Unknown Error", result.statusCode);

      return PokemonDetailModel.fromJson(result.data);
    } on DioException catch (e) {
      if (e.response != null && e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  @override
  Future<PokemonListModel> getPokemonListFirstPage() async {
    return getPokemonList(getPokemonListPath(0));
  }

  @override
  Future<PokemonListModel> getPokemonListNextPage(String nextPageUrl) {
    return getPokemonList(nextPageUrl);
  }

  Future<PokemonListModel> getPokemonList(String url) async {
    try {
      final result = (await dio.get(url));

      if (result.data == null)
        throw ServerException("Unknown Error", result.statusCode);

      return PokemonListModel.fromJson(result.data);
    } on DioException catch (e) {
      if (e.response != null && e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
