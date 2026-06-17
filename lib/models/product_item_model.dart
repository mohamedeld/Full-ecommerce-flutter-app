class ProductItemModel {
  final String id;
  final String title;
  final String imgUrl;
  final String description;
  final double price;
  final bool isFavorite;
  final String category;

  ProductItemModel({
    required this.id,
    required this.title,
    required this.imgUrl,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry.',

    required this.price,
    this.isFavorite = false,
    this.category = 'others',
  });
}

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: '1',
    title: 'T-shirt',
    imgUrl:
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=600',
    price: 10,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: '2',
    title: 'Black Shoes',
    imgUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600',
    price: 20,
    category: 'Shoes',
  ),
  ProductItemModel(
    id: '3',
    title: 'Trousers',
    imgUrl:
        'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=600',
    price: 30,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: '4',
    title: 'Tomatoes',
    imgUrl: 'https://images.unsplash.com/photo-1546470427-e5a2d0c0b3c5?w=600',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: '5',
    title: 'Potatoes',
    imgUrl:
        'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=600',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: '6',
    title: 'Onions',
    imgUrl:
        'https://images.unsplash.com/photo-1506806732259-39c2d0268443?w=600',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: '7',
    title: 'Apples',
    imgUrl:
        'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=600',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: '8',
    title: 'Oranges',
    imgUrl: 'https://images.unsplash.com/photo-1547514701-42782101795e?w=600',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: '9',
    title: 'Bananas',
    imgUrl:
        'https://images.unsplash.com/photo-1587132137056-bfbf0166836e?w=600',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: '10',
    title: 'Mangoes',
    imgUrl: 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=600',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: '11',
    title: 'Shirt',
    imgUrl:
        'https://images.unsplash.com/photo-1520975661595-6453be3f7070?w=600',
    price: 15,
    category: 'Clothes',
  ),
];
