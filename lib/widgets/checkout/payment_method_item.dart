import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/payment_cart_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/checkout/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodItem extends StatelessWidget {
  final dynamic onTap;
  final PaymentCartModel paymentCard;
  final CheckoutCubit cubit;
  final bool? isRadio;
  const PaymentMethodItem({
    super.key,
    required this.paymentCard,
    required this.onTap,
    this.isRadio = false,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
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
            placeholder: (context, url) => const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: const Text("MasterCard"),
          subtitle: Text(paymentCard.cardNumber),
          trailing: isRadio!
              ? BlocProvider.value(
                  value: cubit, // Use the passed cubit directly
                  child: BlocBuilder<CheckoutCubit, CheckoutState>(
                    bloc: cubit, // ← Provide bloc directly, no context lookup
                    builder: (context, state) {
                      final chosenId = state is PaymentMethodChosen
                          ? state.chosenPayment.id
                          : null;
                      return Radio<String>(
                        value: paymentCard.id,
                        groupValue: chosenId,
                        onChanged: (value) {
                          cubit.choosePaymentMethod(value!);
                        },
                      );
                    },
                  ),
                )
              : const Icon(
                  Icons.chevron_right,
                ), // Fixed: Added Icon() constructor
        ),
      ),
    );
  }
}
