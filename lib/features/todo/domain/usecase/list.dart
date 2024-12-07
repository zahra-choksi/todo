import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/failure.dart';
import 'package:todo/core/utils/usecase.dart';
import 'package:todo/features/todo/domain/repository/todo_repository.dart';

import '../entity/todo.dart';

class ListTodoUseCase implements UseCase<Stream<List<Todo>>,NoParams> {
  final TodoRepository repository;
  ListTodoUseCase(this.repository);

  @override
  Future<Either<Failure, Stream<List<Todo>>>> call(NoParams params) {
    return repository.getAll();
  }
}