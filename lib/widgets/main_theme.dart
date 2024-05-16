import 'package:flutter/material.dart';
import 'package:flutter_day_7/widgets/menu_buttons.dart';

class MainTheme extends StatelessWidget {
  const MainTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(label: 'Vegetable Pizza', routeName: '/vpizza'),
              MenuButton(label: 'Cheese Pizza', routeName: '/chpizza'),
              MenuButton(label: 'Fries', routeName: '/fries'),
            ],
          ),
        ],
      ),
    );
  }
}
