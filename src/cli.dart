import 'dart:io';
import 'employee.dart';

class CLI {
  List<Employee> employees = [];

  /// Run the CLI
  void run() {
    print("Employee CLI 1.0");
    while (true) {
      print("Do you want to: 1. CREATE, 2. UPDATE, 3. SEARCH, 4. REMOVE, 5. LIST or 0. EXIT");
      switch (int.parse(stdin.readLineSync() ?? "0")) {
        case 1:
          this.create;
        case 2:
          this.update;
        case 3:
          this.search;
        case 4:
          this.remove;
        case 5:
          this.display;
        default:
          exit(0);
      }
    }
  }

  /// Add a new [Employee] to the list
  void get create => employees.add(this.createEmployee);

  /// Update an existing [Employee]
  void get update {
    String name = this.name;
    int i = this.employees.indexWhere((e) => e.name == name);
    if (i >= 0) {
      this.employees[i] = this.createEmployee;
    } else {
      print("Employee does not exist!");
    }
  }

  /// Search for an existing [Employee]
  void get search {
    String name = this.name;
    print(this.employees.where((e) => e.name == name));
  }

  /// Remove an existing [Employee]
  void get remove {
    String name = this.name;
    this.employees.removeWhere((e) => e.name == name);
  }

  /// List all existing [Employee]'s
  void get display => print(this.toString());

  /// Create a new [Employee]
  Employee get createEmployee => Employee(this.name, this.phone, this.email, this.rate);

  /// get new [Employee] name as [String]
  String get name {
    String name = "";
    while (true) {
      print("Enter employee name: ");
      name = (stdin.readLineSync() ?? "").trim();
      if (name != "") {
        return name;
      }
    }
  }

  /// get new [Employee] phone as [String]
  String get phone {
    String phone = "";
    while (true) {
      print("Enter employee phone: ");
      phone = (stdin.readLineSync() ?? "").trim();
      if (phone != "") {
        return phone;
      }
    }
  }

  /// get new [Employee] email as [String]
  String get email {
    String email = "";
    while (true) {
      print("Enter employee email: ");
      email = (stdin.readLineSync() ?? "").trim();
      if (email != "") {
        return email;
      }
    }
  }

  /// get new [Employee] rate as [double]
  double get rate {
    double rate = 0;
    while (true) {
      print("Enter employee rate: ");
      String out = (stdin.readLineSync() ?? "").trim();
      if (out != "") {
        rate = double.parse(out);
        return rate;
      }
    }
  }

  @override
  String toString() => this.employees.join('\n');
}
