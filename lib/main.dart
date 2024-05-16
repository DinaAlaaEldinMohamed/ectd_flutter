import 'package:flutter/material.dart';
import 'package:flutter_day_7/pages/cheese_pizza.dart';
import 'package:flutter_day_7/pages/fires.dart';
import 'package:flutter_day_7/pages/home.dart';
import 'package:flutter_day_7/pages/vegetable_pizza.dart';
import 'package:flutter_day_7/pages/web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poetsen One'),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => Home());
          case '/webview':
            return MaterialPageRoute(
                builder: (_) => WebView(
                      websiteUrl: (settings.arguments as Map)['websiteUrl'],
                    ));
          case '/vpizza':
            return MaterialPageRoute(builder: (_) => Vpizza());
          case '/chpizza':
            return MaterialPageRoute(builder: (_) => Chpizza());
          case '/fries':
            return MaterialPageRoute(builder: (_) => Fries());

          default:
            return null;
        }
      },
      // routes: {
      //   '/': (context) => const Home(),
      //   '/vpizza': (context) => const Vpizza(),
      //   '/chpizza': (context) => const Chpizza(),
      //   '/fries': (context) => const Fries(),
      //   '/webview': (context) => WebView(websiteUrl: 'https://twitter.com')
      // },
    );
  }
}
