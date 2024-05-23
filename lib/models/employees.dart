class Employee {
  //int empId ;
  String empFirstName;
  String empLastName;
  String empPhoneNumber;
  String empEmail;
  double empSalary;
  Employee(
      {required this.empFirstName,
      required this.empLastName,
      this.empPhoneNumber = '',
      this.empEmail = '',
      this.empSalary = 0});
  // Employee.fromMap(dynamic obj) {
  //   this.empId = obj['id'];
  //   this.empLastName = obj['empLastName'];
  //   this.empFirstName = obj['empFirstName'];
  //   this.empPhoneNumber = obj['empPhoneNumber'];
  //   this.empEmail = obj['empEmail'];
  //   this.empSalary = obj['empSalary'];
  // }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    //map["id"] = empId;
    map["empFirstName"] = empFirstName;
    map["empLastName"] = empLastName;
    map["empEmail"] = empEmail;
    map["empSalary"] = empSalary;
    map["empPhoneNumber"] = empPhoneNumber;

    return map;
  }
}
