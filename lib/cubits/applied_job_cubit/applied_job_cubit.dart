import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/apply_job_model.dart';
import '../../models/jobs_model.dart';
import '../../services/job_api_service.dart';

part 'applied_job_state.dart';

class AppliedJobCubit extends Cubit<AppliedJobState> {
  AppliedJobCubit(this.jobApiService) : super(AppliedJobInitial());

  JobApiService jobApiService;

  List<ApplyJobsModel>? jobModel;

  Future<void> fetchAppliedJobs() async {
    emit(AppliedJobsLoading());
    try {
      jobModel = await JobApiService.fetchAppliedJobs();
      emit(AppliedJobSuccess(jobModel!));
    } on Exception catch (e) {
      emit(AppliedJobFailure(errmessage: e.toString()));
    }
  }
}
