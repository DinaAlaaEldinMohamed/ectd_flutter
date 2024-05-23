import 'package:flutter/material.dart';

Widget getemployeedatable(List employeelist) {
  List<DataRow> rows = [];

  employeelist.forEach((e) {
    rows.add(DataRow(
      cells: [
        DataCell(
          Container(
            width: 100,
            child: Text(e.empId.toString() ?? ''),
          ),
        ),
        DataCell(Text(e.empFirstName ?? '')),
        DataCell(Text(e.empLastName ?? '')),
        DataCell(Text(e.empEmail ?? '')),
        DataCell(
          Container(
            width: 100,
            child: Text(e.empSalary.toString() ?? ''),
          ),
        ),
        DataCell(Text(e.empPhoneNumber ?? '')),
      ],
    ));
  });

  return DataTable(
    headingRowColor: MaterialStatePropertyAll(Colors.amber),
    columns: [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('First Name')),
      DataColumn(label: Text('Last Name')),
      DataColumn(label: Text('Email')),
      DataColumn(label: Text('Salary')),
      DataColumn(label: Text('Phone')),
    ],
    rows: rows,
  );
}
