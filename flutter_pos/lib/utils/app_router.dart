import 'package:flutter/material.dart';
import 'package:flutter_pos/views/categories/category_ops.dart';
import 'package:flutter_pos/views/categories/categories.dart';
import 'package:flutter_pos/views/home.dart';
import 'package:flutter_pos/views/loading.dart';
import 'package:flutter_pos/views/products/products_ops.dart';
import 'package:flutter_pos/views/products/products_page.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/products':
        return MaterialPageRoute(builder: (_) => const ProductsPage());
      case '/products/add':
        return MaterialPageRoute(builder: (_) => const ProductsOps());
      case '/categories':
        return MaterialPageRoute(builder: (_) => const CategoriesPage());
      case '/categories/add':
        return MaterialPageRoute(builder: (_) => const AddCategory());
      default:
        return MaterialPageRoute(builder: (_) => const Loading());
    }
  }
}
