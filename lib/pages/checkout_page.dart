import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/checkout/checkout_cubit.dart';
import 'package:ecommerce/widgets/cart/cartItem.dart';
import 'package:ecommerce/widgets/checkout/address_container.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/checkout/checkout_headline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) {
        final cubit = CheckoutCubit();
        cubit.getCheckout();
        return cubit;
      },
      child: Scaffold(
        body: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CheckoutHeadline(title: "Address", onTap: () {}),
                        SizedBox(height: 8),
                        AddressContainer(title: "Add shipping address"),
                        SizedBox(height: 8),

                        CheckoutHeadline(
                          title: "Products",
                          numOfProduct: state.cartItems.length,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.cartItems.length,
                          itemBuilder: (context, index) => CartItem(
                            cartItem: state.cartItems[index],
                            isCheckout: true,
                          ),
                          separatorBuilder: (context, index) =>
                              Divider(color: AppColors.grey2),
                        ),
                        Divider(color: AppColors.grey2),
                        CheckoutHeadline(title: "Payment"),
                        SizedBox(height: 8),
                        AddressContainer(title: "Add payment method"),
                        Divider(color: AppColors.grey2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Amount",
                              style: textTheme.titleMedium?.copyWith(
                                color: AppColors.grey,
                              ),
                            ),
                            Text(
                              "\$${state.total.toStringAsFixed(2)}",
                              style: textTheme.titleMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Proceed to Buy"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is CheckoutLoading) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (state is CheckoutError) {
              return Center(child: Text(state.message));
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
