import 'package:flutter/material.dart';
import 'package:milk_delivery_app/Home_Page.dart';

import 'SignUpPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
