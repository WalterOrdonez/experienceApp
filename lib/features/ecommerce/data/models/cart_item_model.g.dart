// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemModelImpl _$$CartItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CartItemModelImpl(
      productId: json['productId'] as String? ?? '',
      productName: json['productName'] as String? ?? '',
      productImagePath: json['productImagePath'] as String? ?? '',
      productPrice: (json['productPrice'] as num?)?.toDouble() ?? 0.0,
      productSizes:
          (json['productSizes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      productColors:
          (json['productColors'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      selectedSize: json['selectedSize'] as String? ?? '',
      selectedColor: (json['selectedColor'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CartItemModelImplToJson(_$CartItemModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productImagePath': instance.productImagePath,
      'productPrice': instance.productPrice,
      'productSizes': instance.productSizes,
      'productColors': instance.productColors,
      'quantity': instance.quantity,
      'selectedSize': instance.selectedSize,
      'selectedColor': instance.selectedColor,
    };
