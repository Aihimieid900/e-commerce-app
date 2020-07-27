// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'product.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// Product _$ProductFromJson(Map<String, dynamic> json) {
//   return Product(
//     json['id'] as int,
//     json['name'] as String,
//     json['description'] as String,
//     json['image'] as String,
//     json['available'] as int,
//     json['price'] as String,
//     json['quantity'] as int,
//     json['sales'] as int,
//     json['rate'] as String,
//     (json['discount'] as num)?.toDouble(),
//     like: json['like'] as bool,
//   );
// }

// Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'description': instance.description,
//       'image': instance.image,
//       'available': instance.available,
//       'price': instance.price,
//       'quantity': instance.quantity,
//       'sales': instance.sales,
//       'rate': instance.rate,
//       'discount': instance.discount,
//       'like': instance.like,
//     };
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
    json['short_description'] as String,
    json['images'] == null ? '' : json['images'][0]['src'] as String,
    json['stock_quantity'] == null ? 0 : json['stock_quantity'] as int,
    json['price'] as String,
    json['total_sales'] == '0' ? 0 : json['total_sales'] as int,
    json['average_rating'] as String,
    json['sale_price'] != ''
        ? double.parse(json['price']) * 100 / double.parse(json['sale_price'])
        : 0.00,
    sale: json['on_sale'],
    quantity: 0,
    like: false,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'short_description': instance.shortDescription,
      'image': instance.image,
      'available': instance.available,
      'price': instance.price,
      'sales': instance.sales,
      'rate': instance.rate,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'like': instance.like,
    };
