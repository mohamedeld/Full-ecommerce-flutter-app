import 'package:ecommerce/services/auth_services.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:ecommerce/services/product_details_services.dart';
import 'package:ecommerce/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  Map<String, int> productQuantities = {};
  ProductSize? selectedSize;
  ProductDetailsCubit() : super(ProductDetailsInitial());
  final productDetailsServices = ProductDetailsServicesImp();
  final homeServices = HomeServicesImp();
  final authServices = AuthServicesImp();

  Future<void> getProductDetails(String id) async {
    emit(ProductDetailsLoading());
    try {
      final result = await productDetailsServices.fetchProductDetails(id);
      if (result != null) {
        productQuantities[id] = productQuantities[id] ?? 1;

        final user = authServices.currentUser();
        final isFavorite = user == null
            ? false
            : await homeServices.isFavoriteProduct(user.uid, result.id);

        emit(
          ProductDetailsLoaded(
            product: result.copyWith(isFavorite: isFavorite),
          ),
        );
      }
    } catch (e) {
      emit(ProductDetailsError(message: e.toString()));
    }
  }

  Future<void> toggleFavorite(ProductItemModel product) async {
    final user = authServices.currentUser();
    if (user == null) {
      emit(ProductDetailsError(message: 'User not authenticated'));
      return;
    }

    final updatedProduct = product.copyWith(isFavorite: !product.isFavorite);
    emit(ProductDetailsLoaded(product: updatedProduct));

    try {
      await homeServices.toggleFavoriteProduct(user.uid, product);
    } catch (e) {
      emit(ProductDetailsLoaded(product: product));
      emit(ProductDetailsError(message: e.toString()));
    }
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
  Future<void> addToCart(ProductItemModel product) async {
    try {
      if (selectedSize == null) {
        emit(ProductDetailsError(message: "Please select a size first"));
        return;
      }

      int quantity = productQuantities[product.id] ?? 1;
      if (quantity <= 0) quantity = 1;
      emit(ProductAddingToCart());

      await productDetailsServices.addToCart(
        AddToCartModel(
          id: DateTime.now().toString(),
          product: product,
          size: selectedSize!,
          quantity: quantity,
        ),
        authServices.currentUser()!.uid, // Replace with actual user ID
      );
      emit(AddedToCart(productId: product.id));
    } catch (e) {
      emit(ProductDetailsError(message: e.toString()));
    }
  }
}
