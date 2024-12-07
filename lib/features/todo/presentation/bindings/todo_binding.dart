import 'package:get/get.dart';
import 'package:todo/features/todo/data/datasource/todo_remote_data_source.dart';
import 'package:todo/features/todo/data/datasource/todo_remote_data_source_impl.dart';
import 'package:todo/features/todo/data/repository/todo_repository_impl.dart';
import 'package:todo/features/todo/domain/repository/todo_repository.dart';
import 'package:todo/features/todo/domain/usecase/add.dart';
import 'package:todo/features/todo/domain/usecase/delete.dart';
import 'package:todo/features/todo/domain/usecase/edit.dart';
import 'package:todo/features/todo/domain/usecase/list.dart';
import 'package:todo/features/todo/presentation/controller/todo_controller.dart';
class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoRemoteDataBase>(() => TodoRemoteDataBaseImpl());
    Get.lazyPut<TodoRepository>(() => TodoRepositoryImpl(remoteDataBase: Get.find()));
    Get.lazyPut(() => AddTodoUseCase(Get.find()));
    Get.lazyPut(() => DeleteTodoUseCase(Get.find()));
    Get.lazyPut(() => EditTodoUseCase(Get.find()));
    Get.lazyPut(() => ListTodoUseCase(Get.find()));
    Get.lazyPut(() => TodoController(
        addTodoUseCase: Get.find(),
        deleteTodoUseCase: Get.find() ,
        editTodoUseCase: Get.find(),
        listTodoUseCase: Get.find()
    ));
  }

}