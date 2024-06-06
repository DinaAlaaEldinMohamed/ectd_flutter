import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/controllers/product_controllers/product_controller.dart';
import 'package:flutter_pos/controllers/product_controllers/product_datasource.dart';
import 'package:flutter_pos/utils/const.dart';
import 'package:flutter_pos/widgets/app_table.dart';
import 'package:get/get.dart';

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
                minWidth: 1100,
                columns: const [
                  DataColumn(label: Text('Id')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Description')),
                  DataColumn(label: Text('owner')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Stock')),
                  DataColumn(label: Text('isAvaliable')),
                  DataColumn(label: Center(child: Text('image'))),
                  DataColumn(label: Text('Cat Name')),
                  DataColumn(label: Center(child: Text('Actions'))),
                ],
                source: ProductDataSource(
                    products: _productController.products,
                    onUpdate: (product) async {},
                    onDelete: (product) async {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
