part of 'search_jobs_cubit.dart';

@immutable
abstract class SearchJobsState {}

class SearchJobsInitial extends SearchJobsState {}

class SearchJobsLoading extends SearchJobsState {}

class SearchJobsSuccess extends SearchJobsState {
  final List<JobsModel> jobs;
  SearchJobsSuccess(this.jobs);
}

class SearchJobsFailure extends SearchJobsState {
  final String errMessage;
  SearchJobsFailure(this.errMessage);
}
