import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AddressContainer({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey3,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(Icons.add, size: 30),
              Text(title, style: textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}
