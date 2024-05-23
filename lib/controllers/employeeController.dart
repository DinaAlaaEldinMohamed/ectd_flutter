import 'package:task10_employees/models/employees.dart';
import 'package:task10_employees/utils/database_helper.dart';

class EmployeeController {
  DatabaseHelper con = new DatabaseHelper();

  Future<int> addEmployee(Employee employee) async {
    try {
      final dbClient = await con.db;
      int result = await dbClient!.insert('employees', employee.toMap());
      return result;
    } catch (e) {
      print('Error adding employee: $e');
      return -1;
    }
  }

  Future<List<Employee>?> getAllEmployees() async {
    var dbClient = await con.db;
    var res = await dbClient!.rawQuery('SELECT * FROM employees');

    List<Employee>? list =
        res.isNotEmpty ? res.map((c) => Employee.fromMap(c)).toList() : null;
    return list;
  }
}
