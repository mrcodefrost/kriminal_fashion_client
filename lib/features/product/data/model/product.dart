class Product {
  String id;
  String name;
  String description;
  String superCategory;
  String category;
  String image;
  double price;
  String shortTag;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.superCategory,
    required this.category,
    required this.image,
    required this.price,
    required this.shortTag,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        superCategory: json['superCategory'],
        category: json['category'],
        image: json['image'],
        // firebase stores field as number, To avoid issues handle conversion for int to double like below
        price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'],
        shortTag: json['shortTag'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'superCategory': superCategory,
        'category': category,
        'image': image,
        'price': price,
        'shortTag': shortTag,
      };
}
