import 'package:app/model/company.dart';
import 'package:flutter/material.dart';

class CompanyState extends ChangeNotifier {
  late Company _company;

  Company get company => _company;

  void loadCompanyData(Company company) {
    _company = company;
    notifyListeners();
  }

  void addEmployee(Employee employee) {
    _company.employees.add(employee);
    notifyListeners();
  }

  void editEmployee(int index, Employee employee) {
    _company.employees[index] = employee;
    notifyListeners();
  }

  void deleteEmployee(int index) {
    _company.employees.removeAt(index);
    notifyListeners();
  }

  void addProduct(Product product) {
    _company.products.add(product);
    notifyListeners();
  }

  void editProduct(int index, Product product) {
    _company.products[index] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    _company.products.removeAt(index);
    notifyListeners();
  }
}
