import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/constants.dart';

class RecentJob extends StatelessWidget {
  const RecentJob({
    super.key,
    required this.job,
  });
  final JobsModel job;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                job.image ?? '',
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.name ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${job.comp_name} • ${showLocation(job.location ?? '')}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff374151),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.modulate,
              ),
              child: Image.asset(AppImages.kArchiveMinus),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.08,
                decoration: BoxDecoration(
                  color: const Color(0xffD6E4FF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    job.job_time_type ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff3366FF),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: '\$${showSalary(job.salary ?? '')}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff2E8E18),
                ),
                children: const [
                  TextSpan(
                    text: '/Month',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Divider(
            color: AppColors.kDividerColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
