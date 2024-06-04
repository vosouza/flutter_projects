import 'package:lista_contatos/data/database_contract.dart';
import 'package:lista_contatos/model/contact_model.dart';

class Repository{
  final DatabasesContract db;

  Repository(this.db);

  Future saveContact(Contact c) async{ 
    return db.insert(c);
  }

  Future<List<Contact>> getContats() async{
    await db.open();
    return db.getContactList();
  }

}