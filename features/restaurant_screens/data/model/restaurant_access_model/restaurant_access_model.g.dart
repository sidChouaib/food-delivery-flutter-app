// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantAccessModel _$RestaurantAccessModelFromJson(
    Map<String, dynamic> json) {
  return RestaurantAccessModel(
    type: json['type'],
    id: json['id'],
    table: json['table'],
  );
}

Map<String, dynamic> _$RestaurantAccessModelToJson(
        RestaurantAccessModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'table': instance.table,
    };
