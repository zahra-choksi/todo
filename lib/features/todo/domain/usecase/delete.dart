import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/failure.dart';
import 'package:todo/core/utils/usecase.dart';
import 'package:todo/features/todo/domain/repository/todo_repository.dart';

import '../entity/todo.dart';

class DeleteTodoUseCase implements UseCase<Todo,Params<Todo>> {
  final TodoRepository repository;
  DeleteTodoUseCase(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params<Todo> params) async {
    return await repository.delete(params.data);
  }
}