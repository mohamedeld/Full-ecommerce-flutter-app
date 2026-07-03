class ApiPaths {
  static String users(String userId) => "users/$userId";
  static String products() => "products/";
  static String productDetails(String productId) => "products/$productId";
  static String cartItem(String userId, String cartItemId) =>
      "users/$userId/cartItems/$cartItemId";

  static String carouselItems() => "Announcements/";
  static String categories() => "categories/";
  static String favoriteProductsCollection(String userId) =>
      "users/$userId/favoriteProducts";
  static String favoriteProducts(String userId, String productId) =>
      "users/$userId/favoriteProducts/$productId";
}
