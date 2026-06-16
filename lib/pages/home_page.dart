import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/navbar_widget.dart';
import 'package:ecommerce/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [NavbarWidget(), SizedBox(height: 8), ProductList()],
            ),
          ),
        ),
      ),
    );
  }
}
