import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yd/database.dart';
import 'package:yd/dialog_box.dart';
import 'package:yd/todo_list.dart';
import 'package:sized_icon_button/sized_icon_button.dart';
import 'TelaSobre.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');

  //toDoList
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null){
      db.toDoList = [];
    }else{
      db.loadData();
    }
    super.initState();
  }
  //Text controller das tarefas
  final _controller = TextEditingController();


  //checkbox depois de pressionada
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save nova tarefa
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //cancelar
  void onCancel(){
    Navigator.of(context).pop();
    _controller.clear();
  }

  //cria nova tarefa
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => onCancel(),
        );
      },
    );
  }

  //deleta nova tarefa
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.cyan[200],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[400],
        onPressed: createNewTask,
        child: const Icon(Icons.add, color: Colors.black54,),
      ),

      body:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: heigth*0.035, top: heigth*0.02),
                            child: const Text(
                              "My Day",
                              textDirection: TextDirection.ltr,
                              style:
                              TextStyle(
                                fontSize: 30,
                                fontFamily: 'Futura',
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only( right: width*0.06, top: width*0.06),
                            child: SizedIconButton(
                                color: Colors.cyan[400],
                                icon: const Icon(
                                  Icons.person,
                                  size: 17,
                                  color: Colors.black,
                                ),
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TelaSobre()
                                      ),
                                  );
                                }
                            ),
                          )
                        ],
                      ),
                    ),
                Expanded(
                    flex: 9,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: db.toDoList.length,
                        itemBuilder: (context, index){
                          return ToDoList(
                            taskName: db.toDoList[index][0],
                            taskCompleted: db.toDoList[index][1],
                            onChanged: (value) => checkBoxChanged(value, index),
                            deleteTask: (context) => deleteTask(index),
                          );
                        }
                    ),
                  ),
              ],
            ),
      );
  }
}
