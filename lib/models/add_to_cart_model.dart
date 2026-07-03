import 'package:ecommerce/models/product_item_model.dart';

class AddToCartModel {
  final ProductItemModel product;
  final ProductSize size;
  final int quantity;
  final String id;

  AddToCartModel({
    required this.id,
    required this.product,
    required this.size,
    required this.quantity,
  });

  AddToCartModel copyWith({
    String? id,
    ProductItemModel? product,
    ProductSize? size,
    int? quantity,
  }) {
    return AddToCartModel(
      id: id ?? this.id,
      product: product ?? this.product,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
      'size': size.index,
      'quantity': quantity,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map) {
    return AddToCartModel(
      id: map['id'] ?? '',
      product: ProductItemModel.fromMap(map['product'], map['product']['id']),
      size: ProductSize.values[map['size']],
      quantity: map['quantity']?.toInt() ?? 1,
    );
  }
}

List<AddToCartModel> dummyCart = [];
