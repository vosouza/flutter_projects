import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/service/todo_service.dart';
import 'package:uuid/uuid.dart';

class TodoMockService extends TodoService{
  
  var uuid = const Uuid();
  List<ToDoModel> list = [];
  
  @override
  Future<int> addItem(String title, String note) {
    return Future((){
      list.add(ToDoModel(uuid.v1(), title, note, false));
      return 0;
    });
  }

  @override
  Future<List<ToDoModel>> getTodoList() {
    return Future((){
      return list;
    });
  }

  @override
  Future<int> removeItem(String id) {
    return Future((){
      var x = list.firstWhere((element) => element.id == id,);
      list.remove(x);
      return 0;
    });
  }

}