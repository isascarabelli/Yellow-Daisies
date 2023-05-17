import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:yd/add_event.dart';
import 'package:yd/event_controller.dart';
import 'package:yd/theme.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'calendar_button.dart';
import 'event.dart';
import 'event_tile.dart';

void main() {
  runApp(const Calendar());
}


class Calendar extends StatelessWidget {
  const Calendar({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDate = DateTime.now();
  final _eventController = Get.put(EventController());
  var notifyHelper;

  @override
  void initState() {
    _addTaskBar();
    _addDateBar();
    SizedBox(height: 10,);
    _showEvents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(height: 10,),
          _showEvents()
        ],
      ),
    );
  }

  _showEvents(){
    return Expanded(
        child: Obx((){
          return ListView.builder(
              itemCount: _eventController.eventList.length,

              itemBuilder: (_, index){
                print(_eventController.eventList.length);
                return  AnimationConfiguration.staggeredList(position: index, child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            _showBottomSheet(context, _eventController.eventList[index]);
                          },
                          child: EventTile(_eventController.eventList[index]),
                        )
                      ],
                    ),
                  ),
                ));
              });
        }),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose==true?Colors.black87:Colors.white
          ),
          borderRadius: BorderRadius.circular(20),
          color: clr
        ),
        child: Center(
          child: Text(
            label,
            style: isClose?GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black
              )
            ):GoogleFonts.lato(
              textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isClose==true?Colors.black87:Colors.white
            ),
          ),
        ),
      ),
      )
    );
  }
  _showBottomSheet(BuildContext context, Event event){
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: MediaQuery.of(context).size.height*0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 126,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]
              ),
        ),
              Spacer(),
              event.isCompleted == 1?Container(

              ): _bottomSheetButton(
                  label: "Evento concluído",
                  onTap: (){
                    Get.back();
                 },
                  clr: Colors.green,
                context: context,
              ),
            _bottomSheetButton(
              label: "Deletar evento",
              onTap: (){
                _eventController.delete(event);
                _eventController.getEvents();
                Get.back();
              },
              clr: Colors.red!,
              context: context,
            ),
            SizedBox(height: 20,),
            _bottomSheetButton(
              label: "Close",
              onTap: (){
                Get.back();
              },
              clr: Colors.white,
              isClose: true,
              context: context,
            ),
            SizedBox(height: 12,),
          ],
        ),
      )
    );
  }
  _addDateBar(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(top:20),
        child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.yellow.shade600,
            selectedTextColor: Colors.black,
            dateTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 20
              ),
            ),
            monthTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13
              ),
            ),
            dayTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            onDateChange: (date){
              _selectedDate = date;
            }
        ),
      ),
    );
  }
  _addTaskBar(){
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Hoje",
                  style: headingStyle,
                ),
              ],
            ),
          ),
          CalendarButton(label: "Adicionar Evento", onTap: () async{
             await Get.to(AddEventPage());
             _eventController.getEvents();
            }
          )
        ],
      ),
    );
  }
}
