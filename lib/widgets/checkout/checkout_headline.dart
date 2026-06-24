import 'package:flutter/material.dart';

class CheckoutHeadline extends StatelessWidget {
  final String title;
  final int? numOfProduct;
  final VoidCallback? onTap;
  const CheckoutHeadline({
    super.key,
    required this.title,
    this.numOfProduct,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final productText = numOfProduct != null ? "(${numOfProduct})" : '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(title, style: textTheme.titleLarge),
            if (numOfProduct != null)
              Text(productText, style: textTheme.titleLarge),
          ],
        ),
        if (onTap != null) TextButton(onPressed: onTap, child: Text("Edit")),
      ],
    );
  }
}
