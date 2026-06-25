import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/payment_cart_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentCartModel paymentCard;
  const PaymentMethodItem({super.key, required this.paymentCard});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey),
      ),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl:
              "https://th.bing.com/th/id/R.dd4e0ca1b453f37e1b01d3b5d2636c85?rik=eLQ1moFO6uN4uA&pid=ImgRaw&r=0",
          width: 50,
          height: 50,
          fit: BoxFit.contain,
          placeholder: (context, url) => SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text("MasterCard"),
        subtitle: Text(paymentCard.cardNumber),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
