import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/custom_widgets/custom_textfield.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../models/user_model.dart';
import '../../../utils/app_images.dart';
import '../views/forget_password_view.dart';
import '../widgets/check_email.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    late String email;
    UserModel userModel = UserModel();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reset Password',
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
            'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
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
          child: CustomTextField(
            hintText: 'Enter your email....',
            image: AppImages.kEmail,
            isPasswordCorrect: true,
            onSaved: (value) {
              email = value!.trim();
            },
          ),
        ),
        CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();

              getOtp(email: email.trim());
              // log('email =  ${email.trim()}');

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CheckEmail();
                },
              ));
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
