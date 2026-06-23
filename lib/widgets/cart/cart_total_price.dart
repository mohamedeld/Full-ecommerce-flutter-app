import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/widgets/cart/total_and_subtotal.dart';
import 'package:flutter/material.dart';

class CartTotalPrice extends StatelessWidget {
  final double subTotal;
  final double shipping = 10;

  const CartTotalPrice({super.key, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Ensure subTotal is not null
    final total = subTotal ?? 0.0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TotalAndSubtotal(label: "Subtotal", value: total),
          const SizedBox(height: 8),
          TotalAndSubtotal(label: "Shipping", value: shipping),
          const SizedBox(height: 8),
          TotalAndSubtotal(label: "Total Amount", value: total + shipping),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Checkout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
