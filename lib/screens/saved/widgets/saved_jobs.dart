import 'package:flutter/material.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';

import '../../../utils/app_colors.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({
    super.key,
    required this.job,
  });
  final FavoritesJobsModel job;

  @override
  Widget build(BuildContext context) {
    // Your timestamp string
    String timestampString = job.created_at!;

    // Parse the timestamp string into a DateTime object
    DateTime timestamp = DateTime.parse(timestampString);

    // Get the current date and time
    DateTime now = DateTime.now();

    // Calculate the difference between the two dates
    Duration difference = now.difference(timestamp);

    // Convert the difference into days
    int daysDifference = difference.inDays;

    // print("Days difference: $daysDifference days");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              job.job_image ?? '',
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            job.job_name!,
            style: const TextStyle(
              color: Color(0xff111827),
              fontFamily: AppFonts.kLoginHeadlineFont,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            '${job.comp_name} • ${showLocation(job.location!)}',
            style: const TextStyle(
              color: Color(0xff374151),
              fontFamily: AppFonts.kLoginSubHeadlineFont,
              fontSize: 12,
            ),
          ),
          trailing: Image.asset(AppImages.kMore),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Posted ${daysDifference.toString()} days ago',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff374151),
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.kClock,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Be an early applicant',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.kLoginSubHeadlineFont,
                      color: Color(0xff374151),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Divider(
            color: AppColors.kDividerColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
