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
    json['images'] == null ? '' : json['images'][0]['src'] as String,
    json['stock_quantity'] == null ? 0 : json['stock_quantity'] as int,
    json['price'] as String,
    json['stock_quantity'] == null ? 0 : json['stock_quantity'] as int,
    json['total_sales'] as int,
    json['average_rating'] as String,
    (30)?.toDouble(),
    like: false,
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

