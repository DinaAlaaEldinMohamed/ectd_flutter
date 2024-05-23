import 'package:flutter/material.dart';
import 'package:task10_employees/utils/database_helper.dart';
import 'package:task10_employees/views/forms/add_employee.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sqlhelper = DatabaseHelper();
  await sqlhelper.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HR Simple App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AddEmpolyeeForm());
  }
}
