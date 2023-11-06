import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/jobs_model.dart';
import '../../../services/job_api_service.dart';

part 'suggest_jobs_state.dart';

class SuggestJobsCubit extends Cubit<SuggestJobsState> {
  SuggestJobsCubit() : super(SuggestJobsInitial());

  // JobApiService jobApiService;

  // JobsModel? jobModel;

  Future<void> fetchSuggestJobs() async {
    emit(SuggestJobsLoading());
    try {
      JobsModel jobModel = await JobApiService.fetchSuggestedJobsData();
      // Add debug log to see the response
      emit(SuggestJobsSuccess(jobModel));
    } catch (e) {
      emit(SuggestJobsFailure(
          "Failed to fetch data. Please check your internet connection."));
    }
  }
}
