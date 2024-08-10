import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/restaurant_access_model/restaurant_access_model.dart';
import '../model/restaurant_response_model/product_model/product_model.dart';
import '../model/restaurant_response_model/restaurant_response_model.dart';

class GetRestaurantDataFromDatabase {
  Future<RestaurantResponseModel?> getRestaurantDataFromDatabase({
    required RestaurantAccessModel storeData,
  }) async {
    try {
      // Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Manually set the document ID for the store
      String customStoreId = storeData.id!; // Replace with your desired ID
      String customStoretype = storeData.type!;

// Create a reference to the restaurant document
      var restaurantRef =
          firestore.collection(customStoretype).doc(customStoreId);

// Retrieve restaurant data
      DocumentSnapshot restaurantSnapshot = await restaurantRef.get();

      if (restaurantSnapshot.exists) {
        // Retrieve information data from the restaurant snapshot
        // then we convert the retrieved data as Map
        Map<String, dynamic> restaurantData =
            restaurantSnapshot.data() as Map<String, dynamic>;
        // Retrieve products data
        QuerySnapshot productsSnapshot =
            await restaurantRef.collection('products').get();


        // Convert the list of maps to a list of ProductModel instances
        List<ProductModel> productList = productsSnapshot.docs
            .map((productDoc) => ProductModel.fromJson(
                productDoc.data() as Map<String, dynamic>))
            .toList();
            
        restaurantData["products"] = productList;

        // Return restaurant data
        return RestaurantResponseModel.fromJson(restaurantData);
      } else {
        print('Restaurant with ID $customStoreId does not exist.');
        // Handle error page
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
