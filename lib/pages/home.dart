import 'package:flutter/material.dart';
import 'package:flutter_day_7/widgets/app_bar.dart';
import 'package:flutter_day_7/widgets/main_theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WowPizzaAppBar(title: 'WOW Pizza'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainTheme(),
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
    );
  }
}
