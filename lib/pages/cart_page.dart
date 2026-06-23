import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/cart/cart_cubit.dart';
import 'package:ecommerce/widgets/cart/cartItem.dart';
import 'package:ecommerce/widgets/cart/cart_total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartItems(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              // Get the current cart items and subtotal
              List<AddToCartModel> currentCartItems = [];
              double currentSubTotal = 0.0;

              if (state is CartLoaded) {
                currentCartItems = state.cartItems;
                currentSubTotal = state.subTotal;
              } else if (state is QuantityCartLoaded) {
                // Use dummyCart for the latest items
                currentCartItems = dummyCart;
                currentSubTotal = state.subTotal;
              }

              if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (state is CartError) {
                return Center(child: Text(state.message));
              }

              if (currentCartItems.isEmpty) {
                return const Center(child: Text("Your cart is Empty"));
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: currentCartItems.length,
                      itemBuilder: (context, index) =>
                          CartItem(cartItem: currentCartItems[index]),
                      separatorBuilder: (context, index) =>
                          const Divider(color: AppColors.grey),
                    ),
                    Divider(color: AppColors.grey2),
                    CartTotalPrice(subTotal: currentSubTotal),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
