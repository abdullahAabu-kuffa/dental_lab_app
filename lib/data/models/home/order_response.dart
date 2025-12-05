
class OrderResponse {
  final String status;
  final String message;
  final OrderData data;

  OrderResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      status: json['status'],
      message: json['message'],
      data: OrderData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data.toJson()};
  }
}

class OrderData {
  final List<Order> orders;
  final int page;
  final int limit;
  final int totalOrders;
  final int totalPages;

  OrderData({
    required this.orders,
    required this.page,
    required this.limit,
    required this.totalOrders,
    required this.totalPages,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      orders: (json['orders'] as List)
          .map((order) => Order.fromJson(order))
          .toList(),
      page: json['page'],
      limit: json['limit'],
      totalOrders: json['totalOrders'],
      totalPages: json['totalPages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders.map((o) => o.toJson()).toList(),
      'page': page,
      'limit': limit,
      'totalOrders': totalOrders,
      'totalPages': totalPages,
    };
  }
}

class Order {
  final int id;
  final int userId;
  final String status;
  final int? invoiceId;
  final Options options;
  final double totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Order({
    required this.id,
    required this.userId,
    required this.status,
    this.invoiceId,
    required this.options,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      status: json['status'],
      invoiceId: json['invoiceId'],
      options: Options.fromJson(json['options']),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status,
      'invoiceId': invoiceId,
      'options': options.toJson(),
      'totalPrice': totalPrice,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'user': user.toJson(),
    };
  }
}

class Options {
  final String note;
  final String patientName;
  final List<Service> selectedServices;

  Options({
    required this.note,
    required this.patientName,
    required this.selectedServices,
  });

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      note: json['note'],
      patientName: json['patientName'],
      selectedServices: (json['selectedServices'] as List)
          .map((s) => Service.fromJson(s))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'note': note,
      'patientName': patientName,
      'selectedServices': selectedServices.map((s) => s.toJson()).toList(),
    };
  }
}

class Service {
  final String label;
  final double price;

  Service({required this.label, required this.price});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      label: json['label'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'price': price};
  }
}

class User {
  final int id;
  final String email;
  final String role;
  final String clinicAddress;
  final String clinicName;
  final String fullName;
  final bool isActive;
  final String phoneNumber;
  final bool isVerified;

  User({
    required this.id,
    required this.email,
    required this.role,
    required this.clinicAddress,
    required this.clinicName,
    required this.fullName,
    required this.isActive,
    required this.phoneNumber,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      role: json['role'],
      clinicAddress: json['clinicAddress'],
      clinicName: json['clinicName'],
      fullName: json['fullName'],
      isActive: json['isActive'],
      phoneNumber: json['phoneNumber'],
      isVerified: json['isVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role,
      'clinicAddress': clinicAddress,
      'clinicName': clinicName,
      'fullName': fullName,
      'isActive': isActive,
      'phoneNumber': phoneNumber,
      'isVerified': isVerified,
    };
  }
}
