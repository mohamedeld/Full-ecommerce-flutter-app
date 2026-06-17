import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/widgets/product_item.dart';
import 'package:ecommerce/widgets/section_header.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SectionHeader(
          title: "New Arrivals",
          linkText: "See All",
          linkRoute: "products",
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: dummyProducts.length,
          itemBuilder: (context, index) =>
              ProductItem(product: dummyProducts[index]),
        ),
      ],
    );
  }
}
