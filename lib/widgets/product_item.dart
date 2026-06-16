import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade200,
              ),
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imgUrl,
                  width: 160,
                  height: 95,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image);
                  },
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            ),
          ],
        ),
        Text(
          product.title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          product.category,
          style: textTheme.labelMedium?.copyWith(color: Colors.grey),
        ),
        Text(
          "\$${product.price}",
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
