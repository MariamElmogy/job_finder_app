import 'package:dio/dio.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/jobs_model.dart';
import '../utils/constants.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

class FavoritesApiService {
  static Future<List<FavoritesJobsModel>> fetchAllFavoritesJobs() async {
    final dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dio.options.headers['Authorization'] =
        'Bearer ${preferences.getString(kUserToken)}';

    try {
      var response = await dio.get('$baseUrl/favorites');

      if (response.statusCode == 200) {
        var items = response.data['data'];
        List<FavoritesJobsModel> jobs = [];
        for (var jobMap in items) {
          jobs.add(FavoritesJobsModel.fromJson(jobMap));
        }
        return jobs;
      } else if (response.statusCode == 404) {
        // Handle the case where there is no data
        return [];
      } else {
        // Handle other error cases
        throw Exception(
            'Failed to load favorites jobs. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      // Handle DioExceptions here
      if (e.response?.statusCode == 404) {
        // Handle the case where there is no data
        return [];
      } else {
        // Handle other DioError cases
        throw Exception('Failed to load favorites jobs: ${e.message}');
      }
    }
  }

  static Future<void> addFavoritesJobs({required job_id}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);

      const url = '$baseUrl/favorites';
      final response = await client.post(
        Uri.parse(url),
        body: {
          'job_id': job_id,
        },
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

  static Future<void> deleteAllFavoriteJobs() async {
    List<FavoritesJobsModel> favoriteJobs = await fetchAllFavoritesJobs();
    for (var favoriteJob in favoriteJobs) {
      // get the id of each favorite job
      var favoriteJobId = favoriteJob.id;
      // delete the favorite job
      await deleteFavoriteJob(favoriteJobId.toString());
    }
  }

  static Future<void> deleteFavoriteJob(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);

      String url = '$baseUrl/favorites/$id';
      final response = await client.delete(
        Uri.parse(url),
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

  static Dio dio = Dio();

  static Future<void> cancelSaveFavoriteJob(FavoritesJobsModel job) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dio.options.headers['Authorization'] =
        'Bearer ${preferences.getString(kUserToken)}';

    try {
      var response = await dio.delete('$baseUrl/favorites/${job.id}');

      if (response.statusCode == 200) {
        print('Job removed from favorites');
      } else {
        print('Failed to remove job from favorites');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  //... other functions

  static void deleteJob(JobsModel jobToDelete) async {
    List<FavoritesJobsModel> favoriteJobs =
        await FavoritesApiService.fetchAllFavoritesJobs();

    for (var favoriteJob in favoriteJobs) {
      if (favoriteJob.job_name == jobToDelete.name) {
        // if the job in the list matches the job to delete, delete it
        await FavoritesApiService.deleteFavoriteJob(favoriteJob.id.toString());
        break;
      }
    }
  }
}
