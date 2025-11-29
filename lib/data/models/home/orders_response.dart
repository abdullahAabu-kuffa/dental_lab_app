import 'package:dental_lab_app/data/models/home/orders_data_model.dart';

class OrdersResponse {
  final String status;
  final String message;
  final OrdersData data;

  OrdersResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      message: json['message'],
      status: json['status'],
      data: OrdersData.fromJson(json['data']),
    );
  }

  toJson() {
    return {'message': message, 'status': status, 'data': data.toJson()};
  }
}
