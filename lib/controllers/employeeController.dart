import 'package:task10_employees/models/employees.dart';
import 'package:task10_employees/utils/database_helper.dart';

class EmployeeController {
  DatabaseHelper con = new DatabaseHelper();

  Future<int> addEmployee(Employee employee) async {
    try {
      final dbClient = await con.db; // Get the database instance
      int result = await dbClient!.insert('Employee', employee.toMap());
      return result;
    } catch (e) {
      print('Error adding employee: $e');
      return -1;
    }
  }
}
