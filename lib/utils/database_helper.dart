import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseHelper {
  Database? db;
  String EmployeeTable = "Employee";

  DatabaseHelper() {
    initDb();
  }

  initDb() async {
    try {
      if (kIsWeb) {
        var factory = databaseFactoryFfiWeb;
        var db = await factory.openDatabase('hr_system.db');
        // var sqliteVersion =
        //     (await db.rawQuery('select sqlite_version()')).first.values.first;
        // print(sqliteVersion);
      } else {
        db = await openDatabase('hr_system.db', version: 1,
            onCreate: (db, version) {
          print('Database Created');
        }, singleInstance: true);
      }
      createTables();
    } catch (e) {
      print('Error:{$e}');
    }
  }

  Future<void> createTables() async {
    await db!.execute('CREATE TABLE $EmployeeTable '
        '(id INTEGER PRIMARY KEY '
        'AUTOINCREMENT,'
        ' empFirstName TEXT,'
        'empLastName TEXT,'
        ' empEmail TEXT,'
        ' empPhone TEXT,'
        ' empSalary ITEGER'
        ')');
  }
}
