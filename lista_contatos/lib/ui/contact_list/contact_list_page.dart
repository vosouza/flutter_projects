import 'package:flutter/material.dart';
import 'package:lista_contatos/model/contact_model.dart';
import 'package:lista_contatos/repository/repository.dart';
import 'package:lista_contatos/ui/create_contact/crate_contact_page.dart';

class ContactListPage extends StatefulWidget {
  final Repository repo;
  const ContactListPage({super.key, required this.repo});

  @override
  State<StatefulWidget> createState() {
    return ContactListPageState();
  }
}

class ContactListPageState extends State<ContactListPage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    fetchContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => CrateContactPage(
                repo: widget.repo,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: contacts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () {
                return fetchContacts();
              },
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  var c = contacts[index];
                  return contactTile(c);
                },
              ),
            ),
    );
  }

  Widget contactTile(Contact c) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 167, 237, 170),
              child: Text(c.getName().toString().substring(0, 1)),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            children: [
              Text("Nome: ${c.getName()}"),
              const SizedBox(
                height: 8,
              ),
              Text(c.getNumber()),
            ],
          )
        ],
      ),
    );
  }

  Future fetchContacts() {
    return widget.repo.getContats().then((onValue) => {
          setState(() {
            contacts = onValue;
          })
        });
  }
}
