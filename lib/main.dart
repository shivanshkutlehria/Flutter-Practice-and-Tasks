import 'package:flutter/material.dart';
import 'package:project_1/screens/customerDetails.dart';
import 'package:project_1/screens/servicesScreen.dart';
import 'package:project_1/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'Welcome To App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
      home: ServicesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
