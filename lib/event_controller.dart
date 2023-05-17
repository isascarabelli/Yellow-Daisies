import 'package:get/get.dart';
import 'package:yd/event.dart';
import 'db/db_helper.dart';

class EventController extends GetxController{

  @override
  void onReady(){
    super.onReady();
  }

  var eventList = <Event>[].obs;

  Future<int> addEvent({Event? event}) async {
    return await DBHelper.insert(event);
  }

  //pegar todos os dados da tabela
  void getEvents() async {
    List<Map<String, dynamic>> events = await DBHelper.query();
    eventList.assignAll(events.map((data) => new Event.fromJson(data)).toList());
  }

  void delete(Event event){
    var val = DBHelper.delete(event);
  }
}