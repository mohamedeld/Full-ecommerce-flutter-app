import 'package:ecommerce/pages/custom_bottom_navbar.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        body: Center(child: Text("white")),
        bottomNavigationBar: CustomBottomNavbar(),
      ),
    );
  }
}
