import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/forget_password/widgets/reset_password_view_body.dart';

import '../../../utils/app_images.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(AppImages.kAppBarLogo),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: ResetPasswordViewBody(),
      )),
    );
  }
}
