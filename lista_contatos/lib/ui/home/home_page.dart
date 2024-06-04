import 'package:flutter/material.dart';
import 'package:lista_contatos/data/database_contract.dart';
import 'package:lista_contatos/repository/repository.dart';
import 'package:lista_contatos/ui/contact_list/contact_list_page.dart';

class HomePage extends StatefulWidget {
  final DatabasesContract db;
  const HomePage({super.key, required this.db});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late Repository repo;
  @override
  void initState() {
    repo = Repository(widget.db);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContactListPage(repo: repo,),
      ),
    );
  }
}
