import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/forget_password/widgets/reset_password_view.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.kSuccessAccount),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Check your Email',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppFonts.kRegisterHeadlineFont,
                  color: Color(0xff111827)),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'We have sent a reset password to your email address',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                  fontFamily: AppFonts.kRegisterHintFont,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: 'Get Started',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ResetPasswordView();
              },
            ));
          },
        ),
      ),
    );
  }
}
