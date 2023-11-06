import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:job_finder_app/utils/constants.dart';
import 'package:job_finder_app/utils/shared_prefs.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/jobs_model.dart';

part 'search_jobs_state.dart';

class SearchJobsCubit extends Cubit<SearchJobsState> {
  SearchJobsCubit() : super(SearchJobsInitial());

  Future<List<JobsModel>> searchJobs({required String job}) async {
    emit(SearchJobsLoading());
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${sharedPrefs.getString(kUserToken)}';
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
        emit(SearchJobsSuccess(jobList));

        return jobList;
      }
    } catch (e) {
      emit(SearchJobsFailure(e.toString()));
    }
    return [];
  }
}
