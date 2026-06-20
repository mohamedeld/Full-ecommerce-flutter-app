import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductPriceCart extends StatelessWidget {
  final ProductItemModel product;
  const ProductPriceCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${product.price}",
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
          ),
          label: const Text("Add to Cart"),
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
