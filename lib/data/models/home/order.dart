class Order {
  final int id;
  final int userId;
  final List<Map<String, dynamic>> options;
  final double totalPrice;
  final String status;
  final int invoiceId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.userId,
    required this.options,
    required this.totalPrice,
    required this.status,
    required this.invoiceId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      options: List<Map<String, dynamic>>.from(json['options']),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'],
      invoiceId: json['invoiceId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'options': options,
      'totalPrice': totalPrice,
      'status': status,
      'invoiceId': invoiceId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
