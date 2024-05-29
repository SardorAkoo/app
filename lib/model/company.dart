import 'dart:convert';

class Company {
  final String name;
  final String location;
  final List<Employee> employees;
  final List<Product> products;

  Company(
      {required this.name,
      required this.location,
      required this.employees,
      required this.products});

  factory Company.fromJson(Map<String, dynamic> json) {
    var employeesFromJson = json['employees'] as List;
    List<Employee> employeeList =
        employeesFromJson.map((i) => Employee.fromJson(i)).toList();

    var productsFromJson = json['products'] as List;
    List<Product> productList =
        productsFromJson.map((i) => Product.fromJson(i)).toList();

    return Company(
      name: json['company'],
      location: json['location'],
      employees: employeeList,
      products: productList,
    );
  }
}

class Employee {
  final String name;
  final int age;
  final String position;
  final List<String> skills;

  Employee(
      {required this.name,
      required this.age,
      required this.position,
      required this.skills});

  factory Employee.fromJson(Map<String, dynamic> json) {
    var skillsFromJson = json['skills'];
    List<String> skillList = List<String>.from(skillsFromJson);

    return Employee(
      name: json['name'],
      age: json['age'],
      position: json['position'],
      skills: skillList,
    );
  }
}

class Product {
  final String name;
  final double price;
  final bool inStock;

  Product({required this.name, required this.price, required this.inStock});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'].toDouble(),
      inStock: json['inStock'],
    );
  }
}
