import 'package:flutter/material.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactListPageState();
  }
}

class ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Text("hola"),
    );
  }
}
