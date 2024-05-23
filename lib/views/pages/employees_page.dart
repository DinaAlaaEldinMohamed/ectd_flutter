import 'package:flutter/material.dart';
import 'package:task10_employees/controllers/employeeController.dart';
import 'package:task10_employees/models/employees.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key});

  @override
  State<EmployeesPage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeesPage> {
  var employeeController = EmployeeController();
  bool loading = true;
  List<Employee>? employeesList;

  Future<void> fetchAllEmployees() async {
    employeesList = await employeeController.getAllEmployees();
    if (employeesList!.isEmpty) {
      print('''''' '''''' '$employeesList' '''''' '''''');
    }
    for (var employee in employeesList!) {
      print('Employee ID: ${employee.empId}');
      print('First Name: ${employee.empFirstName}');
      print('Last Name: ${employee.empLastName}');
      print('Email: ${employee.empEmail}');
      print('Salary: ${employee.empSalary}');
      print('Phone: ${employee.empPhoneNumber}');
      print('-----------------------------');
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees Data'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('First Name')),
              DataColumn(label: Text('Last Name')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Salary')),
              DataColumn(label: Text('Phone')),
            ],
            rows: employeesList != null
                ? employeesList!
                    .map(
                      (e) => DataRow(
                        cells: [
                          DataCell(
                            Container(
                              width: 100, // Adjust width as needed
                              child: Text(e.empId.toString() ?? ''),
                            ),
                          ),
                          DataCell(Text(e.empFirstName ?? '')),
                          DataCell(Text(e.empLastName ?? '')),
                          DataCell(Text(e.empEmail ?? '')),
                          DataCell(
                            Container(
                              width: 100, // Adjust width as needed
                              child: Text(e.empSalary.toString() ?? ''),
                            ),
                          ),
                          DataCell(Text(e.empPhoneNumber ?? '')),
                        ],
                      ),
                    )
                    .toList()
                : [],
          ),
        ),
      ),
    );
  }
}
