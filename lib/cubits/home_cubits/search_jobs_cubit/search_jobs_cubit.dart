import 'package:bloc/bloc.dart';
import 'package:job_finder_app/services/job_api_service.dart';
import 'package:meta/meta.dart';

import '../../../models/jobs_model.dart';

part 'search_jobs_state.dart';

class SearchJobsCubit extends Cubit<SearchJobsState> {
  SearchJobsCubit() : super(SearchJobsInitial());

  Future<List<JobsModel>> searchJobs({required String job}) async {
    emit(SearchJobsLoading());
    try {
      List<JobsModel> jobModel = await JobApiService.searchJobs(job: job);

      emit(SearchJobsSuccess(jobModel));
    } on Exception catch (e) {
      emit(SearchJobsFailure(e.toString()));
    }
    return [];
  }
}
