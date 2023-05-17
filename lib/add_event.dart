import 'package:google_fonts/google_fonts.dart';
import 'package:yd/calendar_button.dart';
import 'package:yd/event.dart';
import 'package:yd/event_controller.dart';
import 'package:yd/input_field.dart';
import 'package:yd/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final EventController _eventController = Get.put(EventController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm").format(DateTime.now());
  String _endTime = DateFormat("hh:mm").format(DateTime.now());
  int _selectedRemind = 5;
  List<int> remindList=[
    5,
    10,
    15,
    20,
    30,
    45,
    60,
  ];

  String _selectedRepeat = "Nenhum";
  List<String> repeatList = [
    "Nenhuma",
    "Diariamente",
    "Semanalmente",
    "Mensalmente"
  ];
  int _selectedColor = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black
        ),
        elevation: 0,
        backgroundColor: Colors.cyan[200],
      ),
      body:
      Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adicionar Evento",
                  style: headingStyle,
                ),
                MyInputField(hint: "Entre com seu título", title: "Título", controller: _titleController,),
                MyInputField(hint: "Entre com sua descrição", title: "Descrição", controller: _noteController,),
                MyInputField(hint: DateFormat.yMd("Brasil").format(_selectedDate), title: "Data",
                  widget: IconButton(
                    icon: const Icon(Icons.calendar_month_outlined),
                    onPressed: (){
                      _getDateFromUser();
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyInputField(
                        title: "Início",
                        hint: _startTime,
                        widget: IconButton(
                            onPressed: (){
                              _getTimeFromUser(true);
                            },
                            icon: const Icon(
                                Icons.access_time_rounded
                            )
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: MyInputField(
                        title: "Fim",
                        hint: _endTime,
                        widget: IconButton(
                            onPressed: (){
                              _getTimeFromUser(false);
                            },
                            icon: const Icon(
                                Icons.access_time_rounded
                            )
                        ),
                      ),
                    )
                  ],
                ),
                MyInputField(hint: "$_selectedRemind minutos antes", title: "Lembrete",
                widget: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down,
                    color: Colors.black87,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0,),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRemind = int.parse(value!);
                    });
                  },
                  items: remindList.map<DropdownMenuItem<String>>((int value){
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                        child:
                        Text(
                          value.toString()
                        ),
                    );
                    }
                  ).toList(),
                ),
                ),
                /*MyInputField(hint: "$_selectedRepeat", title: "Repetir",
                  widget: DropdownButton(
                    icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black87,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    underline: Container(height: 0,),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRepeat = value!;
                      });
                    },
                    items: repeatList.map<DropdownMenuItem<String>>((String? value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                        Text(
                            value!,
                        ),
                      );
                    }
                    ).toList(),
                  ),
                ),*/
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _colorPallete(),
                    CalendarButton(label: "     Criar evento", onTap: _validateDate)
                  ],
                )
              ],
            ),
          )
      ),
    );
  }

  _validateDate(){
    if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
      _addTaskToDb();
      Get.back();
    }else if(_titleController.text.isEmpty || _noteController.text.isEmpty){
      Get.snackbar("Campo vazio", "Todas as opções são obrigatórias!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        icon: Icon(Icons.warning_amber_rounded, color: Colors.redAccent,),
        colorText: Colors.redAccent,
      );
    }
  }

  _addTaskToDb() async{
    int value = await _eventController.addEvent(
         event: Event(
            note: _noteController.text,
            title: _titleController.text,
            date: DateFormat.yMd().format(_selectedDate),
            startTime: _startTime,
            endTime: _endTime,
            remind: _selectedRemind,
            repeat: _selectedRepeat,
            color: _selectedColor,
            isCompleted: 0
        )
    );

    print("Meu id é" + "$value");
  }

  _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Marcador",
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        SizedBox(height: 8.0,),
        Wrap(
            children: List<Widget>.generate(
                3,
                    (int index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        _selectedColor = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: index==0?Colors.lightBlue:index==1?Colors.indigoAccent:Colors.orange[800],
                        child: _selectedColor == index?Icon(Icons.done, color: Colors.white, size: 16):Container(),
                      ),
                    ),
                  );
                }
            )
        )
      ],
    );
  }
  _getDateFromUser() async{
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if(_pickerDate != null){
      setState(() {
        _selectedDate = _pickerDate;
      });
    }else{
      print("Something went wrong...");
    }
  }

  _getTimeFromUser(bool isStartTime) async{
    var _pickedTime = await _showTimePicker(isStartTime);
    String _formatedTime = _pickedTime.format(context);

    if(_pickedTime == null){
      print("Time canceld");
    }else if(isStartTime){
      setState(() {
        _startTime = _formatedTime;
      });
    }else if(!isStartTime){
      setState(() {
        _endTime=_formatedTime;
      });
    }
  }

  _showTimePicker(bool isStartTime){
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime:
        TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])
        )
    );
  }
}
