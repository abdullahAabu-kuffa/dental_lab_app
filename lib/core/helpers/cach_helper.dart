import 'dart:convert';

import 'package:dental_lab_app/data/models/home/orders_response.dart';
import 'package:dental_lab_app/data/models/profile_info/get_profile_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  CachHelper._();
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setOpened() async {
    await prefs.setBool('isOpened', true);
  }

  static getOpened() {
    return prefs.getBool('isOpened') ?? false;
  }

  static Future<bool> setLoggdIn(value) async {
    return await prefs.setBool('loggedIn', value);
  }

  static getLoggdIn() {
    return prefs.getBool('loggedIn') ?? false;
  }

  static setLoggedInUserId(value) async {
    return await prefs.setString('loggedInUser', value);
  }

  static getLoggedInUserId() {
    return prefs.getString('loggedInUser');
  }

  static setUser(Map<String, dynamic> user) async {
    return await prefs.setString('user', jsonEncode(user));
  }

  static Map<String, dynamic>? getUser() {
    final userString = prefs.getString('user');
    if (userString == null) return null;

    final decoded = jsonDecode(userString);

    if (decoded is Map<String, dynamic>) {
      return decoded;
    } else {
      return null;
    }
  }

  static saveAccessToken(accessToken) async {
    return await prefs.setString('accessToken', accessToken);
  }

  static getAccessToken() {
    return prefs.getString('accessToken');
  }

  static saveRefreshToken(refreshToken) async {
    return await prefs.setString('refreshToken', refreshToken);
  }

  static getRefreshToken() {
    return prefs.getString('refreshToken');
  }

  static setLang(value) async{
    return await prefs.setString('lang', value);
  }

  static getLang() {
    return prefs.getString('lang');
  }

  static setTheme(value) async{
    return await prefs.setBool('theme', value);
  }

  static getTheme() {
    return prefs.getBool('theme');
  }

  static const String _profileDataKey = 'profile_data';
  static const String _userOrdersKey = 'userOrdersKey';

  static Future<bool> setProfileData(UserResponse profile) async {
    final String jsonString = jsonEncode(profile.toJson());
    return await prefs.setString(_profileDataKey, jsonString);
  }

  static UserResponse? getProfileData() {
    final String? jsonString = prefs.getString(_profileDataKey);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return UserResponse.fromJson(jsonMap);
    }
    return null;
  }

  static clearProfileData() async {
    return await prefs.remove(_profileDataKey);
  }

  static Future<bool> setUserOrdersData(OrdersResponse usreOrders) async {
    final String jsonString = jsonEncode(usreOrders.toJson());
    return await prefs.setString(_userOrdersKey, jsonString);
  }

  static OrdersResponse? getUserOrders() {
    final String? jsonString = prefs.getString(_userOrdersKey);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return OrdersResponse.fromJson(jsonMap);
    }
    return null;
  }
}
