import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/jobs_model.dart';
import '../../../services/job_api_service.dart';

part 'suggest_jobs_state.dart';

class SuggestJobsCubit extends Cubit<SuggestJobsState> {
  SuggestJobsCubit(this.jobApiService) : super(SuggestJobsInitial());

   JobApiService jobApiService;

  List<JobsModel>? jobModel;

  Future<void> fetchSuggestJobs() async {
    emit(SuggestJobsLoading());
    try {
      jobModel = await JobApiService.fetchAllJobsData();

      emit(SuggestJobsSuccess(jobModel!));
    } on Exception catch (e) {
      emit(SuggestJobsFailure(e.toString()));
    }
  }
}
