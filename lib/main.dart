import 'package:flutter/material.dart';
import 'package:flutter_day_7/menu_buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poetsen One'),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'WOW Pizza',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
          backgroundColor: Colors.orange,
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.facebook_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuButton(label: 'Vegetable Pizza'),
                  MenuButton(label: 'Cheese Pizza'),
                  MenuButton(label: 'Fries'),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/pizza_meal.jpg',
                      height: 300,
                      width: 400,
                    ),
                    Text(
                      "Hi, I'm the Pizza Assistant, what can I help you order?",
                      style: TextStyle(fontSize: 26.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
