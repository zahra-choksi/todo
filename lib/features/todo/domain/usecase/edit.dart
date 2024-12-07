import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/failure.dart';
import 'package:todo/core/utils/usecase.dart';
import 'package:todo/features/todo/domain/repository/todo_repository.dart';

import '../entity/todo.dart';

class EditTodoUseCase implements UseCase<Todo,Params<Todo>> {
  final TodoRepository repository;
  EditTodoUseCase(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params<Todo> params) async {
    return await repository.edit(params.data);
  }
}