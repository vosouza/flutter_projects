import 'package:todo_list/db/sqlite_database.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/service/todo_service.dart';
import 'package:uuid/uuid.dart';

class TodoListServiceImpl extends TodoService {
  var uuid = const Uuid();
  SQLiteDataSource db;

  TodoListServiceImpl(this.db);

  @override
  Future<List<ToDoModel>> getTodoList() async {
    await db.open();
    return db.getTodoList();
  }

  @override
  removeItem(String id) async {
    await db.open();
    return db.delete(id);
  }

  @override
  addItem(String title, String note) async {
    await db.open();
    var t = ToDoModel(uuid.v1(), title, note, false);
    return db.insert(t);
  }
}
