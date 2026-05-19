class ProductModel {
  final String id;
  final String name;
  final String imagePath;
  final double price;
  final List<String> size;
  final List<int> color;
  ProductModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.size,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imagePath": imagePath,
    "price": price,
    "size": List<dynamic>.from(size.map((x) => x)),
    "color": List<dynamic>.from(color.map((x) => x)),
  };
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    imagePath: json["imagePath"],
    price: json["price"].toDouble(),
    size: List<String>.from(json["size"].map((x) => x)),
    color: List<int>.from(json["color"].map((x) => x)),
  );
}
