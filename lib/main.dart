import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';
import 'package:job_finder_app/screens/home/widgets/home_view_body.dart';
import 'package:job_finder_app/screens/login/views/login_view.dart';
import 'package:job_finder_app/screens/register/views/register_view.dart';
import 'package:job_finder_app/screens/work_location/views/work_location_options_view.dart';
import 'package:job_finder_app/screens/work_suggestions/views/type_of_work_suggestions_view.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

import 'cubits/profile_cubit/profile_cubit.dart';
import 'screens/on_boarding/views/on_boarding_view.dart';
import 'screens/splash/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs().init();

  runApp(const JobFinderApp());
}

class JobFinderApp extends StatelessWidget {
  const JobFinderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApplicationState()),
        BlocProvider(create: (context) => ProfileCubit()),
      ],
      child: MaterialApp(
        title: 'Job Finder',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.id: (context) => const SplashView(),
          OnBoardingView.id: (context) => const OnBoardingView(),
          RegisterView.id: (context) => const RegisterView(),
          LoginView.id: (context) => const LoginView(),
          TypeOfWorkSuggestionsView.id: (context) =>
              const TypeOfWorkSuggestionsView(),
          HomeView.id: (context) => const HomeView(),
          WorkLocationOptionsView.id: (context) =>
              const WorkLocationOptionsView(),
        },
        initialRoute: SplashView.id,
      ),
    );
  }
}
