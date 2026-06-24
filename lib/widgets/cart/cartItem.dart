import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/cart/cart_cubit.dart';
import 'package:ecommerce/widgets/CounterWidget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final bool isCheckout;
  final AddToCartModel cartItem;
  const CartItem({super.key, required this.cartItem, this.isCheckout = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl: cartItem.product.imgUrl,
              placeholder: (context, url) => const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.product.title, style: textTheme.titleMedium),
                Text.rich(
                  TextSpan(
                    text: "Size: ",
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: "${cartItem.size.name}",
                        style: textTheme.labelLarge,
                      ),
                    ],
                  ),
                  style: textTheme.labelLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${cartItem.product.price}",
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    !isCheckout
                        ? BlocBuilder<CartCubit, CartState>(
                            buildWhen: (previous, current) =>
                                current is QuantityCartLoaded,
                            builder: (context, state) {
                              // Get the quantity for this specific product
                              int quantity =
                                  BlocProvider.of<CartCubit>(
                                    context,
                                  ).quantities[cartItem.product.id] ??
                                  1;

                              if (state is QuantityCartLoaded) {
                                // Use the updated quantity from state
                                quantity =
                                    state.quantities[cartItem.product.id] ?? 1;
                              }

                              return Counterwidget(
                                value: quantity,
                                initialValue: cartItem.product.quantity ?? 1,
                                productId: cartItem.product.id,
                                cubit: BlocProvider.of<CartCubit>(context),
                              );
                            },
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
