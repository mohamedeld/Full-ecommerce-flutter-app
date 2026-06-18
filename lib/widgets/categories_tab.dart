import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/widgets/Category_item_tab.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: dummyCategories.length,
            itemBuilder: (context, index) =>
                CategoryItemTab(category: dummyCategories[index]),
          ),
        ),
      ],
    );
  }
}
