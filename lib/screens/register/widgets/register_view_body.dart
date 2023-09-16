import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/register/widgets/register_form.dart';

import '../../../custom_widgets/custom_subtitle.dart';
import '../../../custom_widgets/custom_title.dart';
import 'custom_register_app_bar.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomRegisterAppBar(),
          CustomTitle(title: 'Create Account'),
          CustomSubtitle(
              subtitle: 'Please create an account to find your dream job'),
          RegisterForm(),
        ],
      ),
    );
  }
}
