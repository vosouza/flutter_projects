import 'package:imc_flutter/Model/pessoa.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDataSource {
  final _table = 'imcTable';
  final _columnId = 'imcId';
  final _columnPeso = 'peso';
  final _columnAltura = 'altura';

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
          $_columnId integer primary key autoincrement, 
          $_columnPeso real not null,
          $_columnAltura real not null)
        ''');
      },
    );
  }

  Future<List<Pessoa>> getIMC() async {
    if (db == null) {
      throw Exception("db null");
    }
    List<Map> maps =
        await db!.query(_table, columns: [_columnId, _columnPeso, _columnAltura]);
    if (maps.isNotEmpty) {
      List<Pessoa> response = [];
      for (var item in maps) {
        var p = Pessoa(altura: item[_columnAltura], peso: item[_columnPeso]);
        response.add(p);
      }
      return response;
    }
    return [];
  }

  Future<int> delete(int id) async {
    return await db!.delete(_table, where: '$_columnId = ?', whereArgs: [id]);
  }

  Future<void> insert(Pessoa p) async {
    var pMap = {_columnPeso: p.getPeso(), _columnAltura: p.getAltura()};
    await db!.insert(_table, pMap);
  }

  Future close() async => db!.close();
}
