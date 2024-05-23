import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseHelper {
  Database? db;
  String EmployeeTable = "employees";

  DatabaseHelper() {
    initDb();
  }

  initDb() async {
    try {
      if (kIsWeb) {
        var factory = databaseFactoryFfiWeb;
        var db = await factory.openDatabase('hr_system.db',
            options: OpenDatabaseOptions(
                version: 1,
                onCreate: (db, version) async {
                  createTables();
                },
                singleInstance: true));
      } else {
        db = await openDatabase('hr_system.db', version: 1,
            onCreate: (db, version) {
          createTables();
          print('Database Created');
        }, singleInstance: true);
      }
    } catch (e) {
      print('Error:{$e}');
    }
  }

  Future<void> createTables() async {
    try {
      if (await db!.query('sqlite_master',
              where: 'name = ?', whereArgs: [EmployeeTable]) ==
          []) {
        await db!.execute('CREATE TABLE $EmployeeTable '
            '(id INTEGER PRIMARY KEY '
            'AUTOINCREMENT,'
            'empFirstName TEXT,'
            'empLastName TEXT,'
            'empEmail TEXT,'
            'empPhone TEXT,'
            'empSalary INTEGER'
            ')');
      }
    } catch (e) {
      print('table not created $e');
    }
  }
}
