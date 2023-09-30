import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/apply_job_model.dart';
import '../models/jobs_model.dart';
import '../utils/constants.dart';

import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;
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
    http.Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/sugest/5'),
      headers: {
        'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
      },
    );
    // log(jsonDecode(response.body).toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      // If the server did return a 200 OK response,
      // then parse the JSON.
      // log(jsonEncode(jsonDecode(response.body)['data']));
      // preferences.setInt(kJobId, data['id']);
      // log(' job Id : ${preferences.getInt(kJobId)}');
      return JobsModel.fromJson(data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future uploadFiles({
    required name,
    required email,
    required selectedWorkType,
    required phone,
    required cvFile,
    required otherFile,
  }) async {
    var dio = Dio();
    dio.options.followRedirects = true; // Allow following redirects
    dio.options.maxRedirects = 5; // Maximum number of redirects to follow

    SharedPreferences preferences = await SharedPreferences.getInstance();
    dio.options.headers['Authorization'] =
        'Bearer ${preferences.getString(kUserToken)}';
    FormData formData = FormData.fromMap({
      'cv_file': await MultipartFile.fromFile(cvFile!.path),
      'other_file': await MultipartFile.fromFile(otherFile!.path),
      'name': name,
      'email': email,
      'work_type': selectedWorkType,
      'mobile': phone,
      'jobs_id': 2,
      'user_id': 27,
    });

    var response = await dio.post(
      '$baseUrl/apply',
      data: formData,
    );
    if (response.statusCode == 200) {
    } else {
      // Handle the response or error here
      log('Request failed with status code: ${response.statusCode}');
      log('Response data: ${response.data}');
    }
  }

  static Future<List<ApplyJobsModel>> fetchSuccessfulApplyingJob() async {
    try {
      final dio = Dio();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      dio.options.headers['Authorization'] =
          'Bearer ${preferences.getString(kUserToken)}';
      var response = await dio.get('$baseUrl/apply/27');

      List<ApplyJobsModel> jobs = [];
      var items = response.data['data'];
      for (var jobMap in items) {
        try {
          jobs.add(ApplyJobsModel.fromJson(jobMap));
        } catch (e) {
          jobs.add(ApplyJobsModel.fromJson(jobMap));
        }
      }
      return jobs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
