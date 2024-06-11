import 'package:sqflite/sqflite.dart';
import 'package:todo_list/model/todo_model.dart';

class SQLiteDataSource {
  final _table = 'todoTable';
  final _columnId = 'todoId';
  final _columnTitle = 'title';
  final _columnNote = 'note';
  final _columnDone = 'isDone';

  Database? db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/database.db";

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        create table $_table ( 
          $_columnId text primary key, 
          $_columnTitle text,
          $_columnNote text,
          $_columnDone int)
        ''');
      },
    );
  }

  Future<List<ToDoModel>> getTodoList() async {
    if (db == null) {
      throw Exception("db null");
    }
    List<Map> maps = await db!.query(
      _table,
      columns: [_columnId, _columnTitle, _columnNote, _columnDone],
    );
    if (maps.isNotEmpty) {
      List<ToDoModel> response = [];
      for (var item in maps) {
        var p = ToDoModel(
          item[_columnId],
          item[_columnTitle],
          item[_columnNote],
          item[_columnDone] == 0 ? false: true,
        );
        response.add(p);
      }
      return response;
    }
    return [];
  }

  Future<int> delete(String id) async {
    return await db!.delete(_table, where: '$_columnId = ?', whereArgs: [id]);
  }

  Future<int> insert(ToDoModel p) async {
    var pMap = {
      _columnId: p.id,
      _columnTitle: p.title,
      _columnNote: p.note,
      _columnDone: p.isDone? 1: 0,
    };
    return await db!.insert(_table, pMap);
  }

  Future close() async => db!.close();
}