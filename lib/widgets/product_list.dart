import 'package:ecommerce/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce/widgets/product_item.dart';
import 'package:ecommerce/widgets/section_header.dart';

class ProductList extends StatelessWidget {
  final HomeLoaded state;
  const ProductList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final navigator = Navigator.of(context);
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
          itemCount: state.products.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              navigator.pushNamed(AppRoutes.productDetailsRoute);
            },
            child: ProductItem(product: state.products[index]),
          ),
        ),
      ],
    );
  }
}
