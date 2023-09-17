import 'package:flutter/cupertino.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class CustomSubtitle extends StatelessWidget {
  const CustomSubtitle({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.kRegisterSubHeadlineFont,
          color: AppColors.kRegisterSubHeadlines,
        ),
      ),
    );
  }
}
