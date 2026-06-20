import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Counterwidget extends StatelessWidget {
  final String productId;
  final int value;
  final dynamic cubit;
  const Counterwidget({
    super.key,
    required this.value,
    required this.productId,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                cubit.decrementCounter(productId);
              },
              icon: Icon(Icons.remove),
            ),
            Text("$value"),
            IconButton(
              onPressed: () {
                cubit.incrementCounter(productId);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
