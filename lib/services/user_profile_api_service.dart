import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:job_finder_app/utils/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../models/user_portofolio_model.dart';

class UserProfileApiService {
  static Future<void> addUserImage({required File image}) async {
    try {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);
      const url = '$baseUrl/user/profile/portofolios';
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${SharedPrefs().token}',
        },
        body: {'image': image},
      );

      if (response.statusCode == 200) {
        json.decode(response.body);
      }
    } catch (e) {
      log('error = ${e.toString()}');
    }
  }

  static Future<UserPortofolioModel?> fetchUserPortofolio() async {
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    Client client = IOClient(httpClient);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final response = await client.get(
      Uri.parse('$baseUrl/user/profile/portofolios'),
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}',
      },
    );

    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      final data = jsonDecode(response.body)['data']['portfolio'];

      if (data is List) {
        // If the 'portfolio' field is a list, you can map it to a list of UserPortofolioModel
        List<UserPortofolioModel> users = List<UserPortofolioModel>.from(
            data.map((item) => UserPortofolioModel.fromJson(item)));

        // Now, you have a list of UserPortofolioModel objects.
        return users.isNotEmpty ? users.first : null;
      } else {
        // Handle the case where 'portfolio' is not a list
        throw Exception('Invalid data format for portfolio');
      }
    } else if (response.statusCode == 404) {
      // Handle the case where there is no data
      return null;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
