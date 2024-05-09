import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Resturant Menu',
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Resturant Menu',
          style: TextStyle(
              color: Color(0XFF793420),
              fontStyle: FontStyle.italic,
              fontSize: 22),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            menuitem('vegetable_pizza.png', 'Vegetable Pizza'),
            menuitem('cheese_pizza.png', 'Cheese Pizza'),
            menuitem('box_of_fries.png', 'Box Of Fries'),
          ],
        ),
      ),
    ),
  ));
}

Container menuitem(String imagePath, String itemTitle) {
  return Container(
    margin: EdgeInsets.all(15.0),
    height: 100, // Fixed height
    decoration: BoxDecoration(
      color: Color(0xFFFF6100),
      borderRadius: BorderRadius.circular(5.0),
      boxShadow: [
        BoxShadow(
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 0.5,
            color: Colors.grey)
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(itemTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'cursive',
                  fontSize: 18)),
        ),
      ],
    ),
  );
}
