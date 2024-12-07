import '../../domain/entity/todo.dart';

abstract class TodoRemoteDataBase {
  Future<Todo> addTodo (Todo todo);

  Future<Todo> editTodo (Todo todo);

  Future<Todo> deleteTodo (Todo todo);

  Stream<List<Todo>> listTodos ();

}