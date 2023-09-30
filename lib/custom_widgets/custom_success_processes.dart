import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../utils/app_fonts.dart';

class CustomSuccessProcesses extends StatelessWidget {
  const CustomSuccessProcesses(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.buttonText,
      this.onPressed});
  final String title;
  final String subtitle;
  final String image;
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: AppFonts.kRegisterHeadlineFont,
                color: Color(0xff111827),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                subtitle,
                style: const TextStyle(
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
          text: buttonText,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
