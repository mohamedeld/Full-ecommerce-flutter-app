class PaymentCartModel {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;
  final String id;
  final bool isChosen;

  PaymentCartModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
    required this.id,
    this.isChosen = false,
  });

  PaymentCartModel copyWith({
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
    String? cvv,
    String? id,
    bool? isChosen,
  }) {
    return PaymentCartModel(
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      id: id ?? this.id,
      isChosen: isChosen ?? this.isChosen,
    );
  }
}

List<PaymentCartModel> dummyPaymentCards = [];
