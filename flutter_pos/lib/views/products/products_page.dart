import 'package:flutter/material.dart';
import 'package:flutter_pos/controllers/product_controllers/product_controller.dart';
import 'package:flutter_pos/controllers/product_controllers/product_datasource.dart';
import 'package:flutter_pos/models/product.dart';
import 'package:flutter_pos/utils/sql_helper.dart';
import 'package:flutter_pos/widgets/app_table.dart';
import 'package:flutter_pos/widgets/products_widgets/product_details_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductController _productController = Get.put(ProductController());
  @override
  void initState() {
    _productController.getProducts(setState);

    // setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              var result = await Navigator.pushNamed(context, '/products/add');

              if (result == true) {
                _productController.getProducts(setState);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (text) async {
                if (text == '') {
                  _productController.getProducts(setState);
                } else {
                  _productController.searchProducts(text);
                }

                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                labelText: 'Search',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: AppTable(
                minWidth: 500,
                columns: const [
                  // DataColumn(label: Text('Id')),
                  DataColumn(label: Text('')),
                  // DataColumn(label: Text('Description')),
                  // DataColumn(label: Text('owner')),
                  // DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Stock')),
                  //  DataColumn(label: Text('isAvaliable')),
                  // DataColumn(label: Center(child: Text('image'))),
                  //  DataColumn(label: Text('Cat Name')),
                  // DataColumn(label: Center(child: Text('Actions'))),
                ],
                source: ProductDataSource(
                    context: context,
                    products: _productController.products,
                    onUpdate: (product) async {
                      await onViewProduct(product);
                    },
                    onDelete: (product) async {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onDeletePorduct(Product product) async {
    try {
      var dialogResult = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Delete Product'),
              content:
                  const Text('Are you sure you want to delete this product?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Delete'),
                ),
              ],
            );
          });

      if (dialogResult ?? false) {
        var sqlHelper = GetIt.I.get<SqlHelper>();
        await sqlHelper.db!.delete('categories',
            where: 'id =?', whereArgs: [product.productId]);
        _productController.products;
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error in deleting category ${product.productName}')));
    }
  }

  Future<void> onViewProduct(Product product) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      builder: (_) {
        return ProductDetailsBottomSheet(
          product: product,
        );
      },
    );
  }
}
