import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';

/// Fuente de datos local para productos Sugeridos
class EcommerceLocalDatasource {
  /// Retorna las imágenes del carrusel del onboarding
  List<ProductModel> getSuggestions() {
    return [
      ProductModel(
        id: '1',
        name: 'Roller Rabbit',
        imagePath: 'assets/images/product_1.png',
        price: 198.00,
        size: ['M', 'L', 'XL'],
        color: [0xFF1A1A1A, 0xFF6B6B6B, 0xFFB0B0B0, 0xFFD9D9D9],
      ),
      ProductModel(
        id: '2',
        name: 'Axel Arigato',
        imagePath: 'assets/images/product_2.png',
        price: 245.00,
        size: ['XS', 'L'],
        color: [0xFF1A1A1A, 0xFF6B6B6B, 0xFFB0B0B0, 0xFFD9D9D9],
      ),
      ProductModel(
        id: '3',
        name: 'Herschel Supply Co.',
        imagePath: 'assets/images/product_3.png',
        price: 120.00,
        size: ['XS', 'S', 'M', 'L'],
        color: [0xFF1A1A1A, 0xFF6B6B6B, 0xFFB0B0B0, 0xFFD9D9D9],
      ),
      ProductModel(
        id: '4',
        name: 'Adidas',
        imagePath: 'assets/images/product_4.png',
        price: 150.00,
        size: ['41', '42', '43'],
        color: [0xFF1A1A1A, 0xFF6B6B6B, 0xFFB0B0B0, 0xFFD9D9D9],
      ),
    ];
  }
}
