import 'package:dio/dio.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

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
}
