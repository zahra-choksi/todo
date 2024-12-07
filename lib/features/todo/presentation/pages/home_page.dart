import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/features/todo/presentation/controller/todo_controller.dart';

import '../../domain/entity/todo.dart';

class HomePage extends GetView<TodoController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0c4f8e),
        centerTitle: true,
        title: const Text(
          "Todo List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: StreamBuilder(
        stream: controller.listTodo(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            final todos = snapshot.data!;
            if(todos.isEmpty){
              return const Center(
                child: Text("No Todos found"),
              );
            }
            return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title:  Text(todos[index].text),
                    subtitle: Text(todos[index].description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          splashRadius: 20,
                            onPressed: (){

                              controller.titleController.text = todos[index].text;
                              controller.descriptionController.text = todos[index].description;
                              showModalBottomSheet(
                                  showDragHandle: true,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context){
                                    return Container(
                                      width: double.maxFinite,
                                      height: MediaQuery.of(context).size.height * 0.8,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Form(
                                          key: controller.formKey,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: controller.titleController,
                                                validator: (value){
                                                  if(value!.isEmpty){
                                                    return "title is required";
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                  labelText: 'Title'
                                                ),
                                              ),
                                              Padding(
                                                  padding:const EdgeInsets.only(bottom: 8.0),
                                                child: TextFormField(
                                                  controller: controller.descriptionController,
                                                  validator: (value){
                                                    if(value!.isEmpty){
                                                      return 'Description is required';
                                                    }
                                                    return null;
                                                  },
                                                  decoration:  const InputDecoration(
                                                    labelText: "Description"
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.maxFinite,
                                                child: ElevatedButton(
                                                  onPressed: (){

                                                    if(controller.formKey.currentState!.validate()){
                                                      controller.editTodo(
                                                        Todo(
                                                          id:todos[index].id,
                                                          text:controller.titleController.text.trim(),
                                                          description:controller.descriptionController.text.trim(),
                                                        )
                                                      );
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: const Text("Edit Todo"),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              );
                            },
                            icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          splashRadius: 20,
                            onPressed: (){
                            controller.deleteTodo(todos[index]);
                        },
                            icon: const Icon(Icons.delete)
                        )
                      ],
                    ),
                  );
                }
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0c4f8e),
        foregroundColor: Colors.white,
        onPressed: (){
          controller.titleController.clear();
          controller.descriptionController.clear();
          showModalBottomSheet(
            showDragHandle: true,
              isScrollControlled: true,
              context: context,
              builder: (context){
              return Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.titleController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'title is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Title"
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          controller: controller.descriptionController,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'description is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: "Description"
                          ),
                        ),
                        ),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                      onPressed: ()async{

                        if(controller.formKey.currentState!.validate()){
                          controller.addTodo();
                          Navigator.pop(context);
                        }
                      },
                        child: const Text("Add"),
                    )
                    )
                      ],
                    ),
                  ),
                ),
                
              );
              }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
