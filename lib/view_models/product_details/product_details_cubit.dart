import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());

    Future.delayed(Duration(seconds: 1), () {
      final product = dummyProducts.firstWhere((item) => item.id == id);

      emit(ProductDetailsLoaded(product: product));
    });
  }

  void incrementCounter(String productId) {
    final selectedIndex = dummyProducts.indexWhere(
      (element) => element.id == productId,
    );
    dummyProducts[selectedIndex] = dummyProducts[selectedIndex].copyWith(
      quantity: dummyProducts[selectedIndex].quantity + 1,
    );

    emit(QuantityDetailsLoaded(value: dummyProducts[selectedIndex].quantity));
  }

  void decrementCounter(String productId) {
    final selectedIndex = dummyProducts.indexWhere(
      (element) => element.id == productId,
    );
    if (dummyProducts[selectedIndex].quantity > 1) {
      dummyProducts[selectedIndex] = dummyProducts[selectedIndex].copyWith(
        quantity: dummyProducts[selectedIndex].quantity - 1,
      );

      emit(QuantityDetailsLoaded(value: dummyProducts[selectedIndex].quantity));
    }
  }
}
