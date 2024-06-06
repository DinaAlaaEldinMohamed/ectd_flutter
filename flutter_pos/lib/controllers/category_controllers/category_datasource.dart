import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/models/category.dart';

class CategoryDataSource extends DataTableSource {
  List<Category>? categories;
  CategoryDataSource(this.categories);
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(Text('${categories?[index].id}')),
      DataCell(Text('${categories?[index].name}')),
      DataCell(Text('${categories?[index].description}')),
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
  int get rowCount => categories?.length ?? 0;

  @override
  int get selectedRowCount => 0;
}
