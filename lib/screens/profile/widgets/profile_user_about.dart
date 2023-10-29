import 'package:flutter/material.dart';
import 'package:job_finder_app/models/user_portofolio_model.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

class ProfileUserAbout extends StatelessWidget {
  const ProfileUserAbout({
    super.key,
    required this.model,
  });

  final UserPortofolioModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff6B7280),
                    fontFamily: AppFonts.kLoginHeadlineFont,
                  ),
                ),
                Positioned(
                  right: 1,
                  child: GestureDetector(
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Color(0xff3366FF),
                        fontSize: 14,
                        fontFamily: AppFonts.kLoginHeadlineFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'I\'m ${model.name}, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff6B7280),
              fontFamily: AppFonts.kLoginSubHeadlineFont,
            ),
          ),
        ],
      ),
    );
  }
}
