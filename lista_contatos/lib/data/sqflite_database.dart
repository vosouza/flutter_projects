import 'package:lista_contatos/data/database_contract.dart';
import 'package:lista_contatos/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';

class SQFliteDatabase extends DatabasesContract{
  final String _table = "contactTable";
  final String _id = "contactID";
  final String _nome = "nome";
  final String _email = "email";
  final String _photo = "photo";
  final String _notes = "notes";
    final String _number = "number";


  Database? db;

  @override
  Future open()  async{
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/cepdatabase.db";

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        create table $_table (
          $_id integer primary key autoincrement , 
          $_nome text primary key, 
          $_email text ,
          $_photo text ,
          $_number text ,
          $_notes text);
        ''');
      },
    );
  }

  @override
  Future<List<Contact>> getContactList() async{
    if (db == null) {
      throw Exception("db null");
    }
    var maps = await db!.query(_table, columns: [
      _id,
      _email,
      _nome,
      _email,
      _photo,
      _notes,
      _number
    ]);

    if (maps.isNotEmpty) {
      List<Contact> response = [];
      for (var item in maps) {
        var p = Contact(
          name: item[_nome] as String,
          email: item[_email] as String,
          notes: item[_notes] as String,
          photo: item[_photo] as String,
          id: item[_id] as int,
          number: item[_number] as String
        );
        response.add(p);
      }
      return response;
    }
    return [];
  }

   @override
     Future<Contact> gepContact(int id) async {
    if (db == null) {
      throw Exception("db null");
    }
    List<Map> maps = await db!.query(_table, columns: [
       _id,
      _email,
      _nome,
      _email,
      _photo,
      _notes,
      _number
    ],
    where: "$_id = ?",
    whereArgs: [id]);
    if (maps.isNotEmpty) {
      Contact response = Contact();
      for (var item in maps) {
        var p = Contact(
          name: item[_nome] as String,
          email: item[_email] as String,
          notes: item[_notes] as String,
          photo: item[_photo] as String,
          id: item[_id] as int,
          number: item[_number] as String
        );
        response = p;
      }
      return response;
    }
    return Contact();
  }

  @override
  Future<int> delete(int id) async {
    return await db!.delete(_table, where: '$_id = ?', whereArgs: [id]);
  }

  @override
  Future<void> insert(Contact p) async {
    var pMap = {
      _id: p.getId(),
      _email: p.getEmail(),
      _nome: p.getName(),
      _photo: p.getPhoto(),
      _notes: p.getNotes(),
      _notes: p.getNumber()
    };
    await db!.insert(_table, pMap);
  }

  @override
  Future close() async => db!.close();

}