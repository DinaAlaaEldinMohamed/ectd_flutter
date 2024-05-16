import 'package:flutter/material.dart';
import 'package:flutter_day_7/widgets/app_bar.dart';
import 'package:flutter_day_7/widgets/main_theme.dart';

class Chpizza extends StatelessWidget {
  const Chpizza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WowPizzaAppBar(title: 'WOW Pizza'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainTheme(),
            Hero(
              tag: 'cheese_pizza.png',
              transitionOnUserGestures: true,
              placeholderBuilder: (context, heroSize, child) {
                return Container(
                  width: heroSize.width,
                  height: heroSize.height,
                  color: Colors.red, // لون البديل
                );
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/cheese_pizza.png'),
                        fit: BoxFit.cover)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
