import 'package:flutter/material.dart';
import 'package:flutter_pos/models/category.dart';
import 'package:flutter_pos/utils/sql_helper.dart';
import 'package:flutter_pos/widgets/custom_elevated_button.dart';
import 'package:flutter_pos/widgets/custom_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class AddCategory extends StatefulWidget {
  final Category? category;
  const AddCategory({this.category, super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  var nameTextEditingController = TextEditingController();
  var describtionTextEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category == null ? 'Add New' : 'Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                    labelText: 'Name',
                    controller: nameTextEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    labelText: 'Describtion',
                    controller: describtionTextEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Describtion is required';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                    label: widget.category == null ? 'Submit' : 'Edit',
                    onPressed: () async {
                      await onSubmit();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        var sqlHelper = GetIt.I.get<SqlHelper>();
        await sqlHelper.db!.insert(
            'categories',
            conflictAlgorithm: ConflictAlgorithm.replace,
            {
              'name': nameTextEditingController.text,
              'description': describtionTextEditingController.text,
            });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Category added Successfully',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error : $e',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
