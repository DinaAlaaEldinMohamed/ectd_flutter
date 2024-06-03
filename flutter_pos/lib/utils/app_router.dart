import 'package:flutter/material.dart';
import 'package:flutter_pos/views/categories/add_category.dart';
import 'package:flutter_pos/views/categories/categories.dart';
import 'package:flutter_pos/views/home.dart';
import 'package:flutter_pos/views/loading.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/categories':
        return MaterialPageRoute(builder: (_) => const Categories());
      case '/categories/add':
        return MaterialPageRoute(builder: (_) => const AddCategory());
      default:
        return MaterialPageRoute(builder: (_) => const Loading());
    }
  }
}
