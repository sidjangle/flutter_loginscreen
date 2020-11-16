import 'package:flutter/material.dart';
import 'package:loginscreen/otp.dart';
import 'package:loginscreen/welcome.dart';
//routes
import './all_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Welcome(),
      routes: allRoutes(context),
    );
  }
}
