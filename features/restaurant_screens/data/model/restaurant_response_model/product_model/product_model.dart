import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  final String? name;
  final double? price;
  final double? foodRate;
  final List<String>? size;
  final List<String>? ingredients;
  final String? foodImageUrl;
  final String? time;
  final List<String>? foodReviews;
  final String? category;
  ProductModel({
    required this.name,
    required this.price,
    required this.foodRate,
    required this.size,
    required this.ingredients,
    required this.foodImageUrl,
    required this.time,
    required this.foodReviews,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        price,
        foodRate,
        size,
        ingredients,
        foodImageUrl,
        time,
        foodReviews,
        category,
      ];
}
