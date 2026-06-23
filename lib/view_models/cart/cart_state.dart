part of 'cart_cubit.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<AddToCartModel> cartItems;
  final Map<String, int> quantities;
  final double subTotal;

  const CartLoaded(this.cartItems, this.subTotal, {this.quantities = const {}});
}

final class CartError extends CartState {
  final String message;
  const CartError(this.message);
}

final class QuantityCartLoaded extends CartState {
  final Map<String, int> quantities;
  final double subTotal; // Add subtotal

  const QuantityCartLoaded({required this.quantities, this.subTotal = 0.0});
}
