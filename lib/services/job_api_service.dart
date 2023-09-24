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
      preferences.setInt(kJobId, data['id']);
      // log(' job Id : ${preferences.getInt(kJobId)}');
      return JobsModel.fromJson(data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<void> applyJob(ApplyJobsModel jobs) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      http.Client client = IOClient(httpClient);
      const url = '$baseUrl/apply';
      log('name  = ${jobs.name.toString()}');
      log('email  = ${jobs.email.toString()}');
      log('cv_file  = ${jobs.cv_file.toString()}');
      log('mobile  = ${jobs.mobile.toString()}');
      log('work_type  = ${jobs.work_type.toString()}');
      log('other_file  = ${jobs.other_file.toString()}');
      log('user_id  = ${jobs.user_id.toString()}');
      log('jobs_id  = ${jobs.jobs_id.toString()}');

      final response = await client.post(
        Uri.parse(url),
        body: {
          'cv_file': 'jobs.cv_file',
          'name': jobs.name,
          'email': jobs.email,
          'mobile': jobs.mobile,
          'work_type': jobs.work_type,
          'other_file': 'jobs.other_file',
          'user_id': preferences.getInt(kUserId).toString(),
          'jobs_id': preferences.getInt(kJobId).toString(),
        },
      );
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        json.decode(response.body);
      }
    } catch (e) {
      log('error = ${e.toString()}');
    }
  }
}
