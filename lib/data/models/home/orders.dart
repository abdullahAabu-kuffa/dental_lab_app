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
}
