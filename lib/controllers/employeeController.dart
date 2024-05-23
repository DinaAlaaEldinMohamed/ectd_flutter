import 'package:task10_employees/models/employees.dart';
import 'package:task10_employees/utils/database_helper.dart';

class EmployeeController {
  var con = DatabaseHelper();

  Future<int> addEmployee(Employee employee) async {
    try {
      final dbClient = con.db;
      int result = await dbClient!.insert('employees', employee.toJson());
      print('tavlllllllllllllllllllll inserted $result');
      print('dbconeccccccccccccc$dbClient');
      return result;
    } catch (e) {
      print('Error adding employee: $e');
      return -1;
    }
  }

  Future<List<Employee>?> getAllEmployees() async {
    await con.initDb();
    try {
      final dbClient = con.db;
      if (dbClient == null) {
        throw Exception('Database is not initialized');
      }
      var res = await dbClient.query('employees');
      print(res);
      List<Employee>? list =
          res.isNotEmpty ? res.map((c) => Employee.fromJson(c)).toList() : null;
      return list;
    } catch (e) {
      print('Error view employee: $e');
      return null;
    }
  }
}
