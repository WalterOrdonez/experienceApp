// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaleModelImpl _$$SaleModelImplFromJson(Map<String, dynamic> json) =>
    _$SaleModelImpl(
      id: json['id'] as String,
      total: (json['total'] as num).toDouble(),
      usuario: json['usuario'] as String,
      date: const TimestampConverter().fromJson(json['date']),
    );

Map<String, dynamic> _$$SaleModelImplToJson(_$SaleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'usuario': instance.usuario,
      'date': const TimestampConverter().toJson(instance.date),
    };
