import 'package:bloc/bloc.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/services/job_api_service.dart';
import 'package:meta/meta.dart';

part 'recent_jobs_state.dart';

class RecentJobsCubit extends Cubit<RecentJobsState> {
  RecentJobsCubit(this.jobApiService) : super(RecentJobsInitial());

  JobApiService jobApiService;

  List<JobsModel>? jobModel;

  Future<void> fetchRecentJobs() async {
    emit(RecentJobsLoading());
    try {
      jobModel = await JobApiService.fetchAllJobsData();

      emit(RecentJobsSuccess(jobModel!));
    } on Exception catch (e) {
      emit(RecentJobsFailure(e.toString()));
    }
  }
}
