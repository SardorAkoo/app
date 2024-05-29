import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/controllers/controllers.dart';
import 'package:app/model/company.dart';

class CompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var companyState = Provider.of<CompanyState>(context);
    var company = companyState.company;

    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Location: ${company.location}'),
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text('Employees:'),
              children: company.employees.map((employee) {
                int index = company.employees.indexOf(employee);
                return ListTile(
                  title: Text(employee.name),
                  subtitle: Text('Position: ${employee.position}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Add edit functionality
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          companyState.deleteEmployee(index);
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text('Products:'),
              children: company.products.map((product) {
                int index = company.products.indexOf(product);
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(
                      'Price: \$${product.price}, In Stock: ${product.inStock}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Add edit functionality
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          companyState.deleteProduct(index);
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new employee or product
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
