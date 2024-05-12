import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String label;

  const MenuButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 0.2, color: Color.fromARGB(255, 196, 108, 7)),
          foregroundColor: Colors.orange,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
