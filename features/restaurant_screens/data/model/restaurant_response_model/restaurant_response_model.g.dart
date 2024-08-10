// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantResponseModel _$RestaurantResponseModelFromJson(
    Map<String, dynamic> json) {
  return RestaurantResponseModel(
    name: json["name"],
    location: json["location"],
    localization: json["localization"],
    storeRate: json["storeRate"],
    details: json["details"],
    storeReviews: json["storeReviews"],
    storeLogoUrl: json["storeLogoUrl"],
    storeImageUrl: json["storeImageUrl"],
    products: json["products"],
    categories: (json["categories"] as List<dynamic>)
        .map((dynamic categoryJson) =>
            CategoryModel.fromJson(categoryJson as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RestaurantResponseModelToJson(
        RestaurantResponseModel instance) =>
    <String, dynamic>{
      "name": instance.name,
      "location": instance.location,
      "localization": instance.localization,
      "storeRate": instance.storeRate,
      "details": instance.details,
      "storeReviews": instance.storeReviews,
      "storeLogoUrl": instance.storeLogoUrl,
      "storeImageUrl": instance.storeImageUrl,
      "products": instance.products,
      "categories": instance.categories
    };
