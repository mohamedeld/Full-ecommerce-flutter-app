class PaymentCartModel {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;
  final String id;

  PaymentCartModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
    required this.id,
  });
}

List<PaymentCartModel> dummyPaymentCards = [];
