import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SqlHelper {
  var path = 'pos_db6.db';
  Database? db;
  Future<void>? registerForeignKeys() async {
    await db!.execute("""PRAGMA foreign_keys = ON""");
    await db!.rawQuery(""" PRAGMA foreign_keys """);
    //
  }

  Future<bool> createTables() async {
    try {
      var batch = db!.batch();
      await registerForeignKeys();
      batch.rawQuery(""" PRAGMA foreign_keys """);

      batch.execute("""
      Create table If not exists categories(
      id integer primary key,
      name text,
      description text
      )""");
      batch.execute("""
      Create table If not exists products(
      productId integer primary key,
      productName text,
      productDescription text,
      owner text,
      price double,
      stock integer,
      isAvaliable boolean,
      image blob,
      categoryId integer
      )""");
      batch.execute("""
      Create table If not exists clients(
      id integer primary key,
      name text,
      email text,
      phone text,
      address text
      )""");
      batch.execute("""
      Create table If not exists bills(
      id integer primary key,
      total_amount integer,
      payment_method text,
      client_id integer
      )""");
      batch.execute("""
      Create table If not exists transactions(
      id integer primary key,
      count integer,
      product_id integer,
      bill_id integer
      )""");
      var result = await batch.commit();
      print('tables Created Successfully: $result');
      return true;
    } catch (e) {
      print('error in create tables $e');
      return false;
    }
  }

  Future<void> initDb() async {
    try {
      if (kIsWeb) {
        var factory = databaseFactoryFfiWeb;
        db = await factory.openDatabase(path);
        print(
            '=================== Database Created Successfully on web=====================');
      } else {
        db = await openDatabase(
          path,
          version: 1,
          onCreate: (db, version) {
            print(
                '=================== Database Created Successfully=====================');
          },
        );
      }
    } catch (e) {
      print(
          '=====================Attention there is an error on creating DB ::==========>> $e');
    }
  }
}
