import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../models/user_model.dart';

class UserApiService {
  static Future<UserModel> fetchUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/auth/profile'),
      headers: {
        'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
      },
    );
    // log(jsonDecode(response.body).toString());
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(jsonEncode(jsonDecode(response.body)['data']));

      log(jsonEncode(jsonDecode(response.body)['data']['id']));
      preferences.setInt(kUserId, jsonDecode(response.body)['data']['id']);

      log(preferences.getString(kUserToken).toString());
      return UserModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<void> getOtp({required String email}) async {
    try {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);

      const url = '$baseUrl/auth/otp';
      final response = await client.post(
        Uri.parse(url),
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        json.decode(response.body);
      }
    } catch (e) {
      log('error = ${e.toString()}');
    }
  }

  static Future<void> updatePassword({required String password}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);
      const url = '$baseUrl/auth/user/update';
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
        },
        body: {
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        json.decode(response.body);
      }
    } catch (e) {
      log('error = ${e.toString()}');
    }
  }
}
