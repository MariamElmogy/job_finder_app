import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

class AuthAuthenticationOption extends StatelessWidget {
  const AuthAuthenticationOption({
    Key? key,
    required this.text,
    required this.action,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String action;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            color: AppColors.kSuggestion,
            fontSize: 14,
            fontFamily: AppFonts.kSuggestionFont,
          ),
          children: [
            const TextSpan(
              text: '  ',
            ),
            TextSpan(
              text: action,
              style: const TextStyle(
                color: AppColors.kSuggestionLogin,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.kSuggestionFont,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
