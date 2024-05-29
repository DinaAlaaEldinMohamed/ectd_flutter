import 'package:flutter/material.dart';
import 'package:flutter_pos/utils/sql_helper.dart';
import 'package:flutter_pos/views/home.dart';
import 'package:get_it/get_it.dart';

///
///
/// Flutter POS is a flutter Point of Sale Application
///
///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sqlHelper = SqlHelper();
  await sqlHelper.initDb();
  if (sqlHelper.db != null) {
    GetIt.I.registerSingleton<SqlHelper>(sqlHelper);
  }
  runApp(const MyApp());
}

// void instance_init() async {
//   var sqlHelper = SqlHelper();
//   await sqlHelper.initDb();
//   if (sqlHelper.db != null) {
//     GetIt.I.registerSingleton<SqlHelper>(sqlHelper);
//   }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
