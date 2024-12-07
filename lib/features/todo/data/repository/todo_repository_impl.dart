import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/failure.dart';
import 'package:todo/features/todo/data/datasource/todo_remote_data_source.dart';
import 'package:todo/features/todo/domain/entity/todo.dart';
import 'package:todo/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataBase remoteDataBase;
  TodoRepositoryImpl({
    required this.remoteDataBase,
});

  @override
  Future<Either<Failure, Todo>> add(Todo todo) async {
    try{
      final result = await remoteDataBase.addTodo(todo);
      return Right(result);
    } catch(e){
      return Left(Failure("Oops , we couldn't add this todo"));
    }
  }

  @override
  Future<Either<Failure, Todo>> delete(Todo todo) async {
    try {
      final result = await remoteDataBase.deleteTodo(todo);
      return Right(result);
    } catch(e){
      return Left(Failure("Oops , we couldn't add this todo"));
    }
  }

  @override
  Future<Either<Failure, Todo>> edit(Todo todo) async {
    try{
      final result = await remoteDataBase.editTodo(todo);
      return Right(result);
    } catch(e){
      return Left(Failure("Oops , we couldn't add this todo"));
    }
  }

  @override
  Future<Either<Failure, Stream<List<Todo>>>> getAll() async {
    try {
      final result = remoteDataBase.listTodos();
      return Right(result);
    } catch(e){
      return Left(Failure("Oops , we couldn't add this todo"));
    }
  }


}