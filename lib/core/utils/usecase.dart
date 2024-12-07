import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/failure.dart';

abstract class UseCase<Type,Params> {
  Future<Either<Failure,Type>> call(Params params);
}

class NoParams{
  NoParams();
}

class Params<T>{
  final T data;
  Params(this.data);
}