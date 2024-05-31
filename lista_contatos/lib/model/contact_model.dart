class Contact {
  int? _id;
  String? _name;
  String? _number;
  String? _email;
  String? _photo;
  String? _notes;

  Contact(
      {int? id,
      String? name,
      String? email,
      String? photo,
      String? notes,
      String? number}) {
    _id = id;
    _name = name;
    _email = email;
    _photo = photo;
    _notes = notes;
    _number = number;
  }

  getId() => _id ?? 0;
  getName() => _name ?? "";
  getNumber() => _number ?? "";
  getEmail() => _email ?? "";
  getPhoto() => _photo ?? "";
  getNotes() => _notes ?? "";

  Contact.fromMap(Map<String, dynamic> map) {
    _name = map["name"];
    _email = map["email"];
    _photo = map["photo"];
    _notes = map["notes"];
    _id = map["id"];
    _number = map["number"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": _id ?? 0,
      "name": _name ?? "",
      "email": _email ?? "",
      "photo": _photo ?? "",
      "notes": _notes ?? "",
      "number": _number ?? "",
    };
  }
}
