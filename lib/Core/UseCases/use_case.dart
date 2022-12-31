import 'package:dartz/dartz.dart';

import '../Errors/failure.dart';

/// UseCase interface to be used in creating use cases
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Empty Parameter Object used to pass no data
class NoParams {}