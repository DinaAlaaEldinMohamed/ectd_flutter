import 'package:flutter/material.dart';
import 'package:task11_hotel_reservation_ui/utils/theme_utils.dart';
import '../utils/rooms_utils.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar('Rooms List'),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return rooms_list(context, rooms[index]);
        },
      ),
    );
  }
}
