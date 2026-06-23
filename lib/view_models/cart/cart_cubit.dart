import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  Map<String, int> quantities = {};

  CartCubit() : super(CartInitial());

  void getCartItems() async {
    emit(CartLoading());
    try {
      // Initialize quantities for each item using the quantity stored in the cart item
      for (var item in dummyCart) {
        quantities[item.product.id] = item.quantity;
      }

      double subTotal = _calculateSubTotal();

      emit(CartLoaded(dummyCart, subTotal, quantities: Map.from(quantities)));
    } catch (e, st) {
      debugPrint('CartCubit.getCartItems error: $e\n$st');
      emit(CartError(e.toString()));
    }
  }

  void incrementCounter(String productId, [int? initialValue]) {
    int currentQuantity = quantities[productId] ?? 1;
    if (initialValue != null) {
      currentQuantity = initialValue;
    }
    currentQuantity++;
    quantities[productId] = currentQuantity;

    // Update the quantity in dummyCart as well
    _updateCartItemQuantity(productId, currentQuantity);

    // Calculate subtotal
    double subTotal = _calculateSubTotal();

    emit(
      QuantityCartLoaded(
        quantities: Map.from(quantities),
        subTotal: subTotal, // Include subtotal
      ),
    );
  }

  void decrementCounter(String productId, [int? initialValue]) {
    int currentQuantity = quantities[productId] ?? 1;
    if (initialValue != null) {
      currentQuantity = initialValue;
    }

    if (currentQuantity > 1) {
      currentQuantity--;
      quantities[productId] = currentQuantity;
      _updateCartItemQuantity(productId, currentQuantity);
    }

    // Calculate subtotal
    double subTotal = _calculateSubTotal();

    emit(
      QuantityCartLoaded(
        quantities: Map.from(quantities),
        subTotal: subTotal, // Include subtotal
      ),
    );
  }

  // Helper method to calculate subtotal
  double _calculateSubTotal() {
    return dummyCart.fold(
      0.0,
      (sum, item) =>
          sum + (item.product.price * (quantities[item.product.id] ?? 1)),
    );
  }

  // Helper method to update quantity in dummyCart
  void _updateCartItemQuantity(String productId, int newQuantity) {
    final index = dummyCart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      final item = dummyCart[index];
      dummyCart[index] = AddToCartModel(
        id: item.id,
        product: item.product,
        size: item.size,
        quantity: newQuantity,
      );
    }
  }

  // Get subtotal
  double getSubTotal() {
    return _calculateSubTotal();
  }
}
