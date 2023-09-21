import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';

import '../../../models/jobs_model.dart';

class SuggestJob extends StatelessWidget {
  const SuggestJob({super.key, required this.job});
  final JobsModel job;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff091A7A),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  job.image ?? '',
                  height: 40,
                  width: 40,
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
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${job.comp_name} • ${showLocation(job.location ?? '')}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.kRegisterHints,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.modulate,
                ),
                child: Image.asset(AppImages.kArchiveMinus),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.24,
                height: MediaQuery.of(context).size.width * 0.09,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.14),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    job.job_time_type ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 8),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: '\$${showSalary(job.salary ?? '')}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '/Month',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff3366FF),
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Apply now',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}
