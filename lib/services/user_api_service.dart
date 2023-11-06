import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../models/user_model.dart';
import '../utils/shared_prefs.dart';

class UserApiService {
  static Future<UserModel> fetchUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/auth/profile'),
      headers: {
        'Authorization': 'Bearer ${SharedPrefs().token}',
      },
    );
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      log(jsonEncode(data));
      log(sharedPreferences.getString(kUserToken).toString());
      log(jsonEncode(data['id']));
      sharedPreferences.setInt(kUserId, data['id']);
      SharedPrefs().username = data['name'];
      log('name = ${SharedPrefs().username}');

      UserModel user = UserModel.fromJson(data);

      return user;
    } else {
      throw Exception('Error');
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
