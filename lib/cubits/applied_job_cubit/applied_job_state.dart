part of 'applied_job_cubit.dart';

@immutable
abstract class AppliedJobState {}

class AppliedJobInitial extends AppliedJobState {}

class AppliedJobsLoading extends AppliedJobState {}

class AppliedJobSuccess extends AppliedJobState {
  final List<ApplyJobsModel> jobs;
  AppliedJobSuccess(this.jobs);
}

class AppliedJobFailure extends AppliedJobState {
  final String errmessage;
  AppliedJobFailure({required this.errmessage});
}
