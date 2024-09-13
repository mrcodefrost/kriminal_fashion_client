// import 'package:json_annotation/json_annotation.dart';
//
// part 'product_category.g.dart';
//
// @JsonSerializable()
// class ProductCategory {
//   @JsonKey(name: "id")
//   String? id;
//
//   @JsonKey(name: "name")
//   String? name;
//
//   ProductCategory({
//     this.id,
//     this.name,
//   });
//
//   factory ProductCategory.fromJson(Map<String, dynamic> json) =>
//       _$ProductCategoryFromJson(json);
//   Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
// }
//
//
//
//

class ProductCategoryModel {
  String id;
  String name;

  ProductCategoryModel({
    required this.id,
    required this.name,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
