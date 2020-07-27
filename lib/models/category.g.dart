// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'category.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// Category _$CategoryFromJson(Map<String, dynamic> json) {
//   return Category(
//     json['id'] as int,
//     json['name'] as String,
//     json['display'] as String,
//     json['selected'] as bool,
//     (json['products'] as List)
//         ?.map((e) => e == null ? null : Product.fromJson(e))
//         ?.toList(),
//     (json['subCategory'] as List)
//         ?.map((e) => e == null ? null : SubCategory.fromJson(e))
//         ?.toList(),
//     json['parent'] as int,
//   );
// }

// Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'selected': instance.selected,
//       'display': instance.display,
//       'products': instance.products,
//       'subCategory': instance.subCategory,
//       'parent': instance.parent,
//     };

// SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) {
//   return SubCategory(
//     json['id'] as int,
//     json['name'] as String,
//     json['display'] as String,
//     json['selected'] as bool,
//     (json['products'] as List)
//         ?.map((e) => e == null ? null : Product.fromJson(e))
//         ?.toList(),
//     json['parent'] as int,
//   )..subCategory = (json['subCategory'] as List)
//       ?.map((e) => e == null ? null : SubCategory.fromJson(e))
//       ?.toList();
// }

// Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'display': instance.display,
//       'selected': instance.selected,
//       'products': instance.products,
//       'subCategory': instance.subCategory,
//       'parent': instance.parent,
//     };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['id'] as int,
    json['name'] as String,
    json['display'] as String,
    false,
    [],
    
    json['parent'] as int,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'selected': instance.selected,
      'display': instance.display,
      'products': instance.products,
      // 'subCategory': instance.subCategory,
      'parent': instance.parent,
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) {
  return SubCategory(
    json['id'] as int,
    json['name'] as String,
    json['display'] as String,
    false,
    [],
    json['parent'] as int,
  );
}

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display': instance.display,
      'selected': instance.selected,
      'products': instance.products,
      'parent': instance.parent,
    };
