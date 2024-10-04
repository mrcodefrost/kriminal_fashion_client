class ProductCategory {
  String id;
  String name;
  String superCategory;

  ProductCategory({
    required this.id,
    required this.name,
    required this.superCategory,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      name: json['name'],
      superCategory: json['superCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['superCategory'] = superCategory;
    return data;
  }
}
