import 'package:dental_lab_app/core/networking/api_constants.dart';
import 'package:dental_lab_app/data/models/auth/register_models.dart';
import 'package:dental_lab_app/data/models/auth/sign_in_models.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<SignInModels> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}/api/auth/login',
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

  Future<RegisterModel> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
    required String clinicName,
    required String clinicAddress,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}/auth/register',
        data: {
          'fullName': fullName,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
          'clinicName': clinicName,
          'clinicAddress': clinicAddress,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return RegisterModel.fromJson(response.data);
      } else {
        throw Exception('Failed to register: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'An error occurred during registration.';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timed out. Please try again later.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Server response timed out. Please try again later.';
      } else if (e.type == DioExceptionType.badResponse) {
        // The server returned a non-2xx response
        errorMessage =
            'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
      } else if (e.type == DioExceptionType.unknown) {
        errorMessage = 'Network error: ${e.message}';
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unexpected error during registration: $e');
    }
  }
}
