import 'package:flutter/material.dart';
import 'package:flutter_pos/utils/app_router.dart';
import 'package:flutter_pos/utils/const.dart';
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
  await createInstance();
  runApp(const MyApp());
}

Future<void> createInstance() async {
  var sqlHelper = SqlHelper();
  await sqlHelper.initDb();
  if (sqlHelper.db != null) {
    GetIt.I.registerSingleton<SqlHelper>(sqlHelper);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor, foregroundColor: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        colorScheme: ColorScheme.fromSwatch(
            errorColor: Colors.red,
            cardColor: Colors.blue.shade100,
            backgroundColor: Colors.white,
            primarySwatch: getMaterialColor(primaryColor)),
      ),
      home: const HomePage(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
