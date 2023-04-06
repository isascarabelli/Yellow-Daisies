import 'package:flutter/material.dart';
import 'package:yd/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: "Adicionar nova tarefa"
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save button
              MyButton(text: "Salvar", onPressed: onSave),

              const SizedBox(width: 8),
              //cancel button
              MyButton(
                  text: "Cancelar",
                  onPressed: onCancel,
              ),
            ],
          )
        ],)
      )
    );
  }
}
