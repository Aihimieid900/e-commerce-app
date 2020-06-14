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
    like: json['like'] as bool,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'available': instance.available,
      'price': instance.price,
      'quantity': instance.quantity,
      'sales': instance.sales,
      'rate': instance.rate,
      'discount': instance.discount,
      'like': instance.like,
    };
