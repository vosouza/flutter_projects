import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_flutter/Model/pessoa.dart';
import 'package:imc_flutter/service/imc_calculadora.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State {
  MainAppState();

  List<Pessoa> imcList = [];
  ImcCalculadora calculadora = ImcCalculadora();
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  var imc = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Calculadora IMC",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.blue.shade300,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        "Preencha os campos com seus dados e depois clique em \"Calcular\" ",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'altura',
                          hintText: 'Sua altura (exemplo 1.73)',
                          helperText: 'exemplo 1.73',
                          border: OutlineInputBorder(),
                        ),
                        controller: alturaController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Peso',
                          hintText: 'Seu Peso (exemplo 94)',
                          helperText: 'exemplo 94',
                          border: OutlineInputBorder(),
                        ),
                        controller: pesoController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        var p = double.parse(pesoController.text);
                        var a = double.parse(alturaController.text);
                        setState(() {
                          var pessoa = Pessoa(peso: p, altura: a);
                          pessoa.setIMC(calculadora.imc(pessoa));
                          imcList.add(pessoa);
                        });
                      },
                      child: const Text("Calcular"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: imcList.length,
                itemBuilder: (context, index) {
                  var pessoa = imcList[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("IMC : ${pessoa.getIMC()} "),
                                Text("Peso : ${pessoa.getPeso()} "),
                                Text("Altura : ${pessoa.getAltura()} "),
                              ],
                            ),
                            Text(calculadora.getClassificacao(pessoa)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
