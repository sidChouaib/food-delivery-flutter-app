// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    clientName: json["clientName"],
    items: json["items"],
    totalPrice: json["totalPrice"],
    timestamp: json["timestamp"],
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      "clientName": instance.clientName,
      "items": instance.items,
      "totalPrice": instance.totalPrice,
      "timestamp": instance.timestamp,
    };
OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    product: json['product'],
    quantity: json['quantity'],
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      "product": instance.product,
      "quantity": instance.quantity,
    };
