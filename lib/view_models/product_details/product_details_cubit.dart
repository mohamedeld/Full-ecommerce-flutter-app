import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  int quantity = 1;
  ProductSize? selectedSize;
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());

    Future.delayed(Duration(seconds: 1), () {
      final product = dummyProducts.firstWhere((item) => item.id == id);

      emit(ProductDetailsLoaded(product: product));
    });
  }

  void incrementCounter(String productId) {
    quantity++;
    emit(QuantityDetailsLoaded(value: quantity));
  }

  void decrementCounter(String productId) {
    quantity--;

    emit(QuantityDetailsLoaded(value: quantity));
  }

  void selectSize(ProductSize size) {
    selectedSize = size;
    emit(SizeSelected(size: size));
  }

  void addToCart(String productId) {
    if (selectedSize == null) {
      emit(ProductDetailsError(message: "Please select a size first"));
      return;
    }

    if (quantity <= 0) {
      quantity = 1;
    }

    emit(ProductAddingToCart());
    final AddToCartModel cartItem = AddToCartModel(
      productId: productId,
      size: selectedSize!,
      quantity: quantity,
    );
    dummyCart.add(cartItem);

    Future.delayed(const Duration(seconds: 1), () {
      emit(AddedToCart(productId: productId));
    });
  }
}
