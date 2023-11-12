import 'package:hive/hive.dart';
import 'package:todo_app/todo_item.dart';

class TodoService {
  final String _boxName = "todoBox";

  Future<Box<TodoItem>> get _box async =>
      await Hive.openBox<TodoItem>(_boxName);

  Future<void> addItem(TodoItem todoItem) async {
    var box = await _box;

    await _box.add(todoItem);
  }
}
