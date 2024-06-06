import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/controllers/category_controllers/category_controller.dart';
import 'package:flutter_pos/controllers/category_controllers/category_datasource.dart';
import 'package:flutter_pos/utils/const.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoryController _categoryController = Get.put(CategoryController());
  @override
  void initState() {
    _categoryController.getCategories(setState);

    // setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/categories/add');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.black, size: 26),
          ),
          child: PaginatedDataTable2(
            onPageChanged: (index) {
              // print
            },
            // availableRowsPerPage: const <int>[1],
            hidePaginator: false,
            empty: const Center(
              child: Text('No Data Found'),
            ),
            minWidth: 600,
            fit: FlexFit.tight,
            isHorizontalScrollBarVisible: true,
            rowsPerPage: 15,
            horizontalMargin: 20,
            checkboxHorizontalMargin: 12,
            columnSpacing: 20,
            wrapInCard: false,
            renderEmptyRowsInTheEnd: false,
            headingTextStyle:
                const TextStyle(color: primaryColor, fontSize: 18),
            headingRowColor:
                MaterialStatePropertyAll(Theme.of(context).primaryColorLight),
            border: TableBorder.all(color: Colors.grey),
            columns: const [
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Description')),
              DataColumn(label: Text('Actions')),
            ],
            source: CategoryDataSource(_categoryController.categories),
          ),
        ),
      ),
    );
  }
}
