import 'package:lista_contatos/model/contact_model.dart';

abstract class DatabasesContract{

  Future open();
  Future close();
  Future<List<Contact>> getContactList();
  Future<int> delete(int id);
  Future<void> insert(Contact contact);
  Future<Contact> gepContact(int id);

}