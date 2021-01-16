import 'package:flutter/material.dart';
import 'package:bakeryorderapp/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakery Order Login App',
      theme: ThemeData(
          accentColor: Colors.orange,
          primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}