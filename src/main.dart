import 'dart:io';
import 'employee.dart';

/// program entry point
void main() => _cli();

/// runs the cli component of the program
void _cli() {
  print("Employee CLI 1.0");
  List<Employee> employees = [];
  while (true) {
    print("Do you want to: 1. CREATE, 2. UPDATE, 3. SEARCH, 4. REMOVE or 0. EXIT");
    switch (int.parse(stdin.readLineSync() ?? "0")) {
      case 1:
        employees = [...employees, getData()];
      case 2:
        int i = employees.indexWhere((emp) => emp.name == getName());
        employees[i] = getData();
      case 3:
        print(employees.firstWhere((emp) => emp.name == getName()));
      case 4:
        employees.removeWhere((employee) => employee.name == getName());
      default:
        exit(0);
    }
  }
}

/// Create a new [Employee]
Employee getData() => Employee(getName(), getPhone(), getEmail(), getRate());

/// get new [Employee] name as [String]
String getName() {
  String? name = null;
  while (name == null) {
    print("Enter employee name: ");
    name = stdin.readLineSync();
  }
  return name;
}

/// get new [Employee] phone as [String]
String getPhone() {
  String? phone = null;
  while (phone == null) {
    print("Enter employee phone: ");
    phone = stdin.readLineSync();
  }
  return phone;
}

/// get new [Employee] email as [String]
String getEmail() {
  String? email = null;
  while (email == null) {
    print("Enter employee email: ");
    email = stdin.readLineSync();
  }
  return email;
}

/// get new [Employee] rate as [double]
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
