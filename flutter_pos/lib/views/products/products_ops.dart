import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pos/models/product.dart';
import 'package:flutter_pos/utils/const.dart';
import 'package:flutter_pos/utils/image_utils.dart';
import 'package:flutter_pos/utils/sql_helper.dart';
import 'package:flutter_pos/widgets/category_drop_down.dart';
import 'package:flutter_pos/widgets/custom_elevated_button.dart';
import 'package:flutter_pos/widgets/custom_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class ProductsOps extends StatefulWidget {
  final Product? product;
  const ProductsOps({this.product, super.key});

  @override
  State<ProductsOps> createState() => _ProductsOpsState();
}

class _ProductsOpsState extends State<ProductsOps> {
  bool isUploading = false;
  File? imageFile;
  TextEditingController? nameController;
  TextEditingController? descriptionController;
  TextEditingController? priceController;
  TextEditingController? stockController;
  TextEditingController? ownerController;
  TextEditingController? imageController;
  int? selectedCategoryId;
  bool? isAvailable;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController =
        TextEditingController(text: widget.product?.productName ?? '');
    descriptionController =
        TextEditingController(text: widget.product?.productDescription ?? '');
    priceController =
        TextEditingController(text: '${widget.product?.price ?? ''}');
    stockController =
        TextEditingController(text: '${widget.product?.stock ?? ''}');
    ownerController = TextEditingController(text: widget.product?.owner ?? '');
    imageController = TextEditingController(text: widget.product?.image ?? '');
    selectedCategoryId = widget.product?.categoryId;
    isAvailable = widget.product?.isAvailable;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          'New Product',
          style: TextStyle(
            color: primaryUltraLightColor,
          ),
        ),
      ),
      body: isUploading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: imageFile != null
                                ? Image.file(imageFile!,
                                    width: 80, height: 80, fit: BoxFit.cover)
                                : Container(
                                    width: 86,
                                    height: 86,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF80B2FF),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 40,
                                    ),
                                  ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => imageDialog(),
                            );
                          }),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: Form(
                        key: formKey,
                        child: Wrap(
                          runSpacing: 20,
                          children: [
                            CustomTextField(
                                labelText: 'Name',
                                controller: nameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name is required';
                                  }
                                  return null;
                                }),
                            CustomTextField(
                                labelText: 'Description',
                                controller: descriptionController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Description is required';
                                  }
                                  return null;
                                }),
                            CustomTextField(
                                labelText: 'Owner',
                                controller: ownerController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'owner is required';
                                  }
                                  return null;
                                }),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                      labelText: 'Price',
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      controller: priceController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'price is required';
                                        }
                                        return null;
                                      }),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                      labelText: 'Stock',
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      controller: stockController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Stock is required';
                                        }
                                        return null;
                                      }),
                                ),
                              ],
                            ),
                            CustomTextField(
                              labelText: 'Image Url',
                              controller: imageController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Image url is required';
                                }
                                return null;
                              },
                            ),
                            CategoriesDropDown(
                              selectedValue: selectedCategoryId,
                              onChanged: (value) {
                                selectedCategoryId = value;
                                setState(() {});
                              },
                            ),
                            Row(
                              children: [
                                Text(
                                  'Is Product Avaliable ?',
                                  style: bodyText(textPlaceholderColor),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Switch(
                                    value: isAvailable ?? false,
                                    onChanged: (value) {
                                      setState(() {
                                        isAvailable = value;
                                      });
                                    }),
                              ],
                            ),
                            CustomElevatedButton(
                                label:
                                    widget.product == null ? 'Submit' : 'Edit',
                                onPressed: () async {
                                  await onSubmit();
                                })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        var sqlHelper = GetIt.I.get<SqlHelper>();

        if (widget.product == null) {
          // Add Category Logic
          await sqlHelper.db!.insert(
              'products',
              conflictAlgorithm: ConflictAlgorithm.replace,
              {
                'productName': nameController?.text,
                'productDescription': descriptionController?.text,
                'owner': ownerController?.text,
                'price': double.parse(priceController?.text ?? '0.0'),
                'stock': int.parse(stockController?.text ?? '0'),
                'image': imageController?.text,
                'categoryId': selectedCategoryId,
                'isAvaliable': isAvailable ?? false,
              });
        } else {}

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              widget.product == null
                  ? 'Product added Successfully'
                  : 'Product Updated Successfully',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error : $e',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
