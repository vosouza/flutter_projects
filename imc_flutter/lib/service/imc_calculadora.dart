import '../Model/pessoa.dart';

class ImcCalculadora{

  double imc(Pessoa pessoa){
    return pessoa.getPeso() / (pessoa.getAltura() * pessoa.getAltura());
  }

  String getClassificacao(Pessoa pessoa){
    double imcValue = imc(pessoa);

    switch(imcValue){
      case <= 16:
        return "Magreza grave";
      case >16 && <= 17:
        return "Magreza moderada";
      case >17 && <= 18.5:
        return "Magreza leve";
      case >18.5 && <= 25:
        return "Saudavel";
      case >25 && <= 30:
        return "Sobrepeso";
      case >30 && <=35:
        return "Obesidade grau 1";
      case >35 && <40:
        return "Obesidade grau 2";
      case >= 40:
        return "Obesidade grau 3";
      default:
        return throw const FormatException("Dados inconsistentes");
    }
  }

}