/// Entidad que representa un producto del ecommerce
class ProductEntity {
  final String id;
  final String name;
  final String imagePath;
  final double price;
  final String size;
  final String color;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.size,
    required this.color,
  });
}
