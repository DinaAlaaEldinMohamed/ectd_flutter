import 'package:flutter/material.dart';
import '../utils/theme_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar('Android ATC Hotel'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image(
              image: AssetImage('$assetsPath/hotel_entrance.jpg'),
            ),
            date_picker(
              context: context,
              text: 'Check-in Date :  ',
              setStateCallBack: setState,
              type: 'CheckIn',
            ),
            date_picker(
                context: context,
                text: 'Check-out Date :  ',
                setStateCallBack: setState,
                type: 'CheckOut'),
            custom_slider(
                text: 'Adults: ', type: 'adult', setStateCallBack: setState),
            custom_slider(
                text: 'Childern: ', type: 'child', setStateCallBack: setState),
            multi_select(context),
            app_text(text: 'View:'),
            radio_buttons_group(context, setState),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'rooms');
                  },
                  child: app_text(
                      text: 'Check Rooms', color: Colors.white, fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
