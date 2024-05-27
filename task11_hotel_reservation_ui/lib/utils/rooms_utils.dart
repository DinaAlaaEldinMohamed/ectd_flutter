import 'package:flutter/material.dart';
import 'package:task11_hotel_reservation_ui/models/rooms.dart';
import 'package:task11_hotel_reservation_ui/utils/theme_utils.dart';

String assetsPath = 'assets/images/rooms';

// Rooms list
List<Rooms> rooms = [
  Rooms(
    header: 'King Room',
    body: 'A room with a king-sized bed.',
    imagePath: '$assetsPath/r1.jpg',
  ),
  Rooms(
    header: 'Double Room',
    body: 'A room assigned to two people.',
    imagePath: '$assetsPath/r2.jpg',
  ),
  Rooms(
    header: 'Family Room',
    body: 'A room assigned to three or four people.',
    imagePath: '$assetsPath/r3.jpg',
  ),
];

Widget rooms_list(BuildContext context, Rooms room) {
  return ExpansionTile(
    title: app_text(text: room.header, color: Colors.orange, fontSize: 18),
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(room.imagePath),
            app_text(text: room.body, fontSize: 16, color: Colors.black),
            SizedBox(height: 8),
          ],
        ),
      ),
    ],
  );
}
