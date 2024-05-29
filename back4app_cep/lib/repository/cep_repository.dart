import 'package:back4app_cep/data/cep_database.dart';
import 'package:back4app_cep/model/cep_model.dart';
import 'package:back4app_cep/network/dio_network.dart';
import 'package:dio/dio.dart';

class CepRepository {
  final dio = Dio();
  final cepDb = CepDatabase();

  CepRepository() {
    dio.interceptors.add(InterceptorDIO());
  }

  Future<CepModel> getCEP(String cep) async {
    var savedCEP = await cepDb.gepCep(cep);
    if (savedCEP.cep != null) {
      return savedCEP;
    }

    var response = await dio.get("https://viacep.com.br/ws/$cep/json/");
    if (response.statusCode != 200) {
      throw Exception("Erro chamada getCEP: ${response.statusCode}");
    } else {
      var cepParsed = CepModel.fromJson(response.data);
      cepDb.insert(cepParsed);
      return cepParsed;
    }
  }

  Future<List<CepModel>> getCEPlist() async {
    await cepDb.open();
    var response = await cepDb.gepCepList();
    return response;
  }
}
