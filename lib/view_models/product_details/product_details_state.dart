part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  ProductDetailsLoaded({required this.product});

  final ProductItemModel product;
}

final class QuantityDetailsLoaded extends ProductDetailsState {
  final int value;
  QuantityDetailsLoaded({required this.value});
}

final class SizeSelected extends ProductDetailsState {
  final ProductSize size;
  SizeSelected({required this.size});
}

final class AddedToCart extends ProductDetailsState {
  AddedToCart({required this.productId});

  final String productId;
}

final class ProductAddingToCart extends ProductDetailsState {}

final class ProductDetailsError extends ProductDetailsState {
  ProductDetailsError({required this.message});

  final String message;
}
