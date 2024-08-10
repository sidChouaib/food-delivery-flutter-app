import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String? categoryName;
  final String? imageUrl;

  CategoryModel({
    required this.categoryName,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json['categoryName'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'imageUrl': imageUrl,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [categoryName, imageUrl];
}
