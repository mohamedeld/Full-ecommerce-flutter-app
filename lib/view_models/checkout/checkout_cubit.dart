import 'package:ecommerce/models/payment_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/add_to_cart_model.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  String selectedPaymentId = dummyPaymentCards.first.id;

  void getCheckout() {
    emit(CheckoutLoading());
    final cartItems = dummyCart;
    final subTotal = cartItems.fold(
      0.0,
      (prev, element) => prev + (element.product.price * element.quantity),
    );
    if (dummyPaymentCards.isEmpty) {
      emit(CheckoutError(message: 'No payment methods found'));
      return;
    }
    final chosenPaymentCard = dummyPaymentCards.firstWhere(
      (item) => item.isChosen == true,
      orElse: () => dummyPaymentCards.first,
    );

    emit(
      CheckoutLoaded(
        cartItems: cartItems,
        total: subTotal + 10,
        paymentItems: dummyPaymentCards,
        chosenPaymentCard: chosenPaymentCard,
      ),
    );
  }

  void choosePaymentMethod(String id) {
    selectedPaymentId = id;
    final chosen = dummyPaymentCards.firstWhere(
      (item) => item.id == selectedPaymentId,
      orElse: () => dummyPaymentCards.first, // safe fallback
    );
    emit(PaymentMethodChosen(chosen));
  }

  void confirmPaymentMethod() {
    emit(ConfirmPaymentLoading());
    Future.delayed(Duration(seconds: 1), () {
      for (int i = 0; i < dummyPaymentCards.length; i++) {
        if (dummyPaymentCards[i].isChosen == true) {
          dummyPaymentCards[i] = dummyPaymentCards[i].copyWith(isChosen: false);
        }
        if (dummyPaymentCards[i].id == selectedPaymentId) {
          dummyPaymentCards[i] = dummyPaymentCards[i].copyWith(isChosen: true);
        }
      }
      final cartItems = dummyCart;
      final subTotal = cartItems.fold(
        0.0,
        (prev, element) => prev + (element.product.price * element.quantity),
      );

      final chosen = dummyPaymentCards.firstWhere(
        (item) => item.id == selectedPaymentId,
        orElse: () => dummyPaymentCards.first, // safe fallback
      );

      emit(ConfirmPaymentLoaded());
      emit(
        CheckoutLoaded(
          cartItems: cartItems,
          total: subTotal + 10,
          paymentItems: dummyPaymentCards,
          chosenPaymentCard: chosen,
        ),
      );
    });
  }
}
