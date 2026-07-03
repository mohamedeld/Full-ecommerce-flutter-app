enum ProductSize { S, M, L, XL }

class ProductItemModel {
  final String id;
  final String title;
  final String imgUrl;
  final String description;
  final double price;
  final bool isFavorite;
  final String category;
  final int quantity;
  double avgRate;
  final ProductSize? size;

  ProductItemModel({
    required this.id,
    required this.title,
    required this.imgUrl,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry.',

    required this.price,
    this.isFavorite = false,
    this.category = 'others',
    this.avgRate = 0,
    this.quantity = 1,
    this.size,
  });

  ProductItemModel copyWith({
    String? id,
    String? title,
    String? imgUrl,
    String? description,
    double? price,
    bool? isFavorite,
    String? category,
    int? quantity,
    double? avgRate,
    ProductSize? size,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      avgRate: avgRate ?? this.avgRate,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'isFavorite': isFavorite});
    result.addAll({'category': category});
    result.addAll({'quantity': quantity});
    result.addAll({'avgRate': avgRate});
    if (size != null) {
      result.addAll({'size': size!.index});
    }

    return result;
  }

  factory ProductItemModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return ProductItemModel(
      id: documentId,
      title: map['title'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      isFavorite: map['isFavorite'] ?? false,
      category: map['category'] ?? 'others',
      quantity: map['quantity'] ?? 1,
      avgRate: map['avgRate']?.toDouble() ?? 0.0,
      size: _parseProductSize(map['size']),
    );
  }

  static ProductSize? _parseProductSize(dynamic value) {
    if (value == null) return null;

    if (value is int && value >= 0 && value < ProductSize.values.length) {
      return ProductSize.values[value];
    }

    if (value is String) {
      final asIndex = int.tryParse(value);
      if (asIndex != null &&
          asIndex >= 0 &&
          asIndex < ProductSize.values.length) {
        return ProductSize.values[asIndex];
      }

      final normalized = value.trim().toUpperCase();
      for (final size in ProductSize.values) {
        if (size.name.toUpperCase() == normalized) {
          return size;
        }
      }
    }

    return null;
  }
}

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: '1',
    title: 'T-shirt',
    imgUrl:
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=600',
    price: 10,
    category: 'Clothes',
    avgRate: 4.5,
  ),
  ProductItemModel(
    id: '2',
    title: 'Black Shoes',
    imgUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600',
    price: 20,
    category: 'Shoes',
    avgRate: 4.0,
  ),
  ProductItemModel(
    id: '3',
    title: 'Trousers',
    imgUrl:
        'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=600',
    price: 30,
    category: 'Clothes',
    avgRate: 3.7,
  ),
  ProductItemModel(
    id: '4',
    title: 'Tomatoes',
    imgUrl:
        'https://images.unsplash.com/photo-1582284540020-8acbe03f4924?w=600',
    price: 10,
    category: 'Groceries',
    avgRate: 4.9,
  ),
  ProductItemModel(
    id: '5',
    title: 'Potatoes',
    imgUrl:
        'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=600',
    price: 10,
    category: 'Groceries',
    avgRate: 4.1,
  ),
  ProductItemModel(
    id: '6',
    title: 'Onions',
    imgUrl:
        'https://images.unsplash.com/photo-1506806732259-39c2d0268443?w=600',
    price: 10,
    category: 'Groceries',
    avgRate: 4.3,
  ),
  ProductItemModel(
    id: '7',
    title: 'Apples',
    imgUrl:
        'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=600',
    price: 10,
    category: 'Fruits',
    avgRate: 3.5,
  ),
  ProductItemModel(
    id: '8',
    title: 'Oranges',
    imgUrl: 'https://images.unsplash.com/photo-1547514701-42782101795e?w=600',
    price: 10,
    category: 'Fruits',
    avgRate: 4.8,
  ),
  ProductItemModel(
    id: '9',
    title: 'Bananas',
    imgUrl:
        'https://images.unsplash.com/photo-1587132137056-bfbf0166836e?w=600',
    price: 10,
    category: 'Fruits',
    avgRate: 2.5,
  ),
  ProductItemModel(
    id: '10',
    title: 'Mangoes',
    imgUrl: 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=600',
    price: 10,
    category: 'Fruits',
    avgRate: 1.5,
  ),
  ProductItemModel(
    id: '11',
    title: 'Shirt',
    imgUrl:
        'https://images.unsplash.com/photo-1520975661595-6453be3f7070?w=600',
    price: 15,
    category: 'Clothes',
    avgRate: 4.55,
  ),
];
