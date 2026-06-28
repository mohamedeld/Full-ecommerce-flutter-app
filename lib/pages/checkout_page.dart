import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/checkout/checkout_cubit.dart';
import 'package:ecommerce/widgets/cart/cartItem.dart';
import 'package:ecommerce/widgets/checkout/address_container.dart';
import 'package:ecommerce/widgets/checkout/bottom_sheet_payment.dart';
import 'package:ecommerce/widgets/checkout/choose_address_checkout.dart';
import 'package:ecommerce/widgets/checkout/payment_method_item.dart';
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
          buildWhen: (previous, current) =>
              current is CheckoutLoaded ||
              current is CheckoutLoading ||
              current is CheckoutError ||
              current is ConfirmPaymentLoaded,
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
                        if (state.chosenLocation != null)
                          ChooseAddressCheckout(
                            location: state.chosenLocation!,
                            onNavigate: () {
                              final cubit = context.read<CheckoutCubit>();
                              cubit.getCheckout();
                            },
                          )
                        else
                          AddressContainer(
                            title: "Add shipping address",
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.chooseLocation).then((_) {
                                final cubit = context.read<CheckoutCubit>();
                                cubit.getCheckout();
                              });
                            },
                          ),
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
                        state.paymentItems.isEmpty
                            ? AddressContainer(
                                title: "Add payment method",
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.addCardRoute)
                                      .then(
                                        (value) =>
                                            BlocProvider.of<CheckoutCubit>(
                                              context,
                                            ).getCheckout(),
                                      );
                                },
                              )
                            : PaymentMethodItem(
                                paymentCard: state.chosenPaymentCard,
                                cubit: BlocProvider.of<CheckoutCubit>(context),
                                onTap: () {
                                  final cubit = context.read<CheckoutCubit>();

                                  showModalBottomSheet(
                                    context: context,
                                    builder: (bottomSheetContext) =>
                                        BlocProvider.value(
                                          // ← Add this
                                          value: cubit, // ← Pass existing cubit
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: 400,
                                            child: BottomSheetPayment(
                                              paymentItems: state.paymentItems,
                                              cubit: cubit,
                                              onConfirm: () =>
                                                  Navigator.of(context).pop(),
                                            ),
                                          ),
                                        ),
                                  );
                                },
                              ),
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
