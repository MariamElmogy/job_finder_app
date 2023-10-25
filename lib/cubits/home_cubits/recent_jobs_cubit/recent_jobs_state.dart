part of 'recent_jobs_cubit.dart';

@immutable
abstract class RecentJobsState {}

class RecentJobsInitial extends RecentJobsState {}

class RecentJobsLoading extends RecentJobsState {}

class RecentJobsSuccess extends RecentJobsState {
  final List<JobsModel> jobs;
  RecentJobsSuccess(this.jobs);
}

class RecentJobsFailure extends RecentJobsState {
  final String errMessage;
  RecentJobsFailure(this.errMessage);
}
