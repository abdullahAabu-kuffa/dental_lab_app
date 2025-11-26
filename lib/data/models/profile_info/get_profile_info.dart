class UserResponse {
  final String status;
  final String message;
  final UserData data;

  UserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data.toJson()};
  }
}

class UserData {
  final UserModel user;

  UserData({required this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(user: UserModel.fromJson(json['user'] ?? {}));
  }

  Map<String, dynamic> toJson() {
    return {'user': user.toJson()};
  }
}

class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String clinicName;
  final String clinicAddress;
  final String role;
  final bool isActive;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<dynamic> orders;
  final List<dynamic> invoices;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.clinicName,
    required this.clinicAddress,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.orders,
    required this.invoices,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      clinicName: json['clinicName'] ?? '',
      clinicAddress: json['clinicAddress'] ?? '',
      role: json['role'] ?? '',
      isActive: json['isActive'] ?? false,
      isVerified: json['isVerified'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      orders: json['orders'] ?? [],
      invoices: json['invoices'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'clinicName': clinicName,
      'clinicAddress': clinicAddress,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'orders': orders,
      'invoices': invoices,
    };
  }
}
