import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/models/product.dart';

class ProductDataSource extends DataTableSource {
  List<Product>? products;
  void Function(Product)? onUpdate;
  void Function(Product)? onDelete;
  ProductDataSource(
      {required this.products, required this.onUpdate, required this.onDelete});
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(Text('${products?[index].productId}')),
      DataCell(Text('${products?[index].productName}')),
      DataCell(Text('${products?[index].productDescription}')),
      DataCell(Text('${products?[index].owner}')),
      DataCell(Text('${products?[index].price}')),
      DataCell(Text('${products?[index].stock}')),
      DataCell(Text('${products?[index].isAvailable}')),
      DataCell(Center(
        child: Image.network(products?[index].image ?? ''),
      )),
      DataCell(Text('${products?[index].categoryName}')),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products?.length ?? 0;

  @override
  int get selectedRowCount => 0;
}
