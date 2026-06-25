import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale.freezed.dart';

@freezed
abstract class Sale with _$Sale {
  const factory Sale({required double total}) = _Sale;
}
