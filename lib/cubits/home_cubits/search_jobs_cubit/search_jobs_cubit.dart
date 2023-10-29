import 'package:bloc/bloc.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/services/job_api_service.dart';
import 'package:meta/meta.dart';

part 'search_jobs_state.dart';

class SearchJobsCubit extends Cubit<SearchJobsState> {
  SearchJobsCubit(this.jobApiService) : super(SearchJobsInitial());

  JobApiService jobApiService;

  List<JobsModel>? jobModel;

  Future<void> fetchSearchJobs() async {
    emit(SearchJobsLoading());
    try {
      jobModel = await JobApiService.fetchAllJobsData();

      emit(SearchJobsSuccess(jobModel!));
    } on Exception catch (e) {
      emit(SearchJobsFailure(e.toString()));
    }
  }
}
