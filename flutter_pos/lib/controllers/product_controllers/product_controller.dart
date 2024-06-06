import 'package:flutter_pos/models/product.dart';
import 'package:flutter_pos/utils/sql_helper.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ProductController extends GetxController {
  List<Product>? products;
  var sqlHelper = GetIt.I.get<SqlHelper>();

  void getProducts(Function setStateCallBack) async {
    try {
      //products = [];
      var data = await sqlHelper.db!.rawQuery("""
  Select P.*,C.name as categoryName,C.description as categoryDescription from products P
  Inner JOIN categories C
  On P.categoryId = C.id
  """);

      if (data.isNotEmpty) {
        products = [];
        for (var item in data) {
          products?.add(Product.fromJson(item));
        }
      } else {
        products = [];
      }
    } catch (e) {
      products = [];
      print('Error in get Products $e');
    }
    setStateCallBack(() {});
  }

  void searchProducts(String text) async {
    try {
      products = [];
      var data = await sqlHelper.db!.rawQuery("""
                Select * from products 
                where productName like '%$text%' OR productDescription like '%$text%' 
                """);
      if (data.isNotEmpty) {
        products = [];
        for (var item in data) {
          products?.add(Product.fromJson(item));
        }
      } else {
        products = [];
      }
    } catch (e) {
      products = [];
      print('Error in get Products $e');
    }
  }
}
