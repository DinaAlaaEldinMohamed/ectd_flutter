import 'package:flutter/material.dart';
import 'package:flutter_day_7/widgets/app_bar.dart';
import 'package:flutter_day_7/widgets/hero_widget.dart';
import 'package:flutter_day_7/widgets/main_theme.dart';

class Fries extends StatelessWidget {
  const Fries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WowPizzaAppBar(title: 'WOW Pizza'),
      body: SingleChildScrollView(
        child: Column(
          children: [MainTheme(), HeroWidget(tag: 'box_of_fries.png')],
        ),
      ),
    );
  }
}
