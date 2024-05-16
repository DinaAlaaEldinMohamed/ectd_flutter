import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WowPizzaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  //const WowPizzaAppBar();
  WowPizzaAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
      ),
      backgroundColor: Colors.orange,
      actions: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pushNamed(context, '/webview',
                    arguments: {'websiteUrl': 'https://twitter.com/'}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Icon(
                  Icons.facebook_outlined,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pushNamed(context, '/webview',
                    arguments: {'websiteUrl': 'https://facebook.com/'}),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
