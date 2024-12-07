import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/core/utils/random_id.dart';
import 'package:todo/core/utils/usecase.dart';
import 'package:todo/features/todo/domain/entity/todo.dart';
import 'package:todo/features/todo/domain/usecase/add.dart';
import 'package:todo/features/todo/domain/usecase/delete.dart';
import 'package:todo/features/todo/domain/usecase/edit.dart';
import 'package:todo/features/todo/domain/usecase/list.dart';

class TodoController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final AddTodoUseCase addTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final EditTodoUseCase editTodoUseCase;
  final ListTodoUseCase listTodoUseCase;
  TodoController({
   required this.addTodoUseCase,
   required this.deleteTodoUseCase,
   required this.editTodoUseCase,
   required this.listTodoUseCase,
});

  Future<void> addTodo() async {
    final results = await addTodoUseCase(Params(
      Todo(
          id: generateRandomId(10),
          text: titleController.text.trim(),
          description: descriptionController.text.trim()
      )
    ));
    results.fold(
            (failure) {
              print(failure.message);
              Get.snackbar(
                  "Error",
                  failure.message
              );
            } ,
            (todo) {
              titleController.clear();
              descriptionController.clear();
              Get.snackbar(
               "Success",
               "Todo added successfully"
              );
            }
    );
  }

  Stream<List<Todo>> listTodo () async* {
    final results = await listTodoUseCase(NoParams());
    yield* results.fold(
            (failure) {
              print(failure.message);
              Get.snackbar(
                 "Error",
               failure.message
              );
              return Stream.value([]);
            },
            (todo) {
              return todo;
            }
    );
  }

  Future<void> deleteTodo (Todo todo) async {
    final results = await deleteTodoUseCase(
      Params(todo)
    );
    results.fold(
        (failure) => Get.snackbar(
            "Error",
            failure.message
        ),
    (r) => Get.snackbar(
        "Success",
        "Todo deleted successfully"
    ));
  }

  Future<void> editTodo (Todo todo) async {
    final results = await editTodoUseCase(
      Params(todo)
    );
    results.fold(
            (failure) => Get.snackbar(
            "Error",
            failure.message
        ),
            (r) => Get.snackbar(
            "Success",
            "Todo edited successfully"
        ));
  }
}