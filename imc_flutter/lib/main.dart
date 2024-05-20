import 'package:flutter/material.dart';

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

  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  var imc = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Card(
              color: Colors.white,
              elevation: 2.0,
              child: Column(
                children: [
                  Text(
                      "Preencha os campos com seus dados e depois clique em \"Calcular\" "),
                  SizedBox(
                    height: 32,
                  ),
                  Text("Sua altura (exemplo 1.73)"),
                  TextField(
                    controller: alturaController,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text("Seu Peso (exemplo 94)"),
                  TextField(controller: pesoController),
                  SizedBox(
                    height: 32,
                  ),
                  TextButton(
                      onPressed: () {
                        var p = double.parse(pesoController.text);
                        var a = double.parse(alturaController.text);
                        setState(() {
                          imc = p / (a * a);
                        });
                      },
                      child: Text("Calcular")),
                  Text("Seu IMC é de $imc"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
