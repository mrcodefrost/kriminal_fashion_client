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
    final Map<String, dynamic> data = <String, dynamic>{};
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
