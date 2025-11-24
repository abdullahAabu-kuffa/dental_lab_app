class SignInModels {
  final String status;
  final String data;

  SignInModels({
    required this.status,
    required this.data,
  });

  factory SignInModels.fromJson(Map<String, dynamic> json) {
    return SignInModels(
      status: json['status'],
      data: json['data'],
    );
  }
}
