import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/product_model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String clientName;
  List<OrderItem> items;
  double totalPrice;
  DateTime timestamp;

  OrderModel({
    required this.clientName,
    required this.items,
    required this.totalPrice,
    required this.timestamp,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class OrderItem {
  int quantity;
  ProductModel product;

  OrderItem({
    required this.quantity,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
