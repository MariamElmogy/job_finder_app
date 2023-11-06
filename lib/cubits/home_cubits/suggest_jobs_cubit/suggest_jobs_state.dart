part of 'suggest_jobs_cubit.dart';

@immutable
abstract class SuggestJobsState {}

class SuggestJobsInitial extends SuggestJobsState {}

class SuggestJobsLoading extends SuggestJobsState {}

class SuggestJobsSuccess extends SuggestJobsState {
  final JobsModel jobs;
  SuggestJobsSuccess(this.jobs);
}

class SuggestJobsFailure extends SuggestJobsState {
  final String errMessage;
  SuggestJobsFailure(this.errMessage);
}
