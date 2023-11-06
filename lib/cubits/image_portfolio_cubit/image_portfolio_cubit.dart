import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../screens/profile/edit_profile/widgets/image_service.dart';
import '../../utils/shared_prefs.dart';

part 'image_portfolio_state.dart';

class ImagePortfolioCubit extends Cubit<ImagePortfolioState> {
  ImagePortfolioCubit() : super(ImagePortfolioInitial());

  void uploadImage(ImageSource imageSource) async {
    try {
      emit(ImagePortfolioLoading());

      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      log("** Uploading file: ${pickedFile.toString()}");

      if (pickedFile != null) {
        var response = await ImageService.uploadFile(pickedFile.path);
        log("* Uploading file: ${pickedFile.path}");
        log("* Response: ${response.statusCode}");

        if (response.statusCode == 200) {
          log("Uploading file: ${pickedFile.path}");

          //get image url from api response
          final imageUrl = response.data['data']['image'];
          SharedPrefs().imgUrl = pickedFile.path;

          log("Response: $response");
          log('image: $imageUrl');

          log('Image uploaded successfully');
          emit(ImagePortfolioSuccess(imageUrl));
        } else {
          emit(ImagePortfolioFailure(
              errMessage: 'Error Code: ${response.statusCode}'));
        }
      } else {
        emit(ImagePortfolioFailure(errMessage: 'Error'));
      }
    } catch (e) {
      emit(ImagePortfolioFailure(errMessage: 'Error: $e'));
    }
  }
}
