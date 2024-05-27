import 'package:flutter/material.dart';
import 'package:task11_hotel_reservation_ui/views/home.dart';
import 'package:task11_hotel_reservation_ui/views/rooms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: {
        'home': (context) => HomePage(),
        'rooms': (context) => RoomsPage(),
      },
    );
  }
}
