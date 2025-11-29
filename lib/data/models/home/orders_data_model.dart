import 'package:dental_lab_app/data/models/home/order.dart';

class OrdersData {
  final List<Order> orders;
  final num page;
  final num limit;
  final num totalOrders;
  final num totalPages;

  OrdersData({
    required this.orders,
    required this.page,
    required this.limit,
    required this.totalOrders,
    required this.totalPages,
  });

  factory OrdersData.fromJson(Map<String, dynamic> json) {
    return OrdersData(
      orders: (json['orders'] as List)
          .map((orderJson) => Order.fromJson(orderJson))
          .toList(),
      page: json['page'],
      limit: json['limit'],
      totalOrders: json['totalOrders'],
      totalPages: json['totalPages'],
    );
  }

  toJson(){
    return {
      'orders': orders.map((order) => order.toJson()).toList(),
      'page': page,
      'limit': limit,
      'totalOrders': totalOrders,
      'totalPages': totalPages,
    };
  }
}
