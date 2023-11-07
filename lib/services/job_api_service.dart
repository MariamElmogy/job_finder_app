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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      final dio = Dio();
      dio.options.headers['Authorization'] =
          'Bearer ${sharedPreferences.getString(kUserToken)}';
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    http.Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/$job_id'),
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      return JobsModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<JobsModel> fetchSuggestedJobsData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    http.Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/sugest/5'),
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}'
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      return JobsModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    dio.options.headers['Authorization'] =
        'Bearer ${sharedPreferences.getString(kUserToken)}';
    FormData formData = FormData.fromMap({
      'cv_file': await MultipartFile.fromFile(cvFile!.path),
      'other_file': await MultipartFile.fromFile(otherFile!.path),
      'name': name,
      'email': email,
      'work_type': selectedWorkType,
      'mobile': phone,
      'jobs_id': jobId,
      'user_id': sharedPreferences.get(kUserId),
    });

    sharedPreferences.setInt(kJobId, jobId);
    log('Job = $jobId');

    var response = await dio.post('$baseUrl/apply', data: formData);

    if (response.statusCode == 200) {
    } else {
      // Handle the response or error here
      log('Request failed with status code: ${response.statusCode}');
      log('Response data: ${response.data}');
    }
  }

  static Future<JobsModel> fetchSuccessfulApplyingJob() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    http.Client client = IOClient(httpClient);
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/${sharedPreferences.getInt(kJobId)}'),
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}'
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      return JobsModel.fromJson(data);
    } else {
      throw Exception('Failed to load job');
    }
  }

  static Future<List<ApplyJobsModel>> fetchAppliedJobs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      final dio = Dio();
      dio.options.headers['Authorization'] =
          'Bearer ${sharedPreferences.getString(kUserToken)}';
      var response =
          await dio.get('$baseUrl/apply/${sharedPreferences.getInt(kUserId)}');

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

  static Future<List<JobsModel>> searchJobs({required String job}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${sharedPreferences.getString(kUserToken)}';
    try {
      final response = await dio.post(
        '$baseUrl/jobs/search',
        data: {
          'name': job,
        },
      );
      if (response.statusCode == 200) {
        var data = response.data['data'];
        List<JobsModel> jobList = List.from(data)
            .map((jobData) => JobsModel.fromJson(jobData))
            .toList();

        return jobList;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
