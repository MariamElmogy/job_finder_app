import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:job_finder_app/utils/shared_prefs.dart';
import 'package:meta/meta.dart';

import '../../utils/constants.dart';

part 'cv_portfolio_state.dart';

class CvPortfolioCubit extends Cubit<CvPortfolioState> {
  CvPortfolioCubit() : super(CvPortfolioInitial());
  void uploadCvPortfolio({required File cvFile}) async {
    log('Loading..');
    Dio dio = Dio();

    dio.options.headers['Authorization'] = 'Bearer ${SharedPrefs().token}';
    emit(CvPortfolioLoading());

    FormData formData = FormData.fromMap({
      'cv_file': await MultipartFile.fromFile(cvFile.path),
      'image': await MultipartFile.fromFile(SharedPrefs().imgUrl),
    });
    try {
      final response = await dio.post(
        '$baseUrl/user/profile/portofolios',
        data: formData,
        options: Options(
          followRedirects: false,
        ),
      );

      if (response.statusCode == 200) {
        emit(CvPortfolioSuccess(cvFile));
      } else {
        // Handle the response or error here
        log('Request failed with status code: ${response.statusCode}');
        log('Response data: ${response.data}');
        emit(CvPortfolioFailure(errMessage: 'Response data: ${response.data}'));
      }
    } catch (e) {
      emit(CvPortfolioFailure(errMessage: 'Error: $e'));
    }
  }
}
