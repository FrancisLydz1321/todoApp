import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class TodoItem {
  @HiveField(0)
  final String title;
  @HiveField(1, defaultValue: false)
  final bool isCompleted;

  TodoItem(this.title, this.isCompleted); // Constructor
}
