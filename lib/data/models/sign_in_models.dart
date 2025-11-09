class SignInModels {
  final String message;
  final String accessToken;

  SignInModels({
    required this.message,
    required this.accessToken,
  });

  factory SignInModels.fromJson(Map<String, dynamic> json) {
    return SignInModels(
      message: json['message'],
      accessToken: json['accessToken'],
    );
  }
}
