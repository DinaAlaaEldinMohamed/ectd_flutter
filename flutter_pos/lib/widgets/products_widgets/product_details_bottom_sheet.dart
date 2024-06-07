import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/controllers/product_controllers/product_controller.dart';
import 'package:flutter_pos/models/product.dart';
import 'package:flutter_pos/utils/const.dart';
import 'package:flutter_pos/views/products/products_ops.dart';
import 'package:flutter_pos/widgets/buttons/secondary_button.dart';
import 'package:flutter_pos/widgets/products_widgets/product_row.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductDetailsBottomSheet extends StatefulWidget {
  Product? product;
  Category? category;
  ProductDetailsBottomSheet({super.key, this.product, this.category});

  @override
  State<ProductDetailsBottomSheet> createState() =>
      _ProductDetailsBottomSheetState();
}

class _ProductDetailsBottomSheetState extends State<ProductDetailsBottomSheet> {
  final ProductController _productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                      child: Image.network(widget.product?.image ?? ''),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product?.productName ?? '',
                          style: h1(Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Category: ${widget.product?.categoryName ?? ''}',
                          style: bodyText(lightGrayColor),
                        ),
                        const Divider(),
                        //product code row
                        CustomRow(
                            label: 'Code',
                            value: '122999999999999',
                            style: h6(Colors.black)),
                        //in stock row
                        CustomRow(
                          label: 'In Stock',
                          value: '${widget.product?.stock ?? 0}',
                          style: h6(warningColor),
                        ),
                        CustomRow(
                          label: 'Price',
                          value: '${widget.product?.price ?? 0}',
                          style: h6(Colors.black),
                          divide: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SecondaryButton(label: 'Stock in/out', onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              SecondaryButton(
                  label: 'Edit Product',
                  onPressed: () async {
                    var result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => ProductsOps(
                                  product: widget.product,
                                )));

                    if (result ?? false) {
                      _productController.getProducts(setState);
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: veryLightGrayColor),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SecondaryButton(
                    backgroundColor: primaryColor,
                    textColor: whiteColor,
                    label: 'Make Sale',
                    onPressed: () {},
                  )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
