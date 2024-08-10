import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_access_model.g.dart';

@JsonSerializable()
class RestaurantAccessModel extends Equatable {
  final String? type;
  final String? id;
  final String? table;

  const RestaurantAccessModel({this.type, this.id, this.table});

  factory RestaurantAccessModel.fromJson(Map<String, dynamic> json) {
    return _$RestaurantAccessModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantAccessModelToJson(this);

  @override
  List<String?> get props => [type, id, table];
}
