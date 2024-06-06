import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/controller/todo_list_controller.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/pages/todo_list.dart';
import 'package:todo_list/repository/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoListController>(
            create: (_) => getIt.get<TodoListController>())
      ],
      child: const SafeArea(
        child: MaterialApp(
          home: TodoList(),
        ),
      ),
    );
  }
}
