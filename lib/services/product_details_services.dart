import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_paths.dart';

abstract class ProductDetailsServices {
  Future<ProductItemModel?> fetchProductDetails(String productId);
  Future<void> addToCart(AddToCartModel cartItem, String userId);
}

class ProductDetailsServicesImp implements ProductDetailsServices {
  final _fireStore = FirestoreServices.instance;

  @override
  Future<ProductItemModel?> fetchProductDetails(String productId) async {
    final result = await _fireStore.getDocument<ProductItemModel>(
      path: ApiPaths.productDetails(productId),
      builder: (data, documentId) => ProductItemModel.fromMap(data, documentId),
    );
    return result;
  }

  @override
  Future<void> addToCart(AddToCartModel cartItem, String userId) async {
    await _fireStore.setData(
      path: ApiPaths.cartItem(userId, cartItem.id),
      data: cartItem.toMap(),
    );
  }
}
