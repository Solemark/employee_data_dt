import 'dart:io';
import 'employee.dart';

void main() => _cli();

void _cli() {
  print("Employee CLI 1.0");
  List<Employee> employees = [];
  while (true) {
    print("Do you want to: 1. CREATE, 2. UPDATE, 3. SEARCH, 4. REMOVE or 0. EXIT");
    switch (int.parse(stdin.readLineSync() ?? "0")) {
      case 1:
        employees = [...employees, getData()];
      case 2:
        employees = updateEmp(employees);
      case 3:
        print(employees.firstWhere((emp) => emp.name == getName()));
      case 4:
        employees.removeWhere((employee) => employee.name == getName());
      default:
        exit(0);
    }
  }
}

List<Employee> updateEmp(List<Employee> employees) {
  String name = getName();

  for (int i = 0; i < employees.length; i++) {
    if (name == employees[i].name) {
      employees[i] = getData();
      break;
    }
  }

  return employees;
}

Employee getData() => Employee(getName(), getPhone(), getEmail(), getRate());

String getName() {
  String? name = null;
  while (name == null) {
    print("Enter employee name: ");
    name = stdin.readLineSync();
  }
  return name;
}

String getPhone() {
  String? phone = null;
  while (phone == null) {
    print("Enter employee phone: ");
    phone = stdin.readLineSync();
  }
  return phone;
}

String getEmail() {
  String? email = null;
  while (email == null) {
    print("Enter employee email: ");
    email = stdin.readLineSync();
  }
  return email;
}

double getRate() {
  double? rate = null;
  while (rate == null) {
    print("Enter employee rate: ");
    String? out = stdin.readLineSync();
    if (out != null) {
      rate = double.parse(out);
    }
  }
  return rate;
}
