class CartItem {
  String id;
  String productId;
  String name;
  String image;
  double price;
  double quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'],
        productId: json['productId'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'name': name,
        'image': image,
        'price': price,
        'quantity': quantity,
      };
}
