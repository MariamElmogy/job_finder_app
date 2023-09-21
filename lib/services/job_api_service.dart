import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/jobs_model.dart';
import '../models/suggest_job_model.dart';
import '../utils/constants.dart';

import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

class JobApiService {
  static Future<List<JobsModel>> fetchAllJobsData() async {
    try {
      final dio = Dio();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      dio.options.headers['Authorization'] =
          'Bearer ${preferences.getString(kUserToken)}';
      var response = await dio.get('$baseUrl/jobs');

      List<JobsModel> jobs = [];
      var items = response.data['data'];
      for (var jobMap in items) {
        try {
          jobs.add(JobsModel.fromJson(jobMap));
        } catch (e) {
          jobs.add(JobsModel.fromJson(jobMap));
        }
      }
      return jobs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<JobsModel> fetchSuggestedJobsData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/sugest/5'),
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
      return JobsModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    //   try {
    //     final dio = Dio();
    //     SharedPreferences preferences = await SharedPreferences.getInstance();
    //     dio.options.headers['Authorization'] =
    //         'Bearer ${preferences.getString(kUserToken)}';
    //     var response = await dio.get('$baseUrl/jobs/sugest/5');

    //     List<JobsModel> jobs = [];
    //     var items = response.data['data'];
    //     log(items);
    //      jobs.add(JobsModel.fromJson(items));
    //     // for (var jobMap in items) {
    //     //   try {
    //     //     jobs.add(JobsModel.fromJson(jobMap));
    //     //   } catch (e) {
    //     //     jobs.add(JobsModel.fromJson(jobMap));
    //     //   }
    //     // }
    //     return jobs;
    //   } catch (e) {
    //     throw Exception(e.toString());
    //   }
  }
}
