// import 'package:json_annotation/json_annotation.dart';
//
// part '../../../common/data/model/product.g.dart';
//
// @JsonSerializable()
// class Product {
//   @JsonKey(name: "id")
//   String? id;
//
//   @JsonKey(name: "name")
//   String? name;
//
//   @JsonKey(name: "description")
//   String? description;
//
//   @JsonKey(name: "category")
//   String? category;
//
//   @JsonKey(name: "image")
//   String? image;
//
//   @JsonKey(name: "price")
//   double? price;
//
//   @JsonKey(name: "brand")
//   String? brand;
//
//   @JsonKey(name: "offer")
//   bool? offer;
//
//   @JsonKey(name: 'shortTag')
//   String? shortTag;
//
//   Product({
//     this.id,
//     this.name,
//     this.description,
//     this.category,
//     this.image,
//     this.offer,
//     this.price,
//     this.brand,
//     this.shortTag,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
//   Map<String, dynamic> toJson() => _$ProductToJson(this);
// }

class ProductModel {
  String? id;
  String? name;
  String? description;
  String? category;
  String? image;
  double? price;
  String? brand;
  bool? offer;
  String? shortTag;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.price,
    this.brand,
    this.offer,
    this.shortTag,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      // firebase stores field as number, To avoid issues handle conversion for int to double like below
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'],
      brand: json['brand'],
      offer: json['offer'],
      shortTag: json['shortTag'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    data['price'] = price;
    data['brand'] = brand;
    data['offer'] = offer;
    data['shortTag'] = shortTag;
    return data;
  }
}
