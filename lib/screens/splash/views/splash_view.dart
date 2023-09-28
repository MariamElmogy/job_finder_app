import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/on_boarding/views/on_boarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../../home/views/home_view.dart';
import '../widget/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String id = 'splash_view';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigationControl();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashViewBody();
  }

// home:
  void navigationControl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString(kEmail);
    // log(prefs.getString(kUserToken).toString());
    // log(prefs.getInt(kJobId).toString());
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext ctx) =>
                    email == null ? const OnBoardingView() :  HomeView()));
      },
    );
  }
}
