import 'package:dartz/dartz.dart';
import 'package:my_flutter_pokedex/core/network/error/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}