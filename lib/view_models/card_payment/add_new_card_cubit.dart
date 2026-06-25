import 'package:ecommerce/models/payment_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_new_card_state.dart';

class AddNewCardCubit extends Cubit<AddNewCardState> {
  AddNewCardCubit() : super(AddNewCardInitial());

  void addNewCard(
    String cardNumber,
    String cardHolderName,
    String expiryDate,
    String cvv,
  ) {
    emit(AddNewCardLoading());
    final newCard = PaymentCartModel(
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      expiryDate: expiryDate,
      cvv: cvv,
      id: DateTime.now().toIso8601String(),
    );
    Future.delayed(Duration(seconds: 1), () {
      dummyPaymentCards.add(newCard);
      emit(AddNewCardLoaded());
    });
  }
}
