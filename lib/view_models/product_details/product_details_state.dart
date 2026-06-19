part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  ProductDetailsLoaded({required this.product});

  final ProductItemModel product;
}

final class ProductDetailsError extends ProductDetailsState {
  ProductDetailsError({required this.message});

  final String message;
}
