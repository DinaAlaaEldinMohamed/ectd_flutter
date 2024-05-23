class Employee {
  int? empId;
  String? empFirstName;
  String? empLastName;
  String? empPhoneNumber;
  String? empEmail;
  int? empSalary;
  Employee(
      {this.empId,
      required this.empFirstName,
      required this.empLastName,
      this.empPhoneNumber = '',
      this.empEmail = '',
      this.empSalary = 0});

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = empId;
    map["empFirstName"] = empFirstName;
    map["empLastName"] = empLastName;
    map["empEmail"] = empEmail;
    map["empSalary"] = empSalary;
    map["empPhone"] = empPhoneNumber;

    return map;
  }

  Employee.fromMap(Map<String, dynamic> obj) {
    empId = obj['id'];
    empFirstName = obj['empFirstName'];
    empLastName = obj['empLastName'];
    empEmail = obj['empEmail'];
    empSalary = obj['empSalary'];
    empPhoneNumber = obj['empPhone'];
  }
}
