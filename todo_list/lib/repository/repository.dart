import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/service/todo_service.dart';

class Repository {
  TodoService service;

  Repository(this.service);

  Future<List<ToDoModel>> getAll() async {
    return service.getTodoList();
  }

  Future<int> removeItem(String id) async {
    return service.removeItem(id);
  }

  Future<int> addItem(String title, String note) async {
    return service.addItem(title, note);
  }
}
