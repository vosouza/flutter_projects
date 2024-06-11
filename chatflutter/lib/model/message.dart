class Message {
  String? hora;
  String? nome;
  String? msg;

  Message({this.hora, this.nome, this.msg});

  Message.fromJson(Map<String, dynamic> json) {
    hora = json['hora'];
    nome = json['nome'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hora'] = this.hora;
    data['nome'] = this.nome;
    data['msg'] = this.msg;
    return data;
  }
}
