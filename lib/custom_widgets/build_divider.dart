import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class BuildDivier extends StatelessWidget {
  const BuildDivier({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.kDividerColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.kRegisterSubHeadlines,
              fontFamily: AppFonts.kRegisterHintFont,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.kDividerColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
