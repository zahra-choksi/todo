import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/failure.dart';
import 'package:todo/features/todo/domain/entity/todo.dart';

abstract class TodoRepository {

  Future<Either<Failure,Todo>> add(Todo todo);

  Future<Either<Failure,Todo>> edit(Todo todo);

  Future<Either<Failure,Todo>> delete(Todo todo);

  Future<Either<Failure,Stream<List<Todo>>>> getAll();
}