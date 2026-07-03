import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/home_carousel_item_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_paths.dart';

abstract class HomeServices {
  Future<List<ProductItemModel>> fetchProducts();
  Future<List<HomeCarouselItemModel>> fetchCarouselItems();
  Future<List<CategoryModel>> fetchCategories();
  Future<void> toggleFavoriteProduct(String userId, ProductItemModel product);
  Future<bool> isFavoriteProduct(String userId, String productId);
  Future<Set<String>> fetchFavoriteProductIds(String userId);
}

class HomeServicesImp implements HomeServices {
  final _fireStore = FirestoreServices.instance;
  @override
  Future<List<ProductItemModel>> fetchProducts() async {
    final result = await _fireStore.getCollection<ProductItemModel>(
      path: ApiPaths.products(),
      builder: (data, documentId) => ProductItemModel.fromMap(data, documentId),
    );
    return result;
  }

  @override
  Future<List<HomeCarouselItemModel>> fetchCarouselItems() async {
    final result = await _fireStore.getCollection<HomeCarouselItemModel>(
      path: ApiPaths.carouselItems(),
      builder: (data, documentId) => HomeCarouselItemModel.fromMap(data),
    );
    return result;
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final result = await _fireStore.getCollection<CategoryModel>(
      path: ApiPaths.categories(),
      builder: (data, documentId) => CategoryModel.fromMap(data),
    );
    return result;
  }

  @override
  Future<void> toggleFavoriteProduct(
    String userId,
    ProductItemModel product,
  ) async {
    final favoriteProductPath = ApiPaths.favoriteProducts(userId, product.id);

    final existingFavorite = await _fireStore.firestore
        .doc(favoriteProductPath)
        .get();

    if (existingFavorite.exists) {
      await _fireStore.deleteData(path: favoriteProductPath);
    } else {
      await _fireStore.setData(
        path: favoriteProductPath,
        data: product.toMap(),
      );
    }
  }

  @override
  Future<bool> isFavoriteProduct(String userId, String productId) async {
    final favoriteProductPath = ApiPaths.favoriteProducts(userId, productId);
    final snapshot = await _fireStore.firestore.doc(favoriteProductPath).get();
    return snapshot.exists;
  }

  @override
  Future<Set<String>> fetchFavoriteProductIds(String userId) async {
    final snapshots = await _fireStore.firestore
        .collection(ApiPaths.favoriteProductsCollection(userId))
        .get();
    return snapshots.docs.map((doc) => doc.id).toSet();
  }
}
