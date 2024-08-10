// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    foodRate: (json['foodRate'] as num?)?.toDouble(),
    size: (json['size'] as List<dynamic>?)?.cast<String>(),
    ingredients: (json['ingredients'] as List<dynamic>?)?.cast<String>(),
    foodImageUrl: json['img_url'] as String?,
    time: json['time'] as String?,
    foodReviews: (json['foodReviews'] as List<dynamic>?)?.cast<String>(),
    category: json['category'] as String?,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      "name": instance.name,
      "price": instance.price,
      "foodRate": instance.foodRate,
      "size": instance.size,
      "ingredients": instance.ingredients,
      "img_url": instance.foodImageUrl,
      "time": instance.time,
      "foodReviews": instance.foodReviews,
      "category": instance.category
    };
