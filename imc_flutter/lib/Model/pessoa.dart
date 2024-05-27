class Pessoa{

  String? _nome;
  double? _altura;
  double? _peso;
  double? _imc;

  Pessoa({String? nome, double? altura, double? peso}){
    _nome = nome;
    _altura = altura;
    _peso = peso;
  }

  String getNome()  {
    if(_nome == null){
      throw const FormatException('Nome nao fornecido');
    }else{
      return _nome!;
    }
  }

  void setNome(String nome) => _nome = nome;

  double getAltura()  {
    if(_altura == null){
      throw const FormatException('Peso nao fornecido');
    }else{
      return _altura!;
    }
  }

  void setAltura(double altura) => _altura = altura;

  double getPeso() {
    if(_peso == null){
      throw const FormatException('Peso nao fornecido');
    }else{
      return _peso!;
    }
  }

  void setPeso(double peso) => _peso = peso;

  double getIMC() {
    if(_imc == null){
      throw const FormatException('imc nao fornecido');
    }else{
      return _peso!;
    }
  }

  void setIMC(double imc) => _imc = imc;

  @override
  String toString() {
    return {
      "Nome: " : _nome,
      "Altura: " : _altura,
      "Peso: " : _peso,
    }.toString();
  }

}