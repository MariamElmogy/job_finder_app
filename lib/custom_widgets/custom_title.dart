import 'package:flutter/cupertino.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 28,
            fontFamily: AppFonts.kRegisterHeadlineFont,
            color: AppColors.kRegisterHeadlines),
      ),
    );
  }
}
