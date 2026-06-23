import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/product_details/product_details_cubit.dart';
import 'package:ecommerce/widgets/CounterWidget.dart';
import 'package:ecommerce/widgets/product_details/product_description.dart';
import 'package:ecommerce/widgets/product_details/product_price_cart.dart';
import 'package:ecommerce/widgets/product_details/product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsContent extends StatelessWidget {
  final ProductItemModel product;
  const ProductDetailsContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.28),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey3,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, style: textTheme.titleLarge),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.star, color: AppColors.yellow, size: 25),
                          const SizedBox(width: 5),
                          Text(
                            product.avgRate.toString(),
                            style: textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                    bloc: cubit,
                    buildWhen: (prev, current) =>
                        current is QuantityDetailsLoaded ||
                        current is ProductDetailsLoaded,
                    builder: (context, state) {
                      // Get quantity from cubit's map or default to 1
                      int quantity = cubit.productQuantities[product.id] ?? 1;

                      if (state is QuantityDetailsLoaded) {
                        quantity = state.value;
                      } else if (state is ProductDetailsLoaded) {
                        quantity = cubit.productQuantities[product.id] ?? 1;
                      }

                      return Counterwidget(
                        value: quantity,
                        productId: product.id,
                        cubit: cubit,
                        initialValue: quantity,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 7),
              ProductSizeItem(cubit: cubit),
              SizedBox(height: 7),
              ProductDescription(description: product.description),
              const Spacer(),
              ProductPriceCart(product: product, cubit: cubit),
            ],
          ),
        ),
      ),
    );
  }
}
