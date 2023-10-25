import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:job_finder_app/models/apply_job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          log(e.toString());
        }
      }

      return jobs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<JobsModel> fetchJobData({required job_id}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    http.Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/$job_id'),
      headers: {
        'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      return JobsModel.fromJson(data);
    } else {
      throw Exception('Failed to load album');
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
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      return JobsModel.fromJson(data);
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future applyJob(
      {required name,
      required email,
      required selectedWorkType,
      required phone,
      required cvFile,
      required otherFile,
      required jobId}) async {
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
      'jobs_id': jobId,
      'user_id': preferences.getInt(kUserId),
    });

    preferences.setInt(kJobId, jobId);

    var response = await dio.post(
      '$baseUrl/apply',
      data: formData
    );
    
    if (response.statusCode == 200) {
    } else {
      // Handle the response or error here
      log('Request failed with status code: ${response.statusCode}');
      log('Response data: ${response.data}');
    }
  }

  static Future<JobsModel> fetchSuccessfulApplyingJob() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    http.Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/${preferences.getInt(kJobId)}'),
      headers: {
        'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      return JobsModel.fromJson(data);
    } else {
      throw Exception('Failed to load album');
    }
  }

   static Future<List<ApplyJobsModel>> fetchAppliedJobs() async {
    try {
      final dio = Dio();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      dio.options.headers['Authorization'] =
          'Bearer ${preferences.getString(kUserToken)}';
      var response = await dio.get('$baseUrl/apply/${preferences.getInt(kUserId)}');

      List<ApplyJobsModel> jobs = [];
      var items = response.data['data'];
      for (var jobMap in items) {
        try {
          jobs.add(ApplyJobsModel.fromJson(jobMap));
        } catch (e) {
          log(e.toString());
        }
      }

      return jobs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
