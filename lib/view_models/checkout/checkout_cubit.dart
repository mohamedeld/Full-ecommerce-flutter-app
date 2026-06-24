import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/add_to_cart_model.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  void getCheckout() {
    emit(CheckoutLoading());
    final cartItems = dummyCart;
    final subTotal = cartItems.fold(
      0.0,
      (prev, element) => prev + (element.product.price * element.quantity),
    );

    emit(CheckoutLoaded(cartItems: cartItems, total: subTotal + 10));
  }
}
