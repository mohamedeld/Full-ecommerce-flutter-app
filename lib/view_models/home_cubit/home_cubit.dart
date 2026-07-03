import 'package:ecommerce/models/home_carousel_item_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeCubitInitial());
  final homeServices = HomeServicesImp();
  final authServices = AuthServicesImp();

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final products = await homeServices.fetchProducts();
      final carouselItems = await homeServices.fetchCarouselItems();
      final user = authServices.currentUser();

      final favoriteIds = user == null
          ? <String>{}
          : await homeServices.fetchFavoriteProductIds(user.uid);

      final result = products
          .map(
            (product) =>
                product.copyWith(isFavorite: favoriteIds.contains(product.id)),
          )
          .toList();

      if (result.isNotEmpty && carouselItems.isNotEmpty) {
        emit(HomeLoaded(carouselItems: carouselItems, products: result));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> toggleFavorite(ProductItemModel product) async {
    final user = authServices.currentUser();
    if (user == null) {
      debugPrint('User not authenticated');
      return;
    }

    final currentState = state;
    if (currentState is! HomeLoaded) {
      return;
    }

    final updatedProducts = currentState.products
        .map(
          (item) => item.id == product.id
              ? item.copyWith(isFavorite: !item.isFavorite)
              : item,
        )
        .toList();

    emit(
      HomeLoaded(
        carouselItems: currentState.carouselItems,
        products: updatedProducts,
      ),
    );

    try {
      await homeServices.toggleFavoriteProduct(user.uid, product);
    } catch (error) {
      emit(
        HomeLoaded(
          carouselItems: currentState.carouselItems,
          products: currentState.products,
        ),
      );
      debugPrint(error.toString());
    }
  }
}
