import 'package:ecommerce/models/payment_cart_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/checkout/checkout_cubit.dart';
import 'package:ecommerce/widgets/checkout/payment_method_item.dart';
import 'package:flutter/material.dart';

class BottomSheetPayment extends StatelessWidget {
  final List<PaymentCartModel> paymentItems;
  final CheckoutCubit cubit;
  const BottomSheetPayment({
    super.key,
    required this.paymentItems,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: size.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text('Payment Methods', style: textTheme.titleMedium),
            const SizedBox(height: 8),

            // Payment methods list - without Expanded
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: paymentItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PaymentMethodItem(
                    paymentCard: paymentItems[index],
                    onTap: () {},
                    cubit: cubit,
                    isRadio: true,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Add new payment method button
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.addCardRoute);
              },
              child: SizedBox(
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add),
                      const SizedBox(width: 5),
                      Text("Add New Payment Method"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Confirm Payment button
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
                child: const Text("Confirm Payment"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
