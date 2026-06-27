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

List<PaymentCartModel> dummyPaymentCards = [
  PaymentCartModel(
    id: '1',
    cardNumber: '1234 5678 9012 3456',
    cardHolderName: 'Tarek Alabd',
    expiryDate: '12/23',
    cvv: '123',
  ),
  PaymentCartModel(
    id: '2',
    cardNumber: '1234 5678 9012 3466',
    cardHolderName: 'John Doe',
    expiryDate: '12/23',
    cvv: '123',
  ),
  PaymentCartModel(
    id: '3',
    cardNumber: '1234 5678 9012 3477',
    cardHolderName: 'Tim Smith',
    expiryDate: '12/23',
    cvv: '123',
  ),
  PaymentCartModel(
    id: '4',
    cardNumber: '1234 5678 9012 3488',
    cardHolderName: 'John Doe',
    expiryDate: '12/23',
    cvv: '123',
  ),
  PaymentCartModel(
    id: '5',
    cardNumber: '1234 5678 9012 3499',
    cardHolderName: 'Tim Smith',
    expiryDate: '12/23',
    cvv: '123',
  ),
];
