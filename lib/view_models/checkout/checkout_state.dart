part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {
  final List<AddToCartModel> cartItems;
  final double total;
  final List<PaymentCartModel> paymentItems;

  CheckoutLoaded({
    required this.cartItems,
    required this.total,
    required this.paymentItems,
  });
}

final class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError({required this.message});
}
