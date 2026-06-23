import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TotalAndSubtotal extends StatelessWidget {
  final String label;
  final double value;
  const TotalAndSubtotal({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textTheme.titleMedium?.copyWith(color: AppColors.grey),
        ),
        Text("\$${value.toStringAsFixed(2)}", style: textTheme.titleMedium),
      ],
    );
  }
}
