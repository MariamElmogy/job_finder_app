import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';

class WorkSuggestionsView extends StatelessWidget {
  const WorkSuggestionsView({super.key});

  static const String id = 'work_suggestions_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
          child: Column(
            children: const [
              Text(
                'What type of work are you interested in?',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff111827),
                  fontFamily: AppFonts.kOnBoardingHeadlineFont,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tell us what you’re interested in so we can customise the app for your needs.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff737379),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
