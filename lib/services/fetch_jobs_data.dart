import 'package:dio/dio.dart';
import 'package:job_finder_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/jobs_model.dart';


  // List<JobsModel> jobs = [];

  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // HttpClient httpClient = HttpClient();
  // httpClient.badCertificateCallback =
  //     ((X509Certificate cert, String host, int port) => true);
  // Client client = IOClient(httpClient);
  // final response = await client.get(
  //   Uri.parse('$baseUrl/jobs/2'),
  //   headers: {
  //     'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
  //   },
  // );
  // // log(jsonDecode(response.body).toString());
  // log(response.statusCode.toString());
  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   log(jsonEncode(jsonDecode(response.body)['data']));
  //   jobs.add(JobsModel.fromJson(jsonDecode(response.body)['data']));
  //   return jobs;
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }
// }
