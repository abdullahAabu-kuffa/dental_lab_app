class RegisterModel {
  final String status;
  final String message;

  RegisterModel({required this.message, required this.status});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(message: json['message'], status: json['status']);
  }
}
