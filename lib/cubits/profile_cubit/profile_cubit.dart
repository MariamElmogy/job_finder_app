import 'package:bloc/bloc.dart';
import 'package:job_finder_app/services/user_profile_api_service.dart';
import 'package:meta/meta.dart';

import '../../models/user_portofolio_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  Future<void> fetchProfileData() async {
    try {
      emit(ProfileLoading());

      UserPortofolioModel? userPortofolioModel =
          await UserProfileApiService.fetchUserPortofolio();
      if (userPortofolioModel != null) {
        emit(ProfileSuccess(userPortofolio: userPortofolioModel));
      } else {
        emit(ProfileNoData());
      }
    } catch (e) {
      emit(ProfileFailure(errMessage: 'An error occurred: $e'));
    }
  }
}
