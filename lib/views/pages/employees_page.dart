import 'package:flutter/material.dart';
import 'package:task10_employees/controllers/employeeController.dart';
import 'package:task10_employees/utils/employees_utils.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key});

  @override
  State<EmployeesPage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeesPage> {
  var employeeController = EmployeeController();
  bool loading = true;
  var employeesList;

  Future<void> fetchAllEmployees() async {
    employeesList = await employeeController.getAllEmployees();
    setState(() {
      // loading = false;
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
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Employees Data',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: getemployeedatable(employeesList)),
      ),
    );
  }
}
