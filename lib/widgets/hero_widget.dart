import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroWidget extends StatelessWidget {
  String tag;
  HeroWidget({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      transitionOnUserGestures: true,
      placeholderBuilder: (context, heroSize, child) {
        return Container(
          width: heroSize.width,
          height: heroSize.height,
          color: const Color.fromARGB(255, 217, 214, 213), // لون البديل
        );
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/$tag'), fit: BoxFit.cover)),
      ),
    );
  }
}
