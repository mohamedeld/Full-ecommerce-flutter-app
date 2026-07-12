import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:ecommerce/services/favorite_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  final favoriteServices = FavoriteServicesImp();
  final authServices = AuthServicesImp();

  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    try {
      final user = authServices.currentUser();
      if (user == null) {
        emit(FavoriteError(message: 'User not authenticated'));
        return;
      }
      final favorites = await favoriteServices.getFavorites(user.uid);
      emit(FavoriteLoaded(favoriteProducts: favorites));
    } catch (e) {
      emit(FavoriteError(message: e.toString()));
    }
  }

  Future<void> removeFavorite(String productId) async {
    emit(RemoveFavoriteProductLoading());
    try {
      final user = authServices.currentUser();
      if (user == null) {
        emit(RemoveFavoriteError(message: 'User not authenticated'));
        return;
      }
      await favoriteServices.removeFavorite(user.uid, productId);
      final updatedFavorites = await favoriteServices.getFavorites(user.uid);
      emit(RemoveFavoriteProductLoaded());
      emit(FavoriteLoaded(favoriteProducts: updatedFavorites));
    } catch (e) {
      emit(RemoveFavoriteError(message: e.toString()));
    }
  }
}
