import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Stack(
          children: [
            Image.network(product.imgUrl),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            ),
          ],
        ),
        Text(product.title),
      ],
    );
  }
}
