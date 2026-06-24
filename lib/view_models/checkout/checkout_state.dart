part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {
  final List<AddToCartModel> cartItems;
  final double total;

  CheckoutLoaded({required this.cartItems, required this.total});
}

final class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError({required this.message});
}
