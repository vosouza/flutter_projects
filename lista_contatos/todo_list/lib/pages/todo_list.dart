import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/controller/todo_list_controller.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/repository/repository.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    getIt.get<TodoListController>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de Tarefas",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.not_started_sharp),
        onPressed: () {
          _showMyDialog(context);
        },
      ),
      body: Consumer<TodoListController>(
        builder: (context, value, child) {
          if (value.list.isNotEmpty) {
            return ListView.builder(
              itemCount: value.list.length,
              itemBuilder: (ctx, index) {
                var tarefa = value.list[index];
                return Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(tarefa.title,),
                            Switch(value: tarefa.isDone, onChanged: (bool val){
                              setState(() {
                                tarefa.isDone = val;
                              });
                            }),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Text(tarefa.note, textAlign: TextAlign.start,)
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Você não tem nenhuma tarefa cadastrada"));
          }
        },
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext con) async {
    var titleController = TextEditingController();
    var noteController = TextEditingController();

    return showDialog<void>(
      context: con,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nova tarefa'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(label: Text("Titulo")),
                ),
                TextField(
                  controller: noteController,
                  decoration: const InputDecoration(
                    label: Text("Tarefa"),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Adicionar'),
              onPressed: () {
                getIt
                    .get<Repository>()
                    .addItem(titleController.text, noteController.text);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
