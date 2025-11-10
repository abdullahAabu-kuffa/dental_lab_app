import 'package:dental_lab_app/data/models/sign_in_models.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();
  Future<SignInModels> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'http://192.168.1.12:3001/api/auth/login',
        data: {'email': email, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return SignInModels.fromJson(response.data);
      } else {
        throw Exception('Failed to sign in: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during sign in: $e');
    }
  }
}
