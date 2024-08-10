import '../model/restaurant_response_model/category_model.dart/category_model.dart';
import '../model/restaurant_response_model/restaurant_response_model.dart';

abstract class RestaurantRepo {
  List<CategoryModel>? getCategoriesData(
      RestaurantResponseModel restaurantResponseModel);
  getProductData(RestaurantResponseModel restaurantResponseModel);
  RestaurantResponseModel getRestaurantData(
      RestaurantResponseModel restaurantResponseModel);
}
