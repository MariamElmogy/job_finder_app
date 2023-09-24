import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/custom_widgets/custom_textfield.dart';
import 'package:job_finder_app/services/user_api_service.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../models/user_model.dart';
import '../../../utils/app_images.dart';
import '../widgets/check_email.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    late String password;
    late String confirmPassword;

    UserModel userModel = UserModel();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create new password',
          style: TextStyle(
            fontSize: 28,
            fontFamily: AppFonts.kLoginHeadlineFont,
            color: AppColors.kLoginHeadlines,
          ),
        ),
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            'Set your new password so you can login and acces Jobsque',
            style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
              color: AppColors.kLoginSubHeadlines,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Enter your new password...',
                image: AppImages.kPassword,
                isPasswordCorrect: true,
                onSaved: (value) {
                  // password = 123
                  password = value!.trim();
                },
              ),
              CustomTextField(
                hintText: 'Rewrite your new password...',
                image: AppImages.kEmail,
                isPasswordCorrect: true,
                onSaved: (value) {
                  // confirmPassword = 666
                  confirmPassword = value!.trim();
                },
              ),
            ],
          ),
        ),
        CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();

              if (password == confirmPassword) {
                UserApiService.updatePassword(password: password.trim());
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CheckEmail();
                  },
                ));
              } else {
                // Passwords don't match, show an error message.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Passwords do not match.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            } else {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            }
          },
          text: 'Request password reset',
        ),
      ],
    );
  }
}
