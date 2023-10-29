import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:job_finder_app/services/user_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../models/user_model.dart';
import '../models/user_portofolio_model.dart';

class UserProfileApiService {
  static Future<void> addPortoflio() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);

      UserModel user = await UserApiService.fetchUserData();

      // Create a UserPortofolioModel with the name from the user data
      UserPortofolioModel model = UserPortofolioModel(
        cv_file: null, // Fill in other parameters as needed
        image: '',
        name: user.name, // Use the name from the user data
        email: user.email,
        user_id:
            preferences.getInt(kUserId), // Use the user ID from the user data
      );

      const url = '$baseUrl/user/profile/portofolios';
      final response = await client.post(
        Uri.parse(url),
        body: jsonEncode(model.toJson()),
        headers: {
          'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
        },
      );

      if (response.statusCode == 200) {
        json.decode(response.body);
      }
    } catch (e) {
      log('error = ${e.toString()}');
    }
  }

  // static Future<UserPortofolioModel> fetchUserPortofolio() async {
  //   final dio = Dio();
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   dio.options.headers['Authorization'] =
  //       'Bearer ${preferences.getString(kUserToken)}';
  //   try {
  //     var response = await dio.get('$baseUrl/user/profile/portofolios');

  //     if (response.statusCode == 200) {
  //       var items = response.data['data']['portfolio'];
  //       List<UserPortofolioModel> jobs = [];
  //       for (var jobMap in items) {
  //         jobs.add(UserPortofolioModel.fromJson(jobMap));
  //       }

  //       return jobs;
  //     } else if (response.statusCode == 404) {
  //       // Handle the case where there is no data
  //       return [];
  //     } else {
  //       // Handle other error cases
  //       throw Exception(
  //           'Failed to load favorites jobs. Status code: ${response.statusCode}');
  //     }
  //   } on DioError catch (e) {
  //     // Handle DioExceptions here
  //     if (e.response?.statusCode == 404) {
  //       // Handle the case where there is no data
  //       return [];
  //     } else {
  //       // Handle other DioError cases
  //       throw Exception('Failed to load favorites jobs: ${e.message}');
  //     }
  //   }
  // }
  static Future<UserPortofolioModel?> fetchUserPortofolio() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    Client client = IOClient(httpClient);

    final response = await client.get(
      Uri.parse('$baseUrl/user/profile/portofolios'),
      headers: {
        'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
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
