import 'package:flutter/material.dart';
import 'package:ecommerce/models/category_model.dart';

class CategoryItemTab extends StatelessWidget {
  final CategoryModel category;
  const CategoryItemTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: category.bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                category.name,
                style: textTheme.titleLarge?.copyWith(
                  color: category.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${category.productsCount} products",
                style: textTheme.labelLarge?.copyWith(
                  color: category.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
