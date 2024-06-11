import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/repository/repository.dart';

class TodoListController extends ChangeNotifier{

  Repository repo;

  List<ToDoModel> list = [];

  TodoListController(this.repo);

  getAll() async{
    repo.getAll().then((onValue)=>{
      list = onValue,
      notifyListeners()
    });
  }

  addItem(String title,String note) async{
    await repo.addItem(title, note);
    getAll();
  }

}