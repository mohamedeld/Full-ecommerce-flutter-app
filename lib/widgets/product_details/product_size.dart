import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductSizeItem extends StatelessWidget {
  const ProductSizeItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size", style: textTheme.bodyLarge),
        Row(
          children: [
            ...ProductSize.values.map(
              (size) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: () {},
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.grey2,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(size.name),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
