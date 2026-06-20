import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String description;
  const ProductDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: textTheme.bodyLarge),
        Text(
          description,
          style: textTheme.labelMedium?.copyWith(color: AppColors.black45),
        ),
      ],
    );
  }
}
