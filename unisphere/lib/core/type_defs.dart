import 'package:fpdart/fpdart.dart';
import 'package:unisphere/core/providers/failure.dart';

typedef FutureEither<T> = Future<Either<Failure,T>>;

typedef FutureVoid = FutureEither<void>;