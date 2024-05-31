import 'package:back4app_cep/model/cep_model.dart';
import 'package:sqflite/sqflite.dart';

class CepDatabase {
  final _table = 'cepTable';
  final String _cep = "cepID";
  final String _logradouro = "logradouro";
  final String _complemento = "complemento";
  final String _bairro = "bairro";
  final String _localidade = "localidade";
  final String _uf = "uf";
  final String _ibge = "ibge";
  final String _gia = "gia";
  final String _ddd = "ddd";
  final String _siafi = "siafi";

  Database? db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/cepdatabase.db";

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        create table $_table ( 
          $_cep text primary key, 
          $_logradouro text ,
          $_complemento text ,
          $_bairro text,
          $_localidade text,
          $_uf text,
          $_ibge text,
          $_gia text,
          $_ddd text,
          $_siafi text);
        ''');
      },
    );
  }

  Future<List<CepModel>> gepCepList() async {
    if (db == null) {
      throw Exception("db null");
    }
    List<Map> maps = await db!.query(_table, columns: [
      _cep,
      _logradouro,
      _complemento,
      _bairro,
      _localidade,
      _uf,
      _ibge,
      _gia,
      _ddd,
      _siafi
    ]);
    if (maps.isNotEmpty) {
      List<CepModel> response = [];
      for (var item in maps) {
        var p = CepModel(
          cep: item[_cep],
          logradouro: item[_logradouro],
          complemento: item[_complemento],
          bairro: item[_bairro],
          localidade: item[_localidade],
          uf: item[_uf],
          ibge: item[_ibge],
          gia: item[_gia],
          ddd: item[_ddd],
          siafi: item[_siafi],
        );
        response.add(p);
      }
      return response;
    }
    return [];
  }

  Future<CepModel> gepCep(String cep) async {
    if (db == null) {
      throw Exception("db null");
    }
    List<Map> maps = await db!.query(_table, columns: [
      _cep,
      _logradouro,
      _complemento,
      _bairro,
      _localidade,
      _uf,
      _ibge,
      _gia,
      _ddd,
      _siafi
    ],
    where: "$_cep = ?",
    whereArgs: [cep]);
    if (maps.isNotEmpty) {
      CepModel response = CepModel();
      for (var item in maps) {
        var p = CepModel(
          cep: item[_cep],
          logradouro: item[_logradouro],
          complemento: item[_complemento],
          bairro: item[_bairro],
          localidade: item[_localidade],
          uf: item[_uf],
          ibge: item[_ibge],
          gia: item[_gia],
          ddd: item[_ddd],
          siafi: item[_siafi],
        );
        response = p;
      }
      return response;
    }
    return CepModel();
  }

  Future<int> delete(int id) async {
    return await db!.delete(_table, where: '$_cep = ?', whereArgs: [id]);
  }

  Future<void> insert(CepModel p) async {
    var pMap = {
      _cep: p.cep,
      _logradouro: p.logradouro,
      _complemento: p.complemento,
      _bairro: p.bairro,
      _localidade: p.localidade,
      _uf: p.uf,
      _ibge: p.ibge,
      _gia: p.gia,
      _ddd: p.ddd,
      _siafi: p.siafi,
    };
    await db!.insert(_table, pMap);
  }

  Future close() async => db!.close();
}
