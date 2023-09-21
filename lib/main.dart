import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';
import 'package:job_finder_app/screens/login/views/login_view.dart';
import 'package:job_finder_app/screens/register/views/register_view.dart';
import 'package:job_finder_app/screens/work_suggestions/views/work_suggestions_view.dart';
import 'package:job_finder_app/utils/app_colors.dart';

import 'screens/on_boarding/views/on_boarding_view.dart';
import 'screens/splash/views/splash_view.dart';

Future<void> main() async {
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
        LoginView.id: (context) => const LoginView(),
        WorkSuggestionsView.id: (context) => const WorkSuggestionsView(),
        HomeView.id: (context) => const HomeView(),
      },
      initialRoute: SplashView.id,
    );
  }
}
