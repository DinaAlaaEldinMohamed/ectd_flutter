import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pos/models/product.dart';
import 'package:flutter_pos/utils/const.dart';
import 'package:flutter_pos/widgets/products_widgets/product_details_bottom_sheet.dart';
import 'package:flutter_pos/widgets/products_widgets/product_tile.dart';
//import 'package:flutter_pos/utils/const.dart';

class ProductDataSource extends DataTableSource {
  BuildContext? context;
  List<Product>? products;
  void Function(Product)? onUpdate;
  void Function(Product)? onDelete;
  ProductDataSource({
    required this.context,
    required this.products,
    required this.onUpdate,
    required this.onDelete,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      //DataCell(Text('${products?[index].productId}')),
      DataCell(
          GestureDetector(
            child: ProductTile(
              product: products?[index],
            ),
          ), onTap: () async {
        await onViewProduct(products![index], context);
      }),

      //DataCell(Text('${products?[index].productDescription}')),
      //DataCell(Text('${products?[index].owner}')),
      //DataCell(Text('${products?[index].price}')),
      DataCell(
          GestureDetector(
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context!).size.width * 0.25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${products?[index].stock}',
                      style: h5(
                        warningColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.unfold_more,
                      color: iconGrayColor,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          onTap: () {}),
      //DataCell(Text('${products?[index].isAvailable}')),
      // DataCell(Center(
      //   child: Image.network(products?[index].image ?? ''),
      // )),
      //DataCell(Text('${products?[index].categoryName}')),
      // DataCell(Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     IconButton(
      //       // icon: const Icon(Icons.edit),
      //       onPressed: () {
      //         onUpdate!(products![index]);
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(
      //         Icons.delete,
      //         color: Colors.red,
      //       ),
      //       onPressed: () {
      //         onDelete!(products![index]);
      //       },
      //     ),
      //   ],
      //   )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products?.length ?? 0;

  @override
  int get selectedRowCount => 0;
  Future<void> onViewProduct(Product product, context) async {
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
