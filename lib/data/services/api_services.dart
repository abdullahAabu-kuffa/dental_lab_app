import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/networking/api_constants.dart';
import 'package:dental_lab_app/data/models/Rag/rag_response.dart';
import 'package:dental_lab_app/data/models/auth/register_models.dart';
import 'package:dental_lab_app/data/models/auth/sign_in_models.dart';
import 'package:dental_lab_app/data/models/home/order_response.dart'
    hide Options;
import 'package:dental_lab_app/data/models/profile_info/edit_profile_info.dart';
import 'package:dental_lab_app/data/models/profile_info/get_profile_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<SignInModels> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}/auth/login',
        data: {'email': email, 'password': password, 'clientType': 'mobile'},
      );

      if (response.statusCode == 201) {
        // debugPrint('Response data: ${response.data['user']}');
        return SignInModels.fromJson(response.data);
      } else {
        throw Exception('Failed to sign in: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'An error occurred during sign in.';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timed out. Please try again later.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Server response timed out. Please try again later.';
      } else if (e.type == DioExceptionType.badResponse) {
        errorMessage =
            'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
      } else if (e.type == DioExceptionType.unknown) {
        errorMessage = 'Network error: ${e.message}';
      }
      debugPrint(errorMessage);
      throw Exception(errorMessage);
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

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data is Map<String, dynamic>) {
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

  //
  //fetch the profile info
  Future<UserResponse> getProfileInfo() async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/users/me',
        options: Options(
          headers: {'Authorization': 'Bearer ${CachHelper.getAccessToken()}'},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //debugPrint('Response data: ${response.data}');
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch profile info: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'An error occurred during fetching profile info.';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timed out. Please try again later.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Server response timed out. Please try again later.';
      } else if (e.type == DioExceptionType.badResponse) {
        errorMessage =
            'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
      } else if (e.type == DioExceptionType.unknown) {
        errorMessage = 'Network error: ${e.message}';
      }
      throw Exception(errorMessage);
    }
  }

  //edit profile data
  Future<EditProfileInfo> editProfileInfo({
    fullName,
    phoneNumber,
    clinickName,
    clinickAdress,
  }) async {
    try {
      final id = CachHelper.getLoggedInUserId();
      //debugPrint('ID: $id');
      final response = await _dio.patch(
        '${ApiConstants.baseUrl}/users/$id',
        data: {
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'clinicName': clinickName,
          'clinicAddress': clinickAdress,
        },
        options: Options(
          headers: {'Authorization': 'Bearer ${CachHelper.getAccessToken()}'},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //debugPrint('Response data: ${response.data}');
        return EditProfileInfo.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch profile info: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'An error occurred during fetching profile info.';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timed out. Please try again later.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Server response timed out. Please try again later.';
      } else if (e.type == DioExceptionType.badResponse) {
        errorMessage =
            'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
      } else if (e.type == DioExceptionType.unknown) {
        errorMessage = 'Network error: ${e.message}';
      }
      throw Exception(errorMessage);
    }
  }

  // calling the rag api
  Future<RagResponse> ragApi({required String question}) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}/rag/query',
        data: {'question': question},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //debugPrint('Response data: ${response.data['answer']}');
        return RagResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch profile info: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'An error occurred during fetching profile info.';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timed out. Please try again later.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Server response timed out. Please try again later.';
      } else if (e.type == DioExceptionType.badResponse) {
        errorMessage =
            'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
      } else if (e.type == DioExceptionType.unknown) {
        errorMessage = 'Network error: ${e.message}';
      }
      throw Exception(errorMessage);
    }
  }

  // log interceptor
  static final dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );

  // fetec user orders
  Future<OrderResponse> fetchUserOrders() async {
    try {
      //debugPrint('token: ${CachHelper.getAccessToken()}');
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/orders',
        options: Options(
          headers: {'Authorization': 'Bearer ${CachHelper.getAccessToken()}'},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // debugPrint('Response orders data: ${response.data}');
        return OrderResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch user orders: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Default message
      String errorMessage = 'An error occurred while fetching user orders.';

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timed out. Please try again later.';
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = 'Request timed out while sending data.';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Server response timed out. Please try again later.';
          break;
        case DioExceptionType.badResponse:
          final statusCode = e.response?.statusCode;
          final statusMessage = e.response?.statusMessage ?? 'Unknown error';
          errorMessage = 'Server error ($statusCode): $statusMessage';
          break;
        case DioExceptionType.cancel:
          errorMessage = 'Request was cancelled. Please retry.';
          break;
        case DioExceptionType.unknown:
          errorMessage = 'Network error: ${e.message ?? 'Unknown issue'}';
          break;
        default:
          errorMessage = 'Unexpected error occurred. Please try again.';
      }

      throw Exception(errorMessage);
    }
  }
}
