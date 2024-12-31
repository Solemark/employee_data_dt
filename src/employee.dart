class Employee {
  String name, phone, email;
  double rate;
  Employee(this.name, this.phone, this.email, this.rate);
  @override
  String toString() => "name: ${this.name}, phone: ${this.phone}, email: ${this.email}, rate: \$${this.rate}";
}
