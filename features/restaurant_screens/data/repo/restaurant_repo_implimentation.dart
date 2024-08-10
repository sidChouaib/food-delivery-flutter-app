import '../model/restaurant_response_model/category_model.dart/category_model.dart';
import '../model/restaurant_response_model/restaurant_response_model.dart';
import 'restaurant_repo.dart';

class RestaurantRepoImplementation implements RestaurantRepo {
  @override
  List<CategoryModel>? getCategoriesData(
      RestaurantResponseModel getRestaurantDataFromDatabase) {
    // Implement fetching categories from your data source
    // For example, you might use Firebase or an API
    // Return a list of CategoryModel
    return getRestaurantDataFromDatabase.categories;
  }

  @override
  getProductData(RestaurantResponseModel getRestaurantDataFromDatabase) {
    // Implement fetching products from your data source
    // For example, you might use Firebase or an API
    // Return a list of ProductModel
    return getRestaurantDataFromDatabase.products;
  }

  @override
  RestaurantResponseModel getRestaurantData(
      RestaurantResponseModel getRestaurantDataFromDatabase) {
// Implement fetching restaurant data from your data source
    // For example, you might use Firebase or an API
    // Return a RestaurantModel
    ; // Replace with actual implementation
    throw getRestaurantDataFromDatabase;
  }
}
