class SignInModels {
  final String status;
  final Data data;

  SignInModels({required this.status, required this.data});

  factory SignInModels.fromJson(Map<String, dynamic> json) {
    return SignInModels(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final User user;
  final String accessToken;
  final String refreshToken;

  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}

class User {
  final int id;
  final String email;
  final String name;
  final String role;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      role: json['role'],
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'role': role,
  };
}
