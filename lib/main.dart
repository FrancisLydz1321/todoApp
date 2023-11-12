import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_app/todo_item.dart';
import 'package:todo_app/todo_service.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoItemAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TodoService _todoService = TodoService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
      future: _todoService.getAllTodos(),
      builder: (BuildContext context, AsyncSnapshot<List<TodoItem>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const TodoListPage();
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }
}


class TodoListPage  extends StatelessWidget {
  const TodoListPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Todo List"),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Todo'),
                  content: const TextField(),
                    action: [
                       ElevatedButton(
                        child: const Text('Add'),
                        onPressed: () {

                        }, 
                      )
                    ]
              );
            }
          );
        }
        child: const Icon(Icon.add),
        ),
    )
  }
}