// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'order.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// import 'package:ecommerce_app_ui_kit/models/order.dart';

// Order _$OrderFromJson(Map<String, dynamic> order) {
//   return Order(
//   order['id'] as int,
// Product(
//               order['line_items'][0]['product_id'],
//               order['line_items'][0]['name'],
//               order['line_items'][0]['description'] ?? '',
//               '',
//               order['line_items'][0]['quantity'],
//               order['line_items'][0]['total'] ,
//               order['line_items'][0]['quantity'] ,
//               order['line_items'][0]['quantity'],
//               '',
//               1,
//               like: false),
//                  order['order_key'] as String,
//     _$enumDecodeNullable(_$OrderStateEnumMap, order['status']),
//     order['quantity'] as int,
//   )
//   ..dateTime = order['date_created'] == null
//       ? null
//       : DateTime.parse(order['date_created'] as String);
// }

// Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
//       'id': instance.id,
//       'product': instance.product,
//       'quantity': instance.quantity,
//       'trackingNumber': instance.trackingNumber,
//       'dateTime': instance.dateTime?.toIso8601String(),
//       'orderState': _$OrderStateEnumMap[instance.orderState],
//     };

// T _$enumDecode<T>(
//   Map<T, dynamic> enumValues,
//   dynamic source, {
//   T unknownValue,
// }) {
//   if (source == null) {
//     throw ArgumentError('A value must be provided. Supported values: '
//         '${enumValues.values.join(', ')}');
//   }

//   final value = enumValues.entries
//       .singleWhere((e) => e.value == source, orElse: () => null)
//       ?.key;

//   if (value == null && unknownValue == null) {
//     throw ArgumentError('`$source` is not one of the supported values: '
//         '${enumValues.values.join(', ')}');
//   }
//   return value ?? unknownValue;
// }

// T _$enumDecodeNullable<T>(
//   Map<T, dynamic> enumValues,
//   dynamic source, {
//   T unknownValue,
// }) {
//   if (source == null) {
//     return null;
//   }
//   return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
// }

// const _$OrderStateEnumMap = {
//   OrderState.unpaid: 'unpaid',
//   OrderState.toBeShipped: 'toBeShipped',
//   OrderState.shipped: 'shipped',
//   OrderState.inDispute: 'inDispute',
// };
