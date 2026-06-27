part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {
  final List<AddToCartModel> cartItems;
  final double total;
  final List<PaymentCartModel> paymentItems;
  final PaymentCartModel chosenPaymentCard;

  CheckoutLoaded({
    required this.cartItems,
    required this.total,
    required this.paymentItems,
    required this.chosenPaymentCard,
  });
}

final class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError({required this.message});
}

final class PaymentMethodChosen extends CheckoutState {
  final PaymentCartModel chosenPayment;

  PaymentMethodChosen(this.chosenPayment);
}

final class ConfirmPaymentLoading extends CheckoutState {}

final class ConfirmPaymentLoaded extends CheckoutState {}

final class ConfirmPaymentError extends CheckoutState {
  final String message;

  ConfirmPaymentError({required this.message});
}
