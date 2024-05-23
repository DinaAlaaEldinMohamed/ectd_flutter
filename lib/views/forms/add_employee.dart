import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:task10_employees/controllers/employeeController.dart';
import 'package:task10_employees/models/employees.dart';
import 'package:task10_employees/widgets/custom_text_form_field.dart';

class AddEmpolyeeForm extends StatefulWidget {
  const AddEmpolyeeForm({super.key});

  @override
  State<AddEmpolyeeForm> createState() => _AddEmpolyeeFormState();
}

class _AddEmpolyeeFormState extends State<AddEmpolyeeForm> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final EmployeeController employeeController = EmployeeController();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Employee'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 150,
                          child: Image.asset('assets/images/hr_logo.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        controller: firstNameController,
                        hintText: 'Enter First Name',
                        labelText: 'First Name',
                        icon: Icons.person,
                        iconColor: Colors.amber,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter first name'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 character'),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        controller: lastNameController,
                        hintText: 'Enter last Name',
                        labelText: 'Last Name',
                        icon: Icons.person,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter last named'),
                          MinLengthValidator(3,
                              errorText:
                                  'Last name should be atleast 3 charater'),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        controller: emailController,
                        hintText: 'Enter Email',
                        labelText: 'Email',
                        icon: Icons.email,
                        iconColor: Colors.pink,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter email address'),
                          EmailValidator(errorText: 'Invaild  email address !'),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        controller: phoneController,
                        labelText: 'mobile',
                        hintText: 'Enter Employee Mobile',
                        icon: Icons.phone,
                        iconColor: Colors.green,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter mobile number'),
                          PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
                              errorText: 'enter vaid mobile number'),
                        ]),
                      ),
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        child: ElevatedButton(
                            child: Text(
                              'Add Employee',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 18),
                            ),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                final newEmployee = Employee(
                                  empFirstName: firstNameController.text,
                                  empLastName: lastNameController.text,
                                  empEmail: emailController.text,
                                  empPhoneNumber: phoneController.text,
                                );

                                int result = await employeeController
                                    .addEmployee(newEmployee);
                                if (result > 0) {
                                  print('Employee added successfully!');
                                } else {
                                  print('Failed to add employee');
                                }
                              }
                            }),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                      ),
                    )),
                  ],
                )),
          ),
        ));
  }
}
