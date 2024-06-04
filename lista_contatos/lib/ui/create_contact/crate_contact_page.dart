import 'package:flutter/material.dart';
import 'package:lista_contatos/model/contact_model.dart';
import 'package:lista_contatos/repository/repository.dart';

class CrateContactPage extends StatefulWidget {
  final Repository repo;
  const CrateContactPage({super.key,required this.repo});

  @override
  State<StatefulWidget> createState() {
    return CrateContactPageState();
  }
}

class CrateContactPageState extends State {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController numeroTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController anotacoesTextController = TextEditingController();
  Repository? repo;

  @override
  void initState() {
    repo = (widget as CrateContactPage).repo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: nameTextController,
              decoration: const InputDecoration(
                hintText: "Digite o nome do seu contato",
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              controller: numeroTextController,
              decoration: const InputDecoration(
                hintText: "Digite o numero do seu contato",
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              controller: emailTextController,
              decoration: const InputDecoration(
                hintText: "Digite o e-mail do seu contato",
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              controller: anotacoesTextController,
              decoration: const InputDecoration(
                hintText: "Anotações",
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextButton(
              onPressed: () {
                var c = Contact(
                  name: nameTextController.text,
                  email: emailTextController.text,
                  number: numeroTextController.text,
                  notes: anotacoesTextController.text
                );
                repo?.saveContact(c).then((value)=>{
                    Navigator.pop(context)
                });
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
