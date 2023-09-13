import 'dart:ui';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class OnBoardingModel {
  String image;
  String headline1;
  String headline2;
  String headline3;
  Color headline1Color;
  Color headline2Color;
  Color headline3Color;
  String subtitle;

  OnBoardingModel({
    required this.image,
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline1Color,
    required this.headline2Color,
    required this.headline3Color,
    required this.subtitle,
  });
}

List<OnBoardingModel> content = <OnBoardingModel>[
  OnBoardingModel(
      image: AppImages.kOnBoarding1,
      headline1: 'Find a job, and ',
      headline2: 'start building',
      headline3: ' your career from now on',
      headline1Color: AppColors.kOnBoardingHeadline1,
      headline2Color: AppColors.kOnBoardingHeadline2,
      headline3Color: AppColors.kOnBoardingHeadline1,
      subtitle:
          'Explore over 25,924 available job roles and upgrade your operator now.'),
  OnBoardingModel(
      image: AppImages.kOnBoarding2,
      headline1: 'Hundreds of jobs ',
      headline2: 'are waiting for you to',
      headline3: ' join together',
      headline1Color: AppColors.kOnBoardingHeadline1,
      headline2Color: AppColors.kOnBoardingHeadline1,
      headline3Color: AppColors.kOnBoardingHeadline2,
      subtitle:
          'Immediately join us and start applying for the job you are interested in.'),
  OnBoardingModel(
      image: AppImages.kOnBoarding3,
      headline1: 'Get the best ',
      headline2: 'choice for the job ',
      headline3: ' you\'ve always dreamed of',
      headline1Color: AppColors.kOnBoardingHeadline1,
      headline2Color: AppColors.kOnBoardingHeadline2,
      headline3Color: AppColors.kOnBoardingHeadline1,
      subtitle:
          'The better the skills you have, the greater the good job opportunities for you.'),
];
