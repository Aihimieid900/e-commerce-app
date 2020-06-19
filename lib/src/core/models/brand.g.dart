// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
    json['id'] as int,
    json['name'] as String,
    json['count'] as int,
    Colors.cyanAccent,
    false,
    [],
  );
}

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'color': instance.color,
      'selected': instance.selected,
      'products': instance.products,
    };
