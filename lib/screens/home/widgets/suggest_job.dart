import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_finder_app/main.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:job_finder_app/services/favorites_api_service.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/jobs_model.dart';

class SuggestJob extends StatefulWidget {
  const SuggestJob({super.key, required this.job});
  final JobsModel job;

  @override
  State<SuggestJob> createState() => _SuggestJobState();
}

class _SuggestJobState extends State<SuggestJob> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<SavedJobProvider>(
      builder: (context, savedJobProvider, child) {
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
                      widget.job.image ?? '',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.job.name ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          '${widget.job.comp_name} • ${showLocation(widget.job.location ?? '')}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.kRegisterHints,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSaved = !isSaved; // toggle saved state
                      });

                      if (isSaved) {
                        FavoritesApiService.addFavoritesJobs(
                            job_id: widget.job.id.toString());
                      } else {
                          FavoritesApiService.deleteJob(widget.job);
                      }
                    },
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        isSaved ? Colors.blue : Colors.white,
                        BlendMode.modulate,
                      ),
                      child: Image.asset(AppImages.kArchiveMinus),
                    ),
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
                        widget.job.job_time_type ?? '',
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
                        text: '\$${showSalary(widget.job.salary ?? '')}',
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
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
      },
    );
  }
}
