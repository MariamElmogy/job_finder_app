import 'package:flutter/material.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:job_finder_app/services/favorites_api_service.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';

import '../../../utils/app_colors.dart';

class SavedJobs extends StatefulWidget {
  const SavedJobs({
    super.key,
    required this.job,
  });
  final FavoritesJobsModel job;

  @override
  State<SavedJobs> createState() => _SavedJobsState();
}

class _SavedJobsState extends State<SavedJobs> {
  @override
  Widget build(BuildContext context) {
    // Your timestamp string
    String timestampString = widget.job.created_at!;

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
              widget.job.job_image ?? '',
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            widget.job.job_name!,
            style: const TextStyle(
              color: Color(0xff111827),
              fontFamily: AppFonts.kLoginHeadlineFont,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            '${widget.job.comp_name} • ${showLocation(widget.job.location!)}',
            style: const TextStyle(
              color: Color(0xff374151),
              fontFamily: AppFonts.kLoginSubHeadlineFont,
              fontSize: 12,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 25, left: 25, top: 10, bottom: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: 48,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            MoreItem(jobToDelete: widget.job),
                          ],
                        ),
                      ),
                    );
                  },
                );
            },
            child: Image.asset(AppImages.kMore),
          ),
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

class MoreItem extends StatefulWidget {
  const MoreItem({
    super.key,
    required this.jobToDelete,
  });
  final FavoritesJobsModel jobToDelete;

  @override
  State<MoreItem> createState() => _MoreItemState();
}

class _MoreItemState extends State<MoreItem> {
  List<String> title = [
    'Apply Job',
    'Share via...',
    'Cancel save',
  ];

  List<String> image = [
    AppImages.kDirectbox,
    AppImages.kExport,
    AppImages.kArchive,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: title.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () async {
                if (title[index] == ('Cancel save')) {
                  await FavoritesApiService.cancelSaveFavoriteJob(
                      widget.jobToDelete);
                  setState(() {});
                }
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xffD1D5DB),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset(image[index]),
                      const SizedBox(width: 20),
                      Text(
                        title[index],
                        style: const TextStyle(
                          color: Color(0xff111827),
                          fontSize: 16,
                          fontFamily: AppFonts.kLoginHeadlineFont,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
