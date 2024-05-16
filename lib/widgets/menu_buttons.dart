import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String label;
  final String routeName;

  const MenuButton({super.key, required this.label, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(
                    width: 0.2, color: Color.fromARGB(255, 196, 108, 7)),
                foregroundColor: Colors.orange,
                padding: EdgeInsets.all(15),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(20),
                //),
              ),
              onPressed: () {
                Navigator.pushNamed(context, routeName);
              },
              child: Text(label),
            ),
          ],
        ));
  }
}
