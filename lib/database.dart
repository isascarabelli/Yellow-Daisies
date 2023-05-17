import 'package:hive_flutter/adapters.dart';

class ToDoDataBase{
  List toDoList = [];
  final _myBox = Hive.box('mybox');


  //load the data
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}