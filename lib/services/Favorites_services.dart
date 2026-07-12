import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_paths.dart';

abstract class FavoriteServices {
  Future<void> addFavorite(String userId, ProductItemModel product);
  Future<void> removeFavorite(String userId, ProductItemModel product);
  Future<List<ProductItemModel>> getFavorites(String userId);
}

class FavoriteServicesImp implements FavoriteServices {
  final firestoreServices = FirestoreServices.instance;
  @override
  Future<void> addFavorite(String userId, ProductItemModel product) async {
    await firestoreServices.setData(
      path: ApiPaths.favoriteProducts(userId, product.id),
      data: product.toMap(),
    );
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
  Future<void> removeFavorite(String userId, ProductItemModel product) async {
    await firestoreServices.deleteData(
      path: ApiPaths.favoriteProducts(userId, product.id),
    );
  }
}
