import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceCart extends StatelessWidget {
  final dynamic cubit;
  final ProductItemModel product;
  const ProductPriceCart({
    super.key,
    required this.product,
    required this.cubit,
  });

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
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
              current is AddedToCart || current is ProductAddingToCart,
          builder: (context, state) {
            if (state is ProductAddingToCart) {
              return ElevatedButton(
                onPressed: null,
                child: Center(
                  child: SizedBox(
                    width: 12,
                    height: 12,
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ),
              );
            } else {
              return ElevatedButton.icon(
                onPressed: () {
                  cubit.addToCart(product.id);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
                label: const Text("Add to Cart"),
                icon: const Icon(Icons.shopping_cart),
              );
            }
          },
        ),
      ],
    );
  }
}
