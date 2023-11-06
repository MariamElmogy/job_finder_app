part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserPortofolioModel userPortofolio; // Replace with your data model
  ProfileSuccess({required this.userPortofolio});
}

class ProfileLoading extends ProfileState {}

class ProfileNoData extends ProfileState {}


class ProfileFailure extends ProfileState {
  final String errMessage;
  ProfileFailure({required this.errMessage});
}
