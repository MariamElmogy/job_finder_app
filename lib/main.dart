import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/register/views/register_view.dart';
import 'package:job_finder_app/screens/work_suggestions/views/work_suggestions_view.dart';
import 'package:job_finder_app/utils/app_colors.dart';

import 'screens/on_boarding/views/on_boarding_view.dart';
import 'screens/splash/views/splash_view.dart';

void main() {
  runApp(
    // DevicePreview(
    //   builder: (context) => const JobFinderApp(),
    // ),
    const JobFinderApp(),
  );
}

class JobFinderApp extends StatelessWidget {
  const JobFinderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Finder',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      // builder: DevicePreview.appBuilder,
      routes: {
        SplashView.id: (context) => const SplashView(),
        OnBoardingView.id: (context) => const OnBoardingView(),
        RegisterView.id: (context) => const RegisterView(),
        WorkSuggestionsView.id: (context) => const WorkSuggestionsView(),
      },
      initialRoute: RegisterView.id,
    );
  }
}
