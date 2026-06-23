import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:ecommerce/widgets/product_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  Map<String, int> productQuantities = {};
  ProductSize? selectedSize;
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());

    Future.delayed(Duration(seconds: 1), () {
      final product = dummyProducts.firstWhere((item) => item.id == id);
      productQuantities[id] = productQuantities[id] ?? 1;
      emit(ProductDetailsLoaded(product: product));
    });
  }

  void incrementCounter(String productId, [int? initialValue]) {
    int currentQuantity = productQuantities[productId] ?? 1;

    if (initialValue != null) {
      currentQuantity = initialValue;
    }

    currentQuantity++;
    productQuantities[productId] = currentQuantity;
    emit(QuantityDetailsLoaded(value: currentQuantity));
  }

  void decrementCounter(String productId, [int? initialValue]) {
    int currentQuantity = productQuantities[productId] ?? 1;

    if (initialValue != null) {
      currentQuantity = initialValue;
    }

    if (currentQuantity > 1) {
      currentQuantity--;
      productQuantities[productId] = currentQuantity;
    } else {
      // Don't go below 1
      productQuantities[productId] = 1;
      currentQuantity = 1;
    }

    emit(QuantityDetailsLoaded(value: currentQuantity));
  }

  void selectSize(ProductSize size) {
    selectedSize = size;
    emit(SizeSelected(size: size));
  }

  // In product_details_cubit.dart addToCart method
  void addToCart(ProductItemModel product) {
    if (selectedSize == null) {
      emit(ProductDetailsError(message: "Please select a size first"));
      return;
    }

    int quantity = productQuantities[product.id] ?? 1;
    if (quantity <= 0) quantity = 1;

    emit(ProductAddingToCart());

    // Check if product already in cart, if so update quantity
    final existingIndex = dummyCart.indexWhere(
      (item) => item.product.id == product.id && item.size == selectedSize,
    );

    if (existingIndex != -1) {
      // Update existing item
      final existingItem = dummyCart[existingIndex];
      dummyCart[existingIndex] = AddToCartModel(
        id: existingItem.id,
        product: product,
        size: selectedSize!,
        quantity: existingItem.quantity + quantity,
      );
    } else {
      // Add new item
      final AddToCartModel cartItem = AddToCartModel(
        id: DateTime.now().toString(),
        product: product,
        size: selectedSize!,
        quantity: quantity,
      );
      dummyCart.add(cartItem);
    }

    Future.delayed(const Duration(seconds: 1), () {
      emit(AddedToCart(productId: product.id));
    });
  }
}
