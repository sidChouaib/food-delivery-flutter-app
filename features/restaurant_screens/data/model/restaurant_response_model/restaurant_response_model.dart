import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart/category_model.dart';
import 'product_model/product_model.dart';
part 'restaurant_response_model.g.dart';

@JsonSerializable()
class RestaurantResponseModel extends Equatable {
  final String? name;
  final String? location;
  final String? localization;
  final String? storeRate;
  final String? details;
  final List<dynamic>? storeReviews;
  final String? storeLogoUrl;
  final String? storeImageUrl;
  final List<ProductModel>? products;
  final List<CategoryModel>? categories;

  const RestaurantResponseModel({
    this.name,
    this.location,
    this.localization,
    this.storeRate,
    this.details,
    this.storeReviews,
    this.storeLogoUrl,
    this.storeImageUrl,
    this.products,
    this.categories,
  });

  factory RestaurantResponseModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return _$RestaurantResponseModelFromJson(json);
  }

  Map<String, dynamic> restRespModToJson() =>
      _$RestaurantResponseModelToJson(this);

  @override
  List<Object?> get props {
    return [
      name,
      location,
      localization,
      storeRate,
      details,
      storeReviews,
      storeLogoUrl,
      storeImageUrl,
      products,
      categories
    ];
  }
}
