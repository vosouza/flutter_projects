import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/controller/todo_list_controller.dart';
import 'package:todo_list/db/sqlite_database.dart';
import 'package:todo_list/pages/home_page.dart';
import 'package:todo_list/repository/repository.dart';
import 'package:todo_list/service/implementation/todo_list_service.dart';
import 'package:todo_list/service/implementation/todo_mock_service.dart';
import 'package:todo_list/service/todo_service.dart';

final getIt = GetIt.asNewInstance();
void main() {
  getIt.registerSingletonAsync<SQLiteDataSource>(() async => SQLiteDataSource());
  getIt.registerSingletonWithDependencies<TodoService>(
    () => TodoMockService(),
    dependsOn: [SQLiteDataSource],
  );
  getIt.registerSingletonWithDependencies<Repository>(
    () => Repository(getIt.get<TodoService>()),
    dependsOn: [TodoService],
  );
  getIt.registerSingletonWithDependencies<TodoListController>(
    () => TodoListController(getIt.get<Repository>()),
    dependsOn: [Repository],
  );

  runApp(HomePage());
}
