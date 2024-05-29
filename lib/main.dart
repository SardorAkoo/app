import 'dart:convert';
import 'package:app/controllers/controllers.dart';
import 'package:app/model/company.dart';
import 'package:app/views/home_screeens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final companyData = await loadCompanyData();
  runApp(MyApp(companyData: companyData));
}

Future<Company> loadCompanyData() async {
  final jsonString = await rootBundle.loadString('assets/data.json');
  final jsonResponse = json.decode(jsonString);
  return Company.fromJson(jsonResponse);
}

class MyApp extends StatelessWidget {
  final Company companyData;

  MyApp({required this.companyData});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompanyState()..loadCompanyData(companyData),
      child: MaterialApp(
        title: 'Company Info',
        home: CompanyScreen(),
      ),
    );
  }
}
