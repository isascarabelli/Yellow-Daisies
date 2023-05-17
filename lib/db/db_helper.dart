
import 'package:yd/event.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "eventos";

  static Future<void> initDb() async{
    if(_db != null){
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'eventos.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version){
          print('Criando um novo database');
          return db.execute(
            "CREATE TABLE $_tableName("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "title STRING, note TEXT, date STRING, "
                "startTime STRING, endTime STRING, "
                "remind INTEGER, repeat STRING, "
                "color INTEGER, "
                "isCompleted INTEGER)",

          );
        },
      );
    } catch(e){
      print(e);
    }
  }

  static Future<int> insert(Event? event) async {
    print("Função de inserir é chamada");
    return await _db?.insert(_tableName, event!.toJson()) ?? -1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("função query foi chamada");
    return await _db!.query(_tableName);
  }

  static delete(Event event) async{
    return await _db!.delete(_tableName, where:'id=?', whereArgs: [event.id]);
  }
}