import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_paths.dart';

abstract class FavoriteServices {
  Future<void> toggleFavorites(String userId, ProductItemModel product);
  Future<List<ProductItemModel>> getFavorites(String userId);
  Future<void> removeFavorite(String userId, String productId);
}

class FavoriteServicesImp implements FavoriteServices {
  final firestoreServices = FirestoreServices.instance;
  @override
  Future<void> toggleFavorites(String userId, ProductItemModel product) async {
    final favoriteProductPath = ApiPaths.favoriteProducts(userId, product.id);

    final existingFavorite = await firestoreServices.firestore
        .doc(favoriteProductPath)
        .get();

    if (existingFavorite.exists) {
      await firestoreServices.deleteData(path: favoriteProductPath);
    } else {
      await firestoreServices.setData(
        path: favoriteProductPath,
        data: product.toMap(),
      );
    }
  }

  @override
  Future<List<ProductItemModel>> getFavorites(String userId) {
    return firestoreServices.getCollection<ProductItemModel>(
      path: ApiPaths.favoriteProductsCollection(userId),
      builder: (Map<String, dynamic> data, String documentId) {
        return ProductItemModel.fromMap(data, documentId);
      },
    );
  }

  @override
  Future<void> removeFavorite(String userId, String productId) {
    final favoriteProductPath = ApiPaths.favoriteProducts(userId, productId);
    return firestoreServices.deleteData(path: favoriteProductPath);
  }
}
