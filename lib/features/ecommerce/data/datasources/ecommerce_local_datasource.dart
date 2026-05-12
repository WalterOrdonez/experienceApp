import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';

/// Fuente de datos local para productos Sugeridos
class EcommerceLocalDatasource {
  /// Retorna las imágenes del carrusel del onboarding
  List<ProductEntity> getSuggestions() {
    return const [
      ProductEntity(
        id: '1',
        name: 'Roller Rabbit',
        imagePath: 'assets/images/product_1.png',
        price: 198.00,
        size: 'M',
        color: 'Vado Odelle Dress',
      ),
      ProductEntity(
        id: '2',
        name: 'Axel Arigato',
        imagePath: 'assets/images/product_2.png',
        price: 245.00,
        size: 'L',
        color: 'Clean 90 Triple Sneakers',
      ),
      ProductEntity(
        id: '3',
        name: 'Herschel Supply Co.',
        imagePath: 'assets/images/product_3.png',
        price: 120.00,
        size: 'One Size',
        color: 'Classic Backpack',
      ),
      ProductEntity(
        id: '4',
        name: 'Adidas',
        imagePath: 'assets/images/product_4.png',
        price: 150.00,
        size: '42',
        color: 'Ultraboost 22',
      ),
    ];
  }
}
