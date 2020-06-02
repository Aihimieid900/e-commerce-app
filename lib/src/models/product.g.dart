// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    json['image'] as String,
    json['available'] as int,
    json['price'] as String,
    json['quantity'] as int,
    json['sales'] as int,
    json['rate'] as String,
    (json['discount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'available': instance.available,
      'quantity': instance.quantity,
      'sales': instance.sales,
      'rate': instance.rate,
      'discount': instance.discount,
    };
