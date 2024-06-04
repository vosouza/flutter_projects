import 'package:flutter/material.dart';
import 'package:lista_contatos/data/database_contract.dart';
import 'package:lista_contatos/data/sqflite_database.dart';
import 'package:lista_contatos/ui/home/home_page.dart';

void main() {
  DatabasesContract db = SQFliteDatabase();
  runApp(HomePage(db: db));
}
