import 'package:todo_list/model/todo_model.dart';

abstract class TodoService{
  Future<List<ToDoModel>> getTodoList();
  Future<int>removeItem(String id);
  Future<int>addItem(String title, String note);
}